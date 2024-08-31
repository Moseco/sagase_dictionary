import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:drift/drift.dart';
import 'package:kana_kit/kana_kit.dart';
import 'package:meta/meta.dart';
import 'package:sagase_dictionary/src/database.dart';
import 'package:sagase_dictionary/src/datamodels/vocabs.dart';
import 'package:sagase_dictionary/src/utils/enum_utils.dart';
import 'package:sagase_dictionary/src/utils/enums.dart';
import 'package:xml/xml.dart';
import 'package:sagase_dictionary/src/utils/constants.dart';
import 'package:sagase_dictionary/src/utils/string_utils.dart';

class DictionaryBuilder {
  static final _kanaKit = const KanaKit().copyWithConfig(passRomaji: true);

  static final _simplifyNonVerbRegex = RegExp(r'(?<=.{1})(う|っ|ッ|ー)');
  static final _simplifyVerbRegex = RegExp(r'(?<=.{1})(ー|っ|ッ|(う(?=.)))');

  // Entry point for creating the dictionary
  static Future<void> createDictionary(
    AppDatabase db,
    String vocabDict,
    String kanjiDict,
    String radicals,
    String strokeData,
    String kanjiComponentData,
    String vocabLists,
    String kanjiLists,
    String pitchAccents,
    String frequencyList, {
    bool showProgress = false,
  }) async {
    // Set up
    await db.into(db.dictionaryInfos).insert(
          DictionaryInfosCompanion(
            version: Value(SagaseDictionaryConstants.dictionaryVersion),
          ),
        );

    // Vocab
    await DictionaryBuilder.createVocabDictionary(
      db,
      vocabDict,
      pitchAccents,
      frequencyList,
      showProgress: showProgress,
    );

    // Radicals
    await DictionaryBuilder.createRadicalDictionary(
      db,
      radicals,
      strokeData,
    );

    // Kanji
    await DictionaryBuilder.createKanjiDictionary(
      db,
      kanjiDict,
      kanjiComponentData,
      strokeData,
      showProgress: showProgress,
    );

    // Dictionary lists
    await DictionaryBuilder.createDictionaryLists(
      db,
      vocabLists,
      kanjiLists,
    );
  }

  // Creates the vocab database from the raw dictionary file
  @visibleForTesting
  static Future<void> createVocabDictionary(
    AppDatabase db,
    String vocabDict,
    String pitchAccents,
    String frequencyList, {
    bool showProgress = false,
  }) async {
    final List<VocabsCompanion> vocabList = [];
    final List<VocabWritingsCompanion> writings = [];
    final List<VocabReadingsCompanion> readings = [];
    final List<VocabDefinitionsCompanion> definitions = [];
    final List<VocabDefinitionWordsCompanion> definitionWords = [];

    final xmlVocabList =
        XmlDocument.parse(vocabDict).childElements.first.childElements.toList();

    // Top level of vocab items
    double progress = 0;
    for (int i = 0; i < xmlVocabList.length; i++) {
      if (showProgress) {
        double currentProgress = i / xmlVocabList.length;
        if (currentProgress != progress) {
          progress = currentProgress;
          stdout.write(
            '\rVocab progress ${(progress * 100).toStringAsFixed(0)}%',
          );
        }
      }

      var vocab = VocabsCompanion(common: Value(false));
      List<VocabWritingsCompanion> currentWritings = [];
      List<VocabReadingsCompanion> currentReadings = [];
      List<VocabDefinitionsCompanion> currentDefinitions = [];

      // Elements within vocab
      for (var xmlVocabChild in xmlVocabList[i].childElements) {
        switch (xmlVocabChild.name.local) {
          case 'ent_seq':
            vocab = vocab.copyWith(
              id: Value(int.parse(xmlVocabChild.innerText)),
            );
            break;
          case 'k_ele':
            final result = _handleWritingElements(xmlVocabChild.childElements);
            currentWritings.add(result.$1.copyWith(vocabId: vocab.id));
            vocab =
                vocab.copyWith(common: Value(vocab.common.value || result.$2));
            break;
          case 'r_ele':
            final result = _handleReadingElements(xmlVocabChild.childElements);
            currentReadings.add(result.$1.copyWith(vocabId: vocab.id));
            vocab =
                vocab.copyWith(common: Value(vocab.common.value || result.$2));
            break;
          case 'sense':
            currentDefinitions.add(
              _handleSenseElement(xmlVocabChild).copyWith(vocabId: vocab.id),
            );
            break;
        }
      }

      // Extract pos to general list if shared by all definitions (skip if single definition)
      if (currentDefinitions.length > 1) {
        if (currentDefinitions[0].pos.value != null) {
          outer:
          for (var pos in currentDefinitions[0].pos.value!) {
            for (int i = 1; i < currentDefinitions.length; i++) {
              if (!(currentDefinitions[i].pos.value?.contains(pos) ?? false)) {
                continue outer;
              }
            }
            if (vocab.pos.value == null) {
              vocab = vocab.copyWith(pos: Value([pos]));
            } else {
              vocab.pos.value!.add(pos);
            }
          }
          if (vocab.pos.value != null) {
            for (var pos in vocab.pos.value!) {
              for (int i = 0; i < currentDefinitions.length; i++) {
                currentDefinitions[i].pos.value?.remove(pos);
                if (currentDefinitions[i].pos.value?.isEmpty ?? false) {
                  currentDefinitions[i] =
                      currentDefinitions[i].copyWith(pos: Value.absent());
                }
              }
            }
          }
        }
      }

      // Create search form of writings
      for (int i = 0; i < currentWritings.length; i++) {
        final searchForm = _kanaKit.toHiragana(
            currentWritings[i].writing.value.toLowerCase().romajiToHalfWidth());
        if (searchForm != currentWritings[i].writing.value) {
          currentWritings[i] = currentWritings[i].copyWith(
            writingSearchForm: Value(searchForm),
          );
        }
      }

      // Create search form and romaji versions of readings
      for (int i = 0; i < currentReadings.length; i++) {
        // Search form
        String? searchForm =
            _kanaKit.toHiragana(currentReadings[i].reading.value);
        if (searchForm == currentReadings[i].reading.value) searchForm = null;

        // Romaji text
        final readingRomaji =
            _kanaKit.toRomaji(currentReadings[i].reading.value).toLowerCase();

        // Simplified romaji text (remove based on if verb or not)
        bool isVerb = false;
        if (vocab.pos.value != null) {
          for (final pos in vocab.pos.value!) {
            if (pos.isVerb()) {
              isVerb = true;
              break;
            }
          }
        }
        if (!isVerb && currentDefinitions[0].pos.value != null) {
          for (final pos in currentDefinitions[0].pos.value!) {
            if (pos.isVerb()) {
              isVerb = true;
              break;
            }
          }
        }

        String? romajiSimplified = _kanaKit
            .toRomaji(currentReadings[i].reading.value.replaceAll(
                isVerb ? _simplifyVerbRegex : _simplifyNonVerbRegex, ''))
            .toLowerCase();

        if (romajiSimplified.isEmpty || readingRomaji == romajiSimplified) {
          romajiSimplified = null;
        }

        currentReadings[i] = currentReadings[i].copyWith(
          readingSearchForm: Value.absentIfNull(searchForm),
          readingRomaji: Value(readingRomaji),
          readingRomajiSimplified: Value.absentIfNull(romajiSimplified),
        );
      }

      // Finally, add to lists
      vocabList.add(vocab);
      writings.addAll(currentWritings);
      readings.addAll(currentReadings);
      definitions.addAll(currentDefinitions);
      final words = currentDefinitions
          .map((e) => e.definition.value)
          .toList()
          .join('\n')
          .toLowerCase()
          .removeDiacritics()
          .splitWords()
          .toSet()
          .toList();
      for (final word in words) {
        definitionWords.add(VocabDefinitionWordsCompanion(
          word: Value(word),
          vocabId: vocab.id,
        ));
      }
    }

    // Write vocab to db
    await db.batch((batch) {
      batch.insertAll(db.vocabs, vocabList);
      batch.insertAll(db.vocabWritings, writings);
      batch.insertAll(db.vocabReadings, readings);
      batch.insertAll(db.vocabDefinitions, definitions);
      batch.insertAll(db.vocabDefinitionWords, definitionWords);
    });

    // Add pitch accents to vocab
    if (showProgress) stdout.write('\nPitch progress 0%');
    await db.transaction(() async {
      List<String> pitchLines = pitchAccents.split('\n');

      for (int i = 0; i < pitchLines.length; i++) {
        if (showProgress) {
          double currentProgress = i / pitchLines.length;
          if (currentProgress != progress) {
            progress = currentProgress;
            stdout.write(
              '\rPitch progress ${(progress * 100).toStringAsFixed(0)}%',
            );
          }
        }

        List<String> parts = pitchLines[i].split('\t');
        // Get info for pitch accent
        String? writing;
        String reading = parts[1].trim();
        if (reading.isEmpty) {
          reading = parts[0].trim();
        } else {
          writing = parts[0].trim();
        }
        parts[2] = parts[2].trim();

        // Skip if contains anything but digit or comma
        // There are some accents dependant on POS which are not handled
        if (parts[2].contains(RegExp(r'[^0-9,]'))) continue;

        late List<Vocab> results;
        if (writing == null) {
          results = await db.vocabsDao.getByReading(reading);
        } else {
          results = await db.vocabsDao.getByWritingAndReading(writing, reading);
        }

        // Add pitch accent info if the vocab writing/reading matches
        for (var result in results) {
          if ((writing == null &&
                  result.writings == null &&
                  result.readings[0].reading == reading) ||
              (writing != null &&
                  result.writings?[0].writing == writing &&
                  result.readings[0].reading == reading)) {
            List<int> pitchAccents = [];
            for (var pitchAccent in parts[2].split(',')) {
              pitchAccents.add(int.parse(pitchAccent.trim()));
            }

            if (pitchAccents.isNotEmpty) {
              await (db.update(db.vocabReadings)
                    ..where(
                      (reading) => reading.id.equals(result.readings[0].id),
                    ))
                  .write(
                VocabReadingsCompanion(
                  pitchAccents: Value(pitchAccents),
                ),
              );
            }
          }
        }
      }
    });

    // Add frequency information to vocab
    if (showProgress) stdout.write('\nFrequency progress 0%');
    await db.transaction(() async {
      final frequencyLines = frequencyList.split('\n');

      for (int i = 0; i < frequencyLines.length; i++) {
        if (showProgress) {
          double currentProgress = i / frequencyLines.length;
          if (currentProgress != progress) {
            progress = currentProgress;
            stdout.write(
              '\rFrequency progress ${(progress * 100).toStringAsFixed(0)}%',
            );
          }
        }
        List<String> parts = frequencyLines[i].split('\t');

        int score = int.parse(parts[0].trim());
        String lemma = parts[1].trim();

        List<Vocab> results = _kanaKit.isKana(lemma)
            ? await db.vocabsDao.getByReading(lemma)
            : await db.vocabsDao.getByWriting(lemma);

        for (var vocab in results) {
          // Don't replace a higher score
          if (vocab.frequencyScore > score) continue;

          bool updateVocab = false;
          if (_kanaKit.isKana(lemma)) {
            if (vocab.isUsuallyKanaAlone() || vocab.writings == null) {
              // Confirm lemma shows up in readings (prevents kana conversion problems)
              for (var reading in vocab.readings) {
                if (reading.reading == lemma) {
                  updateVocab = true;
                  break;
                }
              }
            }
          } else {
            // Confirm lemma shows up in writings (prevents kana conversion problems)
            for (var writing in vocab.writings!) {
              if (writing.writing == lemma) {
                updateVocab = true;
                break;
              }
            }
          }

          if (updateVocab) {
            await (db.update(db.vocabs)..where((v) => v.id.equals(vocab.id)))
                .write(
              VocabsCompanion(
                frequencyScore: Value(score),
              ),
            );
          }
        }
      }
    });

    // Complete cross references
    if (showProgress) stdout.write('\nCross reference progress 0%');
    await db.transaction(() async {
      final definitionsWithCrossReferences =
          await (db.select(db.vocabDefinitions)
                ..where((r) => r.crossReferences.isNotNull()))
              .get();

      for (int i = 0; i < definitionsWithCrossReferences.length; i++) {
        if (showProgress) {
          double currentProgress = i / definitionsWithCrossReferences.length;
          if (currentProgress != progress) {
            progress = currentProgress;
            stdout.write(
              '\rCross reference progress ${(progress * 100).toStringAsFixed(0)}%',
            );
          }
        }

        final definition = definitionsWithCrossReferences[i];
        if (definition.crossReferences == null) continue;
        List<VocabReference> newCrossReferences = [];
        for (final crossReference in definition.crossReferences!) {
          List<String> splits = crossReference.text.split('・');
          String updatedText = splits[0];

          // Get writing and/or reading
          String? writing;
          String? reading;
          if (_kanaKit.isKana(splits[0])) {
            reading = splits[0];
          } else {
            writing = splits[0];
          }
          if (splits.length > 1 && int.tryParse(splits[1]) == null) {
            if (_kanaKit.isKana(splits[1])) {
              reading = splits[1];
            } else {
              writing = splits[1];
            }
          }

          // Search based on what we have
          late List<Vocab> results;
          if (writing == null) {
            results = await db.vocabsDao.getByReading(reading!);
          } else {
            if (reading == null) {
              results = await db.vocabsDao.getByWriting(writing);
            } else {
              results =
                  await db.vocabsDao.getByWritingAndReading(writing, reading);
            }
          }

          results.sort(_compareVocab);

          List<int>? ids;
          if (results.isEmpty) {
            // Do nothing
          } else if (results.length == 1) {
            ids = [results[0].id];
          } else {
            List<Vocab> filtered = List.from(results);

            // If only reading given, try to filter
            if (writing == null) {
              for (int j = 0; j < filtered.length; j++) {
                if (filtered[j].writings?[0].writing != null &&
                    !filtered[j].isUsuallyKanaAlone()) {
                  filtered.removeAt(j--);
                }
              }
            }

            if (filtered.isNotEmpty) {
              ids = filtered.map((e) => e.id).toList();
            } else {
              ids = results.map((e) => e.id).toList();
            }
          }
          newCrossReferences.add(VocabReference(ids: ids, text: updatedText));
        }

        await (db.update(db.vocabDefinitions)
              ..where((r) => r.id.equals(definition.id)))
            .write(
          VocabDefinitionsCompanion(
            crossReferences: Value(newCrossReferences),
          ),
        );
      }
    });

    // Complete antonyms
    if (showProgress) stdout.write('\nAntonym progress 0%');
    await db.transaction(() async {
      final definitionsWithAntonyms = await (db.select(db.vocabDefinitions)
            ..where((r) => r.antonyms.isNotNull()))
          .get();

      for (int i = 0; i < definitionsWithAntonyms.length; i++) {
        if (showProgress) {
          double currentProgress = i / definitionsWithAntonyms.length;
          if (currentProgress != progress) {
            progress = currentProgress;
            stdout.write(
              '\rAntonym progress ${(progress * 100).toStringAsFixed(0)}%',
            );
          }
        }

        final definition = definitionsWithAntonyms[i];
        if (definition.antonyms == null) continue;
        List<VocabReference> newAntonyms = [];
        for (final antonym in definition.antonyms!) {
          List<String> splits = antonym.text.split('・');
          String updatedText = splits[0];

          // Get writing and/or reading
          String? writing;
          String? reading;
          if (_kanaKit.isKana(splits[0])) {
            reading = splits[0];
          } else {
            writing = splits[0];
          }
          if (splits.length > 1 && int.tryParse(splits[1]) == null) {
            if (_kanaKit.isKana(splits[1])) {
              reading = splits[1];
            } else {
              writing = splits[1];
            }
          }

          // Search based on what we have
          late List<Vocab> results;
          if (writing == null) {
            results = await db.vocabsDao.getByReading(reading!);
          } else {
            if (reading == null) {
              results = await db.vocabsDao.getByWriting(writing);
            } else {
              results =
                  await db.vocabsDao.getByWritingAndReading(writing, reading);
            }
          }

          results.sort(_compareVocab);

          List<int>? ids;
          if (results.isEmpty) {
            // Do nothing
          } else if (results.length == 1) {
            ids = [results[0].id];
          } else {
            List<Vocab> filtered = List.from(results);

            // If only reading given, try to filter
            if (writing == null) {
              for (int i = 0; i < filtered.length; i++) {
                if (filtered[i].writings?[0].writing != null &&
                    !filtered[i].isUsuallyKanaAlone()) {
                  filtered.removeAt(i--);
                }
              }
            }

            if (filtered.isNotEmpty) {
              ids = filtered.map((e) => e.id).toList();
            } else {
              ids = results.map((e) => e.id).toList();
            }
          }
          newAntonyms.add(VocabReference(ids: ids, text: updatedText));
        }

        await (db.update(db.vocabDefinitions)
              ..where((r) => r.id.equals(definition.id)))
            .write(
          VocabDefinitionsCompanion(
            antonyms: Value(newAntonyms),
          ),
        );
      }
    });
  }

  static (VocabWritingsCompanion, bool) _handleWritingElements(
    Iterable<XmlElement> elements,
  ) {
    var vocabWriting = VocabWritingsCompanion();
    List<WritingInfo>? info;
    bool common = false;

    for (var writingElement in elements) {
      switch (writingElement.name.local) {
        case 'keb':
          vocabWriting = vocabWriting.copyWith(
            writing: Value(writingElement.innerText),
          );
          break;
        case 'ke_inf':
          info ??= [];
          info.add(_handleWritingInfo(writingElement.innerText)!);
          break;
        case 'ke_pri':
          common = common || _handleVocabPriorityInfo(writingElement.innerText);
          break;
      }
    }

    return (
      vocabWriting.copyWith(info: Value.absentIfNull(info)),
      common,
    );
  }

  static WritingInfo? _handleWritingInfo(String writingInfo) {
    switch (writingInfo) {
      case '&ateji;':
        return WritingInfo.ateji;
      case '&ik;':
        return WritingInfo.irregularKana;
      case '&iK;':
        return WritingInfo.irregularKanji;
      case '&io;':
        return WritingInfo.irregularOkurigana;
      case '&oK;':
        return WritingInfo.outdatedKanji;
      case '&rK;':
        return WritingInfo.rareKanjiForm;
      case '&sK;':
        return WritingInfo.searchOnlyForm;
      default:
        return null;
    }
  }

  static bool _handleVocabPriorityInfo(String text) {
    // Ignoring ichi2 and gai2
    return text == 'news1' ||
        text == 'news2' ||
        text == 'ichi1' ||
        text == 'spec1' ||
        text == 'spec2' ||
        text == 'gai1';
  }

  static (VocabReadingsCompanion, bool) _handleReadingElements(
    Iterable<XmlElement> elements,
  ) {
    var vocabReading = VocabReadingsCompanion();
    List<ReadingInfo>? info;
    List<String>? associatedWritings;
    bool common = false;

    for (var readingElement in elements) {
      switch (readingElement.name.local) {
        case 'reb':
          vocabReading = vocabReading.copyWith(
            reading: Value(readingElement.innerText),
          );
          break;
        case 're_nokanji':
          // If present, represents that the reading isn't fully associated with the kanji
          break;
        case 're_restr':
          associatedWritings ??= [];
          associatedWritings.add(readingElement.innerText);
          break;
        case 're_inf':
          info ??= [];
          info.add(_handleReadingInfo(readingElement.innerText)!);
          break;
        case 're_pri':
          common = _handleVocabPriorityInfo(readingElement.innerText);
          break;
      }
    }

    return (
      vocabReading.copyWith(
        info: Value.absentIfNull(info),
        associatedWritings: Value.absentIfNull(associatedWritings),
      ),
      common
    );
  }

  static ReadingInfo? _handleReadingInfo(String readingInfo) {
    switch (readingInfo) {
      case '&gikun;':
        return ReadingInfo.gikun;
      case '&ik;':
        return ReadingInfo.irregularKana;
      case '&ok;':
        return ReadingInfo.outdatedKana;
      case '&sk;':
        return ReadingInfo.searchOnlyForm;
      default:
        return null;
    }
  }

  static VocabDefinitionsCompanion _handleSenseElement(
    XmlElement xmlElement,
  ) {
    List<String> definitions = [];
    List<PartOfSpeech>? partsOfSpeech;
    String? additionalInfo;
    List<String>? appliesTo;
    List<Field>? fields;
    List<MiscellaneousInfo>? miscInfo;
    List<Dialect>? dialects;
    List<VocabExample>? examples;
    List<LanguageSource>? languageSource;
    bool waseieigo = false;
    List<VocabReference>? crossReferences;
    List<VocabReference>? antonyms;

    for (var senseElement in xmlElement.childElements) {
      switch (senseElement.name.local) {
        case 'stagk':
          appliesTo ??= [];
          appliesTo.add(senseElement.innerText);
          break;
        case 'stagr':
          appliesTo ??= [];
          appliesTo.add(senseElement.innerText);
          break;
        case 'pos':
          partsOfSpeech ??= [];
          partsOfSpeech.add(_handlePartOfSpeechElement(senseElement.innerText));
          break;
        case 'xref':
          crossReferences ??= [];
          crossReferences.add(
            VocabReference(
              ids: null,
              text: senseElement.innerText,
            ),
          );
          break;
        case 'ant':
          antonyms ??= [];
          antonyms.add(
            VocabReference(
              ids: null,
              text: senseElement.innerText,
            ),
          );
          break;
        case 'field':
          final field = _handleFieldElement(senseElement.innerText);
          fields ??= [];
          fields.add(field!);
          break;
        case 'misc':
          final misc = _handleMiscElement(senseElement.innerText);
          miscInfo ??= [];
          miscInfo.add(misc!);
          break;
        case 's_inf':
          additionalInfo = senseElement.innerText;
          break;
        case 'lsource':
          languageSource ??= [];
          waseieigo =
              _handleLanguageSourceElement(senseElement, languageSource);
          break;
        case 'dial':
          final dialect = _handleDialectElement(senseElement.innerText);
          dialects ??= [];
          dialects.add(dialect!);
          break;
        case 'gloss':
          definitions.add(senseElement.innerText);
          break;
        case 'example':
          examples ??= [];
          examples.add(_handleExampleElement(senseElement));
          break;
      }
    }

    return VocabDefinitionsCompanion(
      definition: Value(definitions.join('; ')),
      additionalInfo: Value.absentIfNull(additionalInfo),
      pos: Value.absentIfNull(partsOfSpeech),
      appliesTo: Value.absentIfNull(appliesTo),
      fields: Value.absentIfNull(fields),
      miscInfo: Value.absentIfNull(miscInfo),
      dialects: Value.absentIfNull(dialects),
      examples: Value.absentIfNull(examples),
      languageSource: Value.absentIfNull(languageSource),
      waseieigo: Value(waseieigo),
      crossReferences: Value.absentIfNull(crossReferences),
      antonyms: Value.absentIfNull(antonyms),
    );
  }

  static VocabExample _handleExampleElement(XmlElement xmlElement) {
    late String japaneseText;
    late String englishText;

    for (var element in xmlElement.childElements) {
      if (element.name.local == 'ex_sent') {
        if (element.getAttribute('xml:lang') == 'jpn') {
          japaneseText = element.innerText;
        } else {
          englishText = element.innerText;
        }
      }
    }

    return VocabExample(
      japanese: japaneseText,
      english: englishText,
    );
  }

  static PartOfSpeech _handlePartOfSpeechElement(String partOfSpeech) {
    switch (partOfSpeech) {
      case "&adj-f;":
        return PartOfSpeech.adjectiveF;
      case "&adj-i;":
        return PartOfSpeech.adjectiveI;
      case "&adj-ix;":
        return PartOfSpeech.adjectiveIx;
      case "&adj-kari;":
        return PartOfSpeech.adjectiveKari;
      case "&adj-ku;":
        return PartOfSpeech.adjectiveKu;
      case "&adj-na;":
        return PartOfSpeech.adjectiveNa;
      case "&adj-nari;":
        return PartOfSpeech.adjectiveNari;
      case "&adj-no;":
        return PartOfSpeech.adjectiveNo;
      case "&adj-pn;":
        return PartOfSpeech.adjectivePn;
      case "&adj-shiku;":
        return PartOfSpeech.adjectiveShiku;
      case "&adj-t;":
        return PartOfSpeech.adjectiveT;
      case "&adv;":
        return PartOfSpeech.adverb;
      case "&adv-to;":
        return PartOfSpeech.adverbTo;
      case "&aux;":
        return PartOfSpeech.auxiliary;
      case "&aux-adj;":
        return PartOfSpeech.auxiliaryAdj;
      case "&aux-v;":
        return PartOfSpeech.auxiliaryV;
      case "&conj;":
        return PartOfSpeech.conjunction;
      case "&cop;":
        return PartOfSpeech.copula;
      case "&ctr;":
        return PartOfSpeech.counter;
      case "&exp;":
        return PartOfSpeech.expressions;
      case "&int;":
        return PartOfSpeech.interjection;
      case "&n;":
        return PartOfSpeech.noun;
      case "&n-adv;":
        return PartOfSpeech.nounAdverbial;
      case "&n-pr;":
        return PartOfSpeech.nounProper;
      case "&n-pref;":
        return PartOfSpeech.nounPrefix;
      case "&n-suf;":
        return PartOfSpeech.nounSuffix;
      case "&n-t;":
        return PartOfSpeech.nounTemporal;
      case "&num;":
        return PartOfSpeech.numeric;
      case "&pn;":
        return PartOfSpeech.pronoun;
      case "&pref;":
        return PartOfSpeech.prefix;
      case "&prt;":
        return PartOfSpeech.particle;
      case "&suf;":
        return PartOfSpeech.suffix;
      case "&unc;":
        return PartOfSpeech.unclassified;
      case "&v-unspec;":
        return PartOfSpeech.verb;
      case "&v1;":
        return PartOfSpeech.verbIchidan;
      case "&v1-s;":
        return PartOfSpeech.verbIchidanS;
      case "&v2a-s;":
        return PartOfSpeech.verbNidanAS;
      case "&v2b-k;":
        return PartOfSpeech.verbNidanBK;
      case "&v2b-s;":
        return PartOfSpeech.verbNidanBS;
      case "&v2d-k;":
        return PartOfSpeech.verbNidanDK;
      case "&v2d-s;":
        return PartOfSpeech.verbNidanDS;
      case "&v2g-k;":
        return PartOfSpeech.verbNidanGK;
      case "&v2g-s;":
        return PartOfSpeech.verbNidanGS;
      case "&v2h-k;":
        return PartOfSpeech.verbNidanHK;
      case "&v2h-s;":
        return PartOfSpeech.verbNidanHS;
      case "&v2k-k;":
        return PartOfSpeech.verbNidanKK;
      case "&v2k-s;":
        return PartOfSpeech.verbNidanKS;
      case "&v2m-k;":
        return PartOfSpeech.verbNidanMK;
      case "&v2m-s;":
        return PartOfSpeech.verbNidanMS;
      case "&v2n-s;":
        return PartOfSpeech.verbNidanNS;
      case "&v2r-k;":
        return PartOfSpeech.verbNidanRK;
      case "&v2r-s;":
        return PartOfSpeech.verbNidanRS;
      case "&v2s-s;":
        return PartOfSpeech.verbNidanSS;
      case "&v2t-k;":
        return PartOfSpeech.verbNidanTK;
      case "&v2t-s;":
        return PartOfSpeech.verbNidanTS;
      case "&v2w-s;":
        return PartOfSpeech.verbNidanWS;
      case "&v2y-k;":
        return PartOfSpeech.verbNidanYK;
      case "&v2y-s;":
        return PartOfSpeech.verbNidanYS;
      case "&v2z-s;":
        return PartOfSpeech.verbNidanZS;
      case "&v4b;":
        return PartOfSpeech.verbYodanB;
      case "&v4g;":
        return PartOfSpeech.verbYodanG;
      case "&v4h;":
        return PartOfSpeech.verbYodanH;
      case "&v4k;":
        return PartOfSpeech.verbYodanK;
      case "&v4m;":
        return PartOfSpeech.verbYodanM;
      case "&v4n;":
        return PartOfSpeech.verbYodanN;
      case "&v4r;":
        return PartOfSpeech.verbYodanR;
      case "&v4s;":
        return PartOfSpeech.verbYodanS;
      case "&v4t;":
        return PartOfSpeech.verbYodanT;
      case "&v5aru;":
        return PartOfSpeech.verbGodanAru;
      case "&v5b;":
        return PartOfSpeech.verbGodanB;
      case "&v5g;":
        return PartOfSpeech.verbGodanG;
      case "&v5k;":
        return PartOfSpeech.verbGodanK;
      case "&v5k-s;":
        return PartOfSpeech.verbGodanKS;
      case "&v5m;":
        return PartOfSpeech.verbGodanM;
      case "&v5n;":
        return PartOfSpeech.verbGodanN;
      case "&v5r;":
        return PartOfSpeech.verbGodanR;
      case "&v5r-i;":
        return PartOfSpeech.verbGodanRI;
      case "&v5s;":
        return PartOfSpeech.verbGodanS;
      case "&v5t;":
        return PartOfSpeech.verbGodanT;
      case "&v5u;":
        return PartOfSpeech.verbGodanU;
      case "&v5u-s;":
        return PartOfSpeech.verbGodanUS;
      case "&v5uru;":
        return PartOfSpeech.verbGodanUru;
      case "&vi;":
        return PartOfSpeech.verbIntransitive;
      case "&vk;":
        return PartOfSpeech.verbKuru;
      case "&vn;":
        return PartOfSpeech.verbIrregularN;
      case "&vr;":
        return PartOfSpeech.verbIrregularR;
      case "&vs;":
        return PartOfSpeech.verbSuru;
      case "&vs-c;":
        return PartOfSpeech.verbSu;
      case "&vs-i;":
        return PartOfSpeech.verbSuruIncluded;
      case "&vs-s;":
        return PartOfSpeech.verbSuruSpecial;
      case "&vt;":
        return PartOfSpeech.verbTransitive;
      case "&vz;":
        return PartOfSpeech.verbIchidanZuru;
      default:
        print('Unknown part-of-speech');
        return PartOfSpeech.unknown;
    }
  }

  static Field? _handleFieldElement(String field) {
    switch (field) {
      case '&agric;':
        return Field.agriculture;
      case '&anat;':
        return Field.anatomy;
      case '&archeol;':
        return Field.archeology;
      case '&archit;':
        return Field.architecture;
      case '&art;':
        return Field.artAesthetics;
      case '&astron;':
        return Field.astronomy;
      case '&audvid;':
        return Field.audiovisual;
      case '&aviat;':
        return Field.aviation;
      case '&baseb;':
        return Field.baseball;
      case '&biochem;':
        return Field.biochemistry;
      case '&biol;':
        return Field.biology;
      case '&bot;':
        return Field.botany;
      case '&Buddh;':
        return Field.buddhism;
      case '&bus;':
        return Field.business;
      case '&cards;':
        return Field.cardGames;
      case '&chem;':
        return Field.chemistry;
      case '&Christn;':
        return Field.christianity;
      case '&cloth;':
        return Field.clothing;
      case '&comp;':
        return Field.computing;
      case '&cryst;':
        return Field.crystallography;
      case '&dent;':
        return Field.dentistry;
      case '&ecol;':
        return Field.ecology;
      case '&econ;':
        return Field.economics;
      case '&elec;':
        return Field.electricityElecEng;
      case '&electr;':
        return Field.electronics;
      case '&embryo;':
        return Field.embryology;
      case '&engr;':
        return Field.engineering;
      case '&ent;':
        return Field.entomology;
      case '&film;':
        return Field.film;
      case '&finc;':
        return Field.finance;
      case '&fish;':
        return Field.fishing;
      case '&food;':
        return Field.foodCooking;
      case '&gardn;':
        return Field.gardening;
      case '&genet;':
        return Field.genetics;
      case '&geogr;':
        return Field.geography;
      case '&geol;':
        return Field.geology;
      case '&geom;':
        return Field.geometry;
      case '&go;':
        return Field.go;
      case '&golf;':
        return Field.golf;
      case '&gramm;':
        return Field.grammar;
      case '&grmyth;':
        return Field.greekMythology;
      case '&hanaf;':
        return Field.hanafuda;
      case '&horse;':
        return Field.horseRacing;
      case '&kabuki;':
        return Field.kabuki;
      case '&law;':
        return Field.law;
      case '&ling;':
        return Field.linguistics;
      case '&logic;':
        return Field.logic;
      case '&MA;':
        return Field.martialArts;
      case '&mahj;':
        return Field.mahjong;
      case '&manga;':
        return Field.manga;
      case '&math;':
        return Field.mathematics;
      case '&mech;':
        return Field.mechanicalEngineering;
      case '&med;':
        return Field.medicine;
      case '&met;':
        return Field.meteorology;
      case '&mil;':
        return Field.military;
      case '&mining;':
        return Field.mining;
      case '&music;':
        return Field.music;
      case '&noh;':
        return Field.noh;
      case '&ornith;':
        return Field.ornithology;
      case '&paleo;':
        return Field.paleontology;
      case '&pathol;':
        return Field.pathology;
      case '&pharm;':
        return Field.pharmacology;
      case '&phil;':
        return Field.philosophy;
      case '&photo;':
        return Field.photography;
      case '&physics;':
        return Field.physics;
      case '&physiol;':
        return Field.physiology;
      case '&politics;':
        return Field.politics;
      case '&print;':
        return Field.printing;
      case '&psy;':
        return Field.psychiatry;
      case '&psyanal;':
        return Field.psychoanalysis;
      case '&psych;':
        return Field.psychology;
      case '&rail;':
        return Field.railway;
      case '&rommyth;':
        return Field.romanMythology;
      case '&Shinto;':
        return Field.shinto;
      case '&shogi;':
        return Field.shogi;
      case '&ski;':
        return Field.skiing;
      case '&sports;':
        return Field.sports;
      case '&stat;':
        return Field.statistics;
      case '&stockm;':
        return Field.stockMarket;
      case '&sumo;':
        return Field.sumo;
      case '&telec;':
        return Field.telecommunications;
      case '&tradem;':
        return Field.trademark;
      case '&tv;':
        return Field.television;
      case '&vidg;':
        return Field.videoGames;
      case '&zool;':
        return Field.zoology;
      default:
        return null;
    }
  }

  static MiscellaneousInfo? _handleMiscElement(String miscellaneousInfo) {
    switch (miscellaneousInfo) {
      case '&abbr;':
        return MiscellaneousInfo.abbreviation;
      case '&arch;':
        return MiscellaneousInfo.archaism;
      case '&char;':
        return MiscellaneousInfo.character;
      case '&chn;':
        return MiscellaneousInfo.childrensLanguage;
      case '&col;':
        return MiscellaneousInfo.colloquialism;
      case '&company;':
        return MiscellaneousInfo.companyName;
      case '&creat;':
        return MiscellaneousInfo.creature;
      case '&dated;':
        return MiscellaneousInfo.datedTerm;
      case '&dei;':
        return MiscellaneousInfo.deity;
      case '&derog;':
        return MiscellaneousInfo.derogatory;
      case '&doc;':
        return MiscellaneousInfo.document;
      case '&euph;':
        return MiscellaneousInfo.euphemistic;
      case '&ev;':
        return MiscellaneousInfo.event;
      case '&fam;':
        return MiscellaneousInfo.familiarLanguage;
      case '&fem;':
        return MiscellaneousInfo.femaleLanguage;
      case '&fict;':
        return MiscellaneousInfo.fiction;
      case '&form;':
        return MiscellaneousInfo.formalOrLiteraryTerm;
      case '&given;':
        return MiscellaneousInfo.givenName;
      case '&group;':
        return MiscellaneousInfo.group;
      case '&hist;':
        return MiscellaneousInfo.historicalTerm;
      case '&hon;':
        return MiscellaneousInfo.honorificOrRespectful;
      case '&hum;':
        return MiscellaneousInfo.humbleLanguage;
      case '&id;':
        return MiscellaneousInfo.idiomaticExpression;
      case '&joc;':
        return MiscellaneousInfo.humorousTerm;
      case '&leg;':
        return MiscellaneousInfo.legend;
      case '&m-sl;':
        return MiscellaneousInfo.mangaSlang;
      case '&male;':
        return MiscellaneousInfo.maleLanguage;
      case '&myth;':
        return MiscellaneousInfo.mythology;
      case '&net-sl;':
        return MiscellaneousInfo.internetSlang;
      case '&obj;':
        return MiscellaneousInfo.object;
      case '&obs;':
        return MiscellaneousInfo.obsoleteTerm;
      case '&on-mim;':
        return MiscellaneousInfo.onomatopoeicOrMimeticWord;
      case '&organization;':
        return MiscellaneousInfo.organizationName;
      case '&oth;':
        return MiscellaneousInfo.other;
      case '&person;':
        return MiscellaneousInfo.particularPerson;
      case '&place;':
        return MiscellaneousInfo.placeName;
      case '&poet;':
        return MiscellaneousInfo.poeticalTerm;
      case '&pol;':
        return MiscellaneousInfo.politeLanguage;
      case '&product;':
        return MiscellaneousInfo.productName;
      case '&proverb;':
        return MiscellaneousInfo.proverb;
      case '&quote;':
        return MiscellaneousInfo.quotation;
      case '&rare;':
        return MiscellaneousInfo.rare;
      case '&relig;':
        return MiscellaneousInfo.religion;
      case '&sens;':
        return MiscellaneousInfo.sensitive;
      case '&serv;':
        return MiscellaneousInfo.service;
      case '&ship;':
        return MiscellaneousInfo.shipName;
      case '&sl;':
        return MiscellaneousInfo.slang;
      case '&station;':
        return MiscellaneousInfo.railwayStation;
      case '&surname;':
        return MiscellaneousInfo.surname;
      case '&uk;':
        return MiscellaneousInfo.usuallyKanaAlone;
      case '&unclass;':
        return MiscellaneousInfo.unclassifiedName;
      case '&vulg;':
        return MiscellaneousInfo.vulgar;
      case '&work;':
        return MiscellaneousInfo.workOfArt;
      case '&X;':
        return MiscellaneousInfo.rudeOrXRatedTerm;
      case '&yoji;':
        return MiscellaneousInfo.yojijukugo;
      default:
        return null;
    }
  }

  static Dialect? _handleDialectElement(String dialect) {
    switch (dialect) {
      case '&bra;':
        return Dialect.brazilian;
      case '&hob;':
        return Dialect.hokkaidoBen;
      case '&ksb;':
        return Dialect.kansaiBen;
      case '&ktb;':
        return Dialect.kantouBen;
      case '&kyb;':
        return Dialect.kyotoBen;
      case '&kyu;':
        return Dialect.kyuushuuBen;
      case '&nab;':
        return Dialect.naganoBen;
      case '&osb;':
        return Dialect.osakaBen;
      case '&rkb;':
        return Dialect.ryuukyuuBen;
      case '&thb;':
        return Dialect.touhokuBen;
      case '&tsb;':
        return Dialect.tosaBen;
      case '&tsug;':
        return Dialect.tsugaruBen;
      default:
        return null;
    }
  }

  static bool _handleLanguageSourceElement(
    XmlElement xmlElement,
    List<LanguageSource> languageSource,
  ) {
    switch (xmlElement.getAttribute('xml:lang')) {
      case 'afr':
        languageSource.add(LanguageSource.afr);
        break;
      case 'ain':
        languageSource.add(LanguageSource.ain);
        break;
      case 'alg':
        languageSource.add(LanguageSource.alg);
        break;
      case 'amh':
        languageSource.add(LanguageSource.amh);
        break;
      case 'ara':
        languageSource.add(LanguageSource.ara);
        break;
      case 'arn':
        languageSource.add(LanguageSource.arn);
        break;
      case 'bnt':
        languageSource.add(LanguageSource.bnt);
        break;
      case 'bre':
        languageSource.add(LanguageSource.bre);
        break;
      case 'bul':
        languageSource.add(LanguageSource.bul);
        break;
      case 'bur':
        languageSource.add(LanguageSource.bur);
        break;
      case 'chi':
        languageSource.add(LanguageSource.chi);
        break;
      case 'chn':
        languageSource.add(LanguageSource.chn);
        break;
      case 'cze':
        languageSource.add(LanguageSource.cze);
        break;
      case 'dan':
        languageSource.add(LanguageSource.dan);
        break;
      case 'dut':
        languageSource.add(LanguageSource.dut);
        break;
      case 'eng':
        languageSource.add(LanguageSource.eng);
        break;
      case 'epo':
        languageSource.add(LanguageSource.epo);
        break;
      case 'est':
        languageSource.add(LanguageSource.est);
        break;
      case 'fil':
        languageSource.add(LanguageSource.fil);
        break;
      case 'fin':
        languageSource.add(LanguageSource.fin);
        break;
      case 'fre':
        languageSource.add(LanguageSource.fre);
        break;
      case 'geo':
        languageSource.add(LanguageSource.geo);
        break;
      case 'ger':
        languageSource.add(LanguageSource.ger);
        break;
      case 'glg':
        languageSource.add(LanguageSource.glg);
        break;
      case 'grc':
        languageSource.add(LanguageSource.grc);
        break;
      case 'gre':
        languageSource.add(LanguageSource.gre);
        break;
      case 'haw':
        languageSource.add(LanguageSource.haw);
        break;
      case 'heb':
        languageSource.add(LanguageSource.heb);
        break;
      case 'hin':
        languageSource.add(LanguageSource.hin);
        break;
      case 'hun':
        languageSource.add(LanguageSource.hun);
        break;
      case 'ice':
        languageSource.add(LanguageSource.ice);
        break;
      case 'ind':
        languageSource.add(LanguageSource.ind);
        break;
      case 'ita':
        languageSource.add(LanguageSource.ita);
        break;
      case 'khm':
        languageSource.add(LanguageSource.khm);
        break;
      case 'kor':
        languageSource.add(LanguageSource.kor);
        break;
      case 'kur':
        languageSource.add(LanguageSource.kur);
        break;
      case 'lat':
        languageSource.add(LanguageSource.lat);
        break;
      case 'lit':
        languageSource.add(LanguageSource.lit);
        break;
      case 'mal':
        languageSource.add(LanguageSource.mal);
        break;
      case 'mao':
        languageSource.add(LanguageSource.mao);
        break;
      case 'may':
        languageSource.add(LanguageSource.may);
        break;
      case 'mnc':
        languageSource.add(LanguageSource.mnc);
        break;
      case 'mol':
        languageSource.add(LanguageSource.mol);
        break;
      case 'mon':
        languageSource.add(LanguageSource.mon);
        break;
      case 'nor':
        languageSource.add(LanguageSource.nor);
        break;
      case 'per':
        languageSource.add(LanguageSource.per);
        break;
      case 'pol':
        languageSource.add(LanguageSource.pol);
        break;
      case 'por':
        languageSource.add(LanguageSource.por);
        break;
      case 'rum':
        languageSource.add(LanguageSource.rum);
        break;
      case 'rus':
        languageSource.add(LanguageSource.rus);
        break;
      case 'san':
        languageSource.add(LanguageSource.san);
        break;
      case 'scr':
        languageSource.add(LanguageSource.scr);
        break;
      case 'slo':
        languageSource.add(LanguageSource.slo);
        break;
      case 'slv':
        languageSource.add(LanguageSource.slv);
        break;
      case 'som':
        languageSource.add(LanguageSource.som);
        break;
      case 'spa':
        languageSource.add(LanguageSource.spa);
        break;
      case 'swa':
        languageSource.add(LanguageSource.swa);
        break;
      case 'swe':
        languageSource.add(LanguageSource.swe);
        break;
      case 'tah':
        languageSource.add(LanguageSource.tah);
        break;
      case 'tam':
        languageSource.add(LanguageSource.tam);
        break;
      case 'tgl':
        languageSource.add(LanguageSource.tgl);
        break;
      case 'tha':
        languageSource.add(LanguageSource.tha);
        break;
      case 'tib':
        languageSource.add(LanguageSource.tib);
        break;
      case 'tur':
        languageSource.add(LanguageSource.tur);
        break;
      case 'ukr':
        languageSource.add(LanguageSource.ukr);
        break;
      case 'urd':
        languageSource.add(LanguageSource.urd);
        break;
      case 'vie':
        languageSource.add(LanguageSource.vie);
        break;
      case 'yid':
        languageSource.add(LanguageSource.yid);
        break;
      case null:
        languageSource.add(LanguageSource.eng);
        break;
      default:
        print(
            'Unsupported language source ${xmlElement.getAttribute('xml:lang')}');
        break;
    }

    return xmlElement.getAttribute('ls_wasei') == 'y';
  }

  // Function to be used with list.sort
  // Compare by frequency score and commonness
  // b - a so that the list will be sorted from highest to lowest
  static int _compareVocab(Vocab a, Vocab b) {
    return b.frequencyScore +
        (b.common ? 1 : 0) -
        a.frequencyScore -
        (a.common ? 1 : 0);
  }

  // Creates the radical database from the radical json
  @visibleForTesting
  static Future<void> createRadicalDictionary(
    AppDatabase db,
    String radicals,
    String strokeData,
  ) async {
    Map<String, dynamic> radicalMap = jsonDecode(radicals);
    Map<String, dynamic> strokeMap = jsonDecode(strokeData);

    await db.transaction(() async {
      for (var entry in radicalMap.entries) {
        await db.into(db.radicals).insert(
              RadicalsCompanion(
                radical: Value(entry.key),
                kangxiId: Value.absentIfNull(entry.value['kanjix']),
                strokeCount: Value(entry.value['strokes']),
                meaning: Value(entry.value['meaning']),
                reading: Value(entry.value['reading']),
                position: Value.absentIfNull(
                  entry.value.containsKey('position')
                      ? RadicalPosition.values[entry.value['position']]
                      : null,
                ),
                importance: Value.absentIfNull(
                  entry.value.containsKey('importance')
                      ? RadicalImportance.values[entry.value['importance']]
                      : null,
                ),
                strokes:
                    Value.absentIfNull(strokeMap[entry.key]?.cast<String>()),
                variants:
                    Value.absentIfNull(entry.value['variants']?.cast<String>()),
                variantOf: Value.absentIfNull(entry.value['variant_of']),
              ),
            );
      }
    });
  }

  // Creates the kanji database from the raw dictionary file
  @visibleForTesting
  static Future<void> createKanjiDictionary(
    AppDatabase db,
    String kanjiDict,
    String kanjiComponentData,
    String strokeData, {
    bool showProgress = false,
  }) async {
    final List<KanjisCompanion> kanjiList = [];
    final List<KanjiReadingsCompanion> kanjiReadingList = [];
    final List<KanjiMeaningWordsCompanion> kanjiMeaningWordList = [];

    final xmlKanjiList =
        XmlDocument.parse(kanjiDict).childElements.first.childElements.toList();

    if (showProgress) {
      stdout.write('\nKanji progress 0%');
    }

    // Top level of kanji items (skip first element which is header)
    double progress = 0;
    for (int i = 1; i < xmlKanjiList.length; i++) {
      if (showProgress) {
        double currentProgress = i / xmlKanjiList.length;
        if (currentProgress != progress) {
          progress = currentProgress;
          stdout.write(
            '\rKanji progress ${(progress * 100).toStringAsFixed(0)}%',
          );
        }
      }

      var kanji = KanjisCompanion();
      _KanjiReadingMeaning? readingMeaning;

      // Elements within kanji
      for (var xmlKanjiChild in xmlKanjiList[i].childElements) {
        switch (xmlKanjiChild.name.local) {
          case 'literal':
            kanji = kanji.copyWith(
              id: Value(xmlKanjiChild.innerText.kanjiCodePoint()),
              kanji: Value(xmlKanjiChild.innerText),
            );
            break;
          case 'codepoint':
            // Kanji codepoint
            break;
          case 'radical':
            kanji = await _handleRadicalElements(
              db,
              xmlKanjiChild.childElements,
              kanji,
            );
            break;
          case 'misc':
            kanji = _handleKanjiMiscElements(
              xmlKanjiChild.childElements,
              kanji,
            );
            break;
          case 'dic_number':
            // Index numbers referencing published dictionaries
            break;
          case 'query_code':
            // Information related to the glyph
            break;
          case 'reading_meaning':
            readingMeaning = _handleKanjiReadingMeaningElements(
              xmlKanjiChild.childElements,
            );

            break;
        }
      }

      // Add readings and meanings
      if (readingMeaning != null) {
        if (readingMeaning.meanings.isNotEmpty) {
          kanji = kanji.copyWith(
            meaning: Value(readingMeaning.meanings.join('; ')),
          );

          for (final meaning in readingMeaning.meanings) {
            final words = meaning
                .toLowerCase()
                .removeDiacritics()
                .splitWords()
                .toSet()
                .toList();
            for (final word in words) {
              kanjiMeaningWordList.add(KanjiMeaningWordsCompanion(
                word: Value(word),
                kanjiId: kanji.id,
              ));
            }
          }
        }
        final cleanReadingRegExp = RegExp(r'\.|-');
        for (var reading in readingMeaning.onReadings) {
          final cleaned = reading.replaceAll(cleanReadingRegExp, '');
          final searchForm = _kanaKit.toHiragana(cleaned);
          final romaji = _kanaKit.toRomaji(cleaned).toLowerCase();
          final romajiSimplified = _kanaKit
              .toRomaji(cleaned.replaceAll(_simplifyVerbRegex, ''))
              .toLowerCase();
          kanjiReadingList.add(
            KanjiReadingsCompanion(
              kanjiId: kanji.id,
              reading: Value(reading),
              readingSearchForm:
                  Value.absentIfNull(reading == searchForm ? null : searchForm),
              readingRomaji: Value(romaji),
              readingRomajiSimplified: Value.absentIfNull(
                  romaji == romajiSimplified ? null : romajiSimplified),
              type: Value(KanjiReadingType.on),
            ),
          );
        }
        for (var reading in readingMeaning.kunReadings) {
          final cleaned = reading.replaceAll(cleanReadingRegExp, '');
          final searchForm = _kanaKit.toHiragana(cleaned);
          final romaji = _kanaKit.toRomaji(cleaned).toLowerCase();
          final romajiSimplified = _kanaKit
              .toRomaji(cleaned.replaceAll(_simplifyVerbRegex, ''))
              .toLowerCase();
          kanjiReadingList.add(
            KanjiReadingsCompanion(
              kanjiId: kanji.id,
              reading: Value(reading),
              readingSearchForm:
                  Value.absentIfNull(reading == searchForm ? null : searchForm),
              readingRomaji: Value(romaji),
              readingRomajiSimplified: Value.absentIfNull(
                  romaji == romajiSimplified ? null : romajiSimplified),
              type: Value(KanjiReadingType.kun),
            ),
          );
        }
        for (var reading in readingMeaning.nanori) {
          final cleaned = reading.replaceAll(cleanReadingRegExp, '');
          final searchForm = _kanaKit.toHiragana(cleaned);
          final romaji = _kanaKit.toRomaji(cleaned).toLowerCase();
          final romajiSimplified = _kanaKit
              .toRomaji(cleaned.replaceAll(_simplifyVerbRegex, ''))
              .toLowerCase();
          kanjiReadingList.add(
            KanjiReadingsCompanion(
              kanjiId: kanji.id,
              reading: Value(reading),
              readingSearchForm:
                  Value.absentIfNull(reading == searchForm ? null : searchForm),
              readingRomaji: Value(romaji),
              readingRomajiSimplified: Value.absentIfNull(
                  romaji == romajiSimplified ? null : romajiSimplified),
              type: Value(KanjiReadingType.nanori),
            ),
          );
        }
      }

      // Search vocab for kanji and add top 10 as compounds
      final vocabList = await db.vocabsDao.getUsingKanji(kanji.kanji.value);

      if (vocabList.isNotEmpty) {
        List<int> onlyKanji = [];
        List<int> inPrimaryWriting = [];
        List<int> other = [];

        for (var vocab in vocabList) {
          // Sort by where in compound kanji appears
          if (vocab.writings![0].writing == kanji.kanji.value) {
            onlyKanji.add(vocab.id);
          } else if (vocab.writings![0].writing.contains(kanji.kanji.value)) {
            inPrimaryWriting.add(vocab.id);
          } else {
            other.add(vocab.id);
          }
        }

        final compounds = onlyKanji + inPrimaryWriting + other;
        kanji = kanji.copyWith(
          compounds: Value(compounds.sublist(0, min(10, compounds.length))),
        );
      }

      // Finally, add kanji to list
      kanjiList.add(kanji);
    }

    // Write kanji, readings, and meaning words
    await db.batch((batch) {
      batch.insertAll(db.kanjis, kanjiList);
      batch.insertAll(db.kanjiReadings, kanjiReadingList);
      batch.insertAll(db.kanjiMeaningWords, kanjiMeaningWordList);
    });

    // Add components to kanji
    await db.transaction(() async {
      Map<String, dynamic> kanjiComponentMap = jsonDecode(kanjiComponentData);

      for (var entry in kanjiComponentMap.entries) {
        final kanjiResults = await (db.select(db.kanjis)
              ..where((kanji) => kanji.id.equals(entry.key.kanjiCodePoint())))
            .get();
        if (kanjiResults.length != 1) continue;
        final kanji = kanjiResults[0];

        final radical = await (db.select(db.radicals)
              ..where((radical) => radical.radical.equals(kanji.radical)))
            .getSingle();
        // If kanji is itself the radical (or a variant), skip component check
        if (kanji.kanji == radical.radical) continue;
        if (radical.variants?.contains(kanji.kanji) ?? false) continue;

        List<String>? components;

        // Go through component strings
        for (String componentString in entry.value) {
          // If component is the same as kanji's radical (or a variant) skip it
          if (componentString == radical.radical) continue;
          if (radical.variants?.contains(componentString) ?? false) continue;

          // Try to load component and add it
          final componentResult = await (db.select(db.kanjis)
                ..where((kanji) =>
                    kanji.id.equals(componentString.kanjiCodePoint())))
              .get();
          if (componentResult.length == 1) {
            components ??= [];
            components.add(componentResult[0].kanji);
          }
        }

        await (db.update(db.kanjis)
              ..where((kanji) => kanji.id.equals(entry.key.kanjiCodePoint())))
            .write(
          KanjisCompanion(
            components: Value.absentIfNull(components),
          ),
        );
      }
    });

    // Add stroke data
    return db.transaction(() async {
      Map<String, dynamic> strokeMap = jsonDecode(strokeData);

      for (var entry in strokeMap.entries) {
        await (db.update(db.kanjis)
              ..where((kanji) => kanji.id.equals(entry.key.kanjiCodePoint())))
            .write(
          KanjisCompanion(
            strokes: Value(entry.value.cast<String>()),
          ),
        );
      }
    });
  }

  static Future<KanjisCompanion> _handleRadicalElements(
    AppDatabase db,
    Iterable<XmlElement> elements,
    KanjisCompanion kanji,
  ) async {
    for (var element in elements) {
      if (element.getAttribute('rad_type') == 'classical') {
        return kanji.copyWith(
          radical: Value((await (db.select(db.radicals)
                    ..where((radical) =>
                        radical.kangxiId.equals(int.parse(element.innerText))))
                  .getSingle())
              .radical),
        );
      }
    }

    // Should always find radical so throw exception if we get here
    throw Exception();
  }

  static KanjisCompanion _handleKanjiMiscElements(
    Iterable<XmlElement> elements,
    KanjisCompanion kanji,
  ) {
    KanjiGrade? grade;
    int? strokeCount;
    int? frequency;
    JlptLevel? jlpt;

    for (var element in elements) {
      switch (element.name.local) {
        case 'grade':
          int g = int.parse(element.innerText);
          if (g <= 6) {
            grade = KanjiGrade.values[g - 1];
          } else if (g == 8) {
            grade = KanjiGrade.middleSchool;
          } else if (g == 9 || g == 10) {
            grade = KanjiGrade.jinmeiyou;
          }
          break;
        case 'stroke_count':
          strokeCount ??= int.parse(element.innerText);
          break;
        case 'variant':
          // Variant of the current kanji
          break;
        case 'freq':
          frequency = int.parse(element.innerText);
          break;
        case 'rad_name':
          // This kanji is itself a radical
          break;
        case 'jlpt':
          // TODO should stop relying on this because it uses lists from before n5
          jlpt = JlptLevel.values[int.parse(element.innerText) - 1];
          break;
      }
    }

    return kanji.copyWith(
      grade: Value.absentIfNull(grade),
      strokeCount: Value(strokeCount!),
      frequency: Value.absentIfNull(frequency),
      jlpt: Value.absentIfNull(jlpt),
    );
  }

  static _KanjiReadingMeaning _handleKanjiReadingMeaningElements(
    Iterable<XmlElement> elements,
  ) {
    late _KanjiReadingMeaning result;
    List<String> nanori = [];

    for (var element in elements) {
      switch (element.name.local) {
        case 'rmgroup':
          result = _handleKanjiRmgroupElements(element.childElements);
          break;
        case 'nanori':
          nanori.add(element.innerText);
          break;
      }
    }

    result.nanori = nanori;
    return result;
  }

  static _KanjiReadingMeaning _handleKanjiRmgroupElements(
    Iterable<XmlElement> elements,
  ) {
    List<String> meanings = [];
    List<String> onReadings = [];
    List<String> kunReadings = [];

    for (var element in elements) {
      switch (element.name.local) {
        case 'reading':
          if (element.getAttribute('r_type') == 'ja_on') {
            onReadings.add(element.innerText);
          } else if (element.getAttribute('r_type') == 'ja_kun') {
            kunReadings.add(element.innerText);
          }
          break;
        case 'meaning':
          if (element.attributes.isEmpty) meanings.add(element.innerText);
          break;
      }
    }

    return _KanjiReadingMeaning(
      meanings: meanings,
      onReadings: onReadings,
      kunReadings: kunReadings,
    );
  }

  // Creates the built-in dictionary lists
  @visibleForTesting
  static Future<void> createDictionaryLists(
    AppDatabase db,
    String vocabLists,
    String kanjiLists,
  ) async {
    // Make sure list sources are not empty (empty for some tests)
    if (vocabLists.isEmpty || kanjiLists.isEmpty) return;

    // Parse vocab lists
    final vocabMap = jsonDecode(vocabLists);

    // JLPT vocab N5
    await _createPredefinedDictionaryList(
      db,
      SagaseDictionaryConstants.dictionaryListIdJlptVocabN5,
      'N5 Vocab',
      vocab: vocabMap['jlpt_n5'].cast<int>(),
    );

    // JLPT vocab N4
    await _createPredefinedDictionaryList(
      db,
      SagaseDictionaryConstants.dictionaryListIdJlptVocabN4,
      'N4 Vocab',
      vocab: vocabMap['jlpt_n4'].cast<int>(),
    );

    // JLPT vocab N3
    await _createPredefinedDictionaryList(
      db,
      SagaseDictionaryConstants.dictionaryListIdJlptVocabN3,
      'N3 Vocab',
      vocab: vocabMap['jlpt_n3'].cast<int>(),
    );

    // JLPT vocab N2
    await _createPredefinedDictionaryList(
      db,
      SagaseDictionaryConstants.dictionaryListIdJlptVocabN2,
      'N2 Vocab',
      vocab: vocabMap['jlpt_n2'].cast<int>(),
    );

    // JLPT vocab N1
    await _createPredefinedDictionaryList(
      db,
      SagaseDictionaryConstants.dictionaryListIdJlptVocabN1,
      'N1 Vocab',
      vocab: vocabMap['jlpt_n1'].cast<int>(),
    );

    // Parse kanji lists
    final kanjiListsMap = jsonDecode(kanjiLists);

    // Jouyou
    await _createPredefinedDictionaryList(
      db,
      SagaseDictionaryConstants.dictionaryListIdJouyou,
      'Jouyou',
      kanji: kanjiListsMap['jouyou']
          .map((e) => (e as String).kanjiCodePoint())
          .toList()
          .cast<int>(),
    );

    // Jinmeiyou
    await _createPredefinedDictionaryList(
      db,
      SagaseDictionaryConstants.dictionaryListIdJinmeiyou,
      'Jinmeiyou',
      kanji: kanjiListsMap['jinmeiyou']
          .map((e) => (e as String).kanjiCodePoint())
          .toList()
          .cast<int>(),
    );

    // JLPT kanji N5
    await _createPredefinedDictionaryList(
      db,
      SagaseDictionaryConstants.dictionaryListIdJlptKanjiN5,
      'N5 Kanji',
      kanji: kanjiListsMap['jlpt_n5']
          .map((e) => (e as String).kanjiCodePoint())
          .toList()
          .cast<int>(),
    );

    // JLPT kanji N4
    await _createPredefinedDictionaryList(
      db,
      SagaseDictionaryConstants.dictionaryListIdJlptKanjiN4,
      'N4 Kanji',
      kanji: kanjiListsMap['jlpt_n4']
          .map((e) => (e as String).kanjiCodePoint())
          .toList()
          .cast<int>(),
    );

    // JLPT kanji N3
    await _createPredefinedDictionaryList(
      db,
      SagaseDictionaryConstants.dictionaryListIdJlptKanjiN3,
      'N3 Kanji',
      kanji: kanjiListsMap['jlpt_n3']
          .map((e) => (e as String).kanjiCodePoint())
          .toList()
          .cast<int>(),
    );

    // JLPT kanji N2
    await _createPredefinedDictionaryList(
      db,
      SagaseDictionaryConstants.dictionaryListIdJlptKanjiN2,
      'N2 Kanji',
      kanji: kanjiListsMap['jlpt_n2']
          .map((e) => (e as String).kanjiCodePoint())
          .toList()
          .cast<int>(),
    );

    // JLPT kanji N1
    await _createPredefinedDictionaryList(
      db,
      SagaseDictionaryConstants.dictionaryListIdJlptKanjiN1,
      'N1 Kanji',
      kanji: kanjiListsMap['jlpt_n1']
          .map((e) => (e as String).kanjiCodePoint())
          .toList()
          .cast<int>(),
    );

    // Grade level 1 and kanji kentei level 10
    final gradeLevel1Raw = kanjiListsMap['grade_level_1']
        .map((e) => (e as String).kanjiCodePoint())
        .toList()
        .cast<int>();
    await _createPredefinedDictionaryList(
      db,
      SagaseDictionaryConstants.dictionaryListIdGradeLevel1,
      '1st Grade Kanji',
      kanji: gradeLevel1Raw,
    );
    await _createPredefinedDictionaryList(
      db,
      SagaseDictionaryConstants.dictionaryListIdKenteiLevel10,
      'Kanji Kentei level 10',
      kanji: gradeLevel1Raw,
    );

    // Grade level 2 and kanji kentei level 9
    final gradeLevel2Raw = kanjiListsMap['grade_level_2']
        .map((e) => (e as String).kanjiCodePoint())
        .toList()
        .cast<int>();
    await _createPredefinedDictionaryList(
      db,
      SagaseDictionaryConstants.dictionaryListIdGradeLevel2,
      '2nd Grade Kanji',
      kanji: gradeLevel2Raw,
    );
    await _createPredefinedDictionaryList(
      db,
      SagaseDictionaryConstants.dictionaryListIdKenteiLevel9,
      'Kanji Kentei level 9',
      kanji: gradeLevel2Raw,
    );

    // Grade level 3 and kanji kentei level 8
    final gradeLevel3Raw = kanjiListsMap['grade_level_3']
        .map((e) => (e as String).kanjiCodePoint())
        .toList()
        .cast<int>();
    await _createPredefinedDictionaryList(
      db,
      SagaseDictionaryConstants.dictionaryListIdGradeLevel3,
      '3rd Grade Kanji',
      kanji: gradeLevel3Raw,
    );
    await _createPredefinedDictionaryList(
      db,
      SagaseDictionaryConstants.dictionaryListIdKenteiLevel8,
      'Kanji Kentei level 8',
      kanji: gradeLevel3Raw,
    );

    // Grade level 4 and kanji kentei level 7
    final gradeLevel4Raw = kanjiListsMap['grade_level_4']
        .map((e) => (e as String).kanjiCodePoint())
        .toList()
        .cast<int>();
    await _createPredefinedDictionaryList(
      db,
      SagaseDictionaryConstants.dictionaryListIdGradeLevel4,
      '4th Grade Kanji',
      kanji: gradeLevel4Raw,
    );
    await _createPredefinedDictionaryList(
      db,
      SagaseDictionaryConstants.dictionaryListIdKenteiLevel7,
      'Kanji Kentei level 7',
      kanji: gradeLevel4Raw,
    );

    // Grade level 5 and kanji kentei level 6
    final gradeLevel5Raw = kanjiListsMap['grade_level_5']
        .map((e) => (e as String).kanjiCodePoint())
        .toList()
        .cast<int>();
    await _createPredefinedDictionaryList(
      db,
      SagaseDictionaryConstants.dictionaryListIdGradeLevel5,
      '5th Grade Kanji',
      kanji: gradeLevel5Raw,
    );
    await _createPredefinedDictionaryList(
      db,
      SagaseDictionaryConstants.dictionaryListIdKenteiLevel6,
      'Kanji Kentei level 6',
      kanji: gradeLevel5Raw,
    );

    // Grade level 6 and kanji kentei level 5
    final gradeLevel6Raw = kanjiListsMap['grade_level_6']
        .map((e) => (e as String).kanjiCodePoint())
        .toList()
        .cast<int>();
    await _createPredefinedDictionaryList(
      db,
      SagaseDictionaryConstants.dictionaryListIdGradeLevel6,
      '6th Grade Kanji',
      kanji: gradeLevel6Raw,
    );
    await _createPredefinedDictionaryList(
      db,
      SagaseDictionaryConstants.dictionaryListIdKenteiLevel5,
      'Kanji Kentei level 5',
      kanji: gradeLevel6Raw,
    );

    // Kanji kentei level 4
    await _createPredefinedDictionaryList(
      db,
      SagaseDictionaryConstants.dictionaryListIdKenteiLevel4,
      'Kanji Kentei level 4',
      kanji: kanjiListsMap['kentei_level_4']
          .map((e) => (e as String).kanjiCodePoint())
          .toList()
          .cast<int>(),
    );

    // Kanji kentei level 3
    await _createPredefinedDictionaryList(
      db,
      SagaseDictionaryConstants.dictionaryListIdKenteiLevel3,
      'Kanji Kentei level 3',
      kanji: kanjiListsMap['kentei_level_3']
          .map((e) => (e as String).kanjiCodePoint())
          .toList()
          .cast<int>(),
    );

    // Kanji kentei level Pre 2
    await _createPredefinedDictionaryList(
      db,
      SagaseDictionaryConstants.dictionaryListIdKenteiLevelPre2,
      'Kanji Kentei level pre-2',
      kanji: kanjiListsMap['kentei_level_pre_2']
          .map((e) => (e as String).kanjiCodePoint())
          .toList()
          .cast<int>(),
    );

    // Kanji kentei level 2
    await _createPredefinedDictionaryList(
      db,
      SagaseDictionaryConstants.dictionaryListIdKenteiLevel2,
      'Kanji Kentei level 2',
      kanji: kanjiListsMap['kentei_level_2']
          .map((e) => (e as String).kanjiCodePoint())
          .toList()
          .cast<int>(),
    );

    // Kanji kentei level Pre 1
    await _createPredefinedDictionaryList(
      db,
      SagaseDictionaryConstants.dictionaryListIdKenteiLevelPre1,
      'Kanji Kentei level pre-1',
      kanji: kanjiListsMap['kentei_level_pre_1']
          .map((e) => (e as String).kanjiCodePoint())
          .toList()
          .cast<int>(),
    );

    // Kanji kentei level 1
    await _createPredefinedDictionaryList(
      db,
      SagaseDictionaryConstants.dictionaryListIdKenteiLevel1,
      'Kanji Kentei level 1',
      kanji: kanjiListsMap['kentei_level_1']
          .map((e) => (e as String).kanjiCodePoint())
          .toList()
          .cast<int>(),
    );

    // Add favorites my list
    await db.myDictionaryListsDao.create('Favorites');
  }

  static Future<void> _createPredefinedDictionaryList(
    AppDatabase db,
    int id,
    String name, {
    List<int> vocab = const [],
    List<int> kanji = const [],
  }) async {
    // Confirm all vocab exist in database
    if (vocab.isNotEmpty) {
      final results = await (db.select(db.vocabs)
            ..where((row) => row.id.isIn(vocab)))
          .get();
      assert(results.length == vocab.length);
    }

    // Confirm all kanji exist in database
    if (kanji.isNotEmpty) {
      final results = await (db.select(db.kanjis)
            ..where((row) => row.id.isIn(kanji)))
          .get();
      assert(results.length == kanji.length);
    }

    await db.into(db.predefinedDictionaryLists).insert(
          PredefinedDictionaryListsCompanion(
            id: Value(id),
            name: Value(name),
            vocab: Value(vocab),
            kanji: Value(kanji),
          ),
        );
  }

  // Creates the proper noun database from the raw dictionary file
  static Future<void> createProperNounDictionary(
    AppDatabase db,
    String enamdict, {
    bool showProgress = false,
  }) async {
    if (showProgress) {
      stdout.write('Proper noun progress 0%');
    }

    final lines = enamdict.split('\n');
    List<ProperNounsCompanion> properNouns = [];
    List<ProperNounRomajiWordsCompanion> properNounRomajiWords = [];
    double progress = 0;
    for (int i = 0; i < lines.length; i++) {
      if (showProgress) {
        double currentProgress = i / lines.length;
        if (currentProgress != progress) {
          progress = currentProgress;
          stdout.write(
            '\rProper noun progress ${(progress * 100).toStringAsFixed(0)}%',
          );
        }
      }

      var line = lines[i];

      // Set initial writing
      String? writing = line.substring(0, line.indexOf(' '));
      line = line.substring(writing.length + 1);
      // Try to get reading
      late String reading;
      String? writingSearchForm;
      if (line[0] == '[') {
        // Set reading
        reading = line.substring(1, line.indexOf(' ') - 1);
        line = line.substring(reading.length + 3);
        // Create writing search form
        writingSearchForm =
            _kanaKit.toHiragana(writing.toLowerCase().romajiToHalfWidth());
        if (writing == writingSearchForm) writingSearchForm = null;
      } else {
        // No reading available so set reading to writing and writing to null
        reading = writing;
        writing = null;
      }
      // Create reading search form
      String? readingSearchForm = _kanaKit.toHiragana(reading);
      if (reading == readingSearchForm) readingSearchForm = null;

      // Create reading romaji
      String readingRomaji = _kanaKit.toRomaji(reading).toLowerCase();
      String? readingRomajiSimplified = _kanaKit
          .toRomaji(reading.replaceAll(_simplifyNonVerbRegex, ''))
          .toLowerCase();
      if (readingRomaji == readingRomajiSimplified) {
        readingRomajiSimplified = null;
      }

      // Get proper noun types
      String typesString = line.substring(2, line.indexOf(')'));
      List<ProperNounType> types = [];
      for (var typeString in typesString.split(',')) {
        types.add(_properNounTypeStringToEnum(typeString));
      }
      // Get romaji
      line = line.substring(typesString.length + 4);
      String romaji = line.substring(0, line.length - 1);

      // If romaji contains multiple words or was changed by removing diacritics add them to romaji words
      final words =
          romaji.toLowerCase().removeDiacritics().splitWords().toSet().toList();
      if (words.isNotEmpty && words[0] != romaji.toLowerCase()) {
        for (final word in words) {
          properNounRomajiWords.add(ProperNounRomajiWordsCompanion(
            word: Value(word),
            properNounId: Value(i),
          ));
        }
      }

      properNouns.add(
        ProperNounsCompanion(
          id: Value(i),
          writing: Value.absentIfNull(writing),
          writingSearchForm: Value.absentIfNull(writingSearchForm),
          reading: Value(reading),
          readingSearchForm: Value.absentIfNull(readingSearchForm),
          readingRomaji: Value(readingRomaji),
          readingRomajiSimplified: Value.absentIfNull(readingRomajiSimplified),
          romaji: Value(romaji),
          types: Value(types),
        ),
      );
    }

    await db.batch((batch) {
      batch.insertAll(db.properNouns, properNouns);
      batch.insertAll(db.properNounRomajiWords, properNounRomajiWords);
    });
  }

  static ProperNounType _properNounTypeStringToEnum(String type) {
    switch (type) {
      case 's':
        return ProperNounType.surname;
      case 'p':
        return ProperNounType.placeName;
      case 'u':
        return ProperNounType.personName;
      case 'g':
        return ProperNounType.givenName;
      case 'f':
        return ProperNounType.femaleName;
      case 'm':
        return ProperNounType.maleName;
      case 'h':
        return ProperNounType.fullName;
      case 'pr':
        return ProperNounType.product;
      case 'c':
        return ProperNounType.company;
      case 'o':
        return ProperNounType.organization;
      case 'st':
        return ProperNounType.station;
      case 'wk':
        return ProperNounType.workOfArt;
      case 'group':
        return ProperNounType.group;
      case 'obj':
        return ProperNounType.object;
      case 'serv':
        return ProperNounType.service;
      case 'ch':
        return ProperNounType.character;
      case 'leg':
        return ProperNounType.legend;
      case 'cr':
        return ProperNounType.creature;
      case 'ev':
        return ProperNounType.event;
      case 'myth':
        return ProperNounType.myth;
      case 'fic':
        return ProperNounType.fiction;
      case 'dei':
        return ProperNounType.deity;
      case 'ship':
        return ProperNounType.ship;
      case 'document':
        return ProperNounType.document;
      case 'rel':
        return ProperNounType.religion;
      default:
        return ProperNounType.unknown;
    }
  }
}

class _KanjiReadingMeaning {
  List<String> meanings;
  List<String> onReadings;
  List<String> kunReadings;
  late List<String> nanori;

  _KanjiReadingMeaning({
    required this.meanings,
    required this.onReadings,
    required this.kunReadings,
  });
}
