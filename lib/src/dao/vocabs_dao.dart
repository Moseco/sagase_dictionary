import 'package:drift/drift.dart';
import 'package:kana_kit/kana_kit.dart';
import 'package:sagase_dictionary/src/database.dart';
import 'package:sagase_dictionary/src/datamodels/vocab/vocab_notes.dart';
import 'package:sagase_dictionary/src/datamodels/vocabs.dart';
import 'package:sagase_dictionary/src/utils/enums.dart';
import 'package:sagase_dictionary/src/utils/string_utils.dart';

part 'vocabs_dao.g.dart';

@DriftAccessor(tables: [Vocabs, VocabWritings, VocabReadings, VocabDefinitions])
class VocabsDao extends DatabaseAccessor<AppDatabase> with _$VocabsDaoMixin {
  final _kanaKit = const KanaKit().copyWithConfig(passRomaji: true);

  VocabsDao(super.db);

  Future<Vocab> get(int id, {FrontType? frontType}) async {
    final baseQuery = db.select(db.vocabs)
      ..where((vocab) => vocab.id.equals(id));

    late Vocab vocab;
    if (frontType == null) {
      // Get vocab only
      vocab = await baseQuery.getSingle();
    } else {
      // If front type is given get that spaced repetition data too
      vocab = await baseQuery
          .join([
            leftOuterJoin(
                db.spacedRepetitionDatas,
                Expression.and([
                  db.spacedRepetitionDatas.vocabId.equals(id),
                  db.spacedRepetitionDatas.frontType.equals(frontType.index),
                ]))
          ])
          .map(
            (row) => row.readTable(db.vocabs)
              ..spacedRepetitionData =
                  row.readTableOrNull(db.spacedRepetitionDatas),
          )
          .getSingle();
    }

    final writings = await (db.select(db.vocabWritings)
          ..where((writing) => writing.vocabId.equals(vocab.id))
          ..orderBy([(writing) => OrderingTerm.asc(writing.id)]))
        .get();

    final readings = await (db.select(db.vocabReadings)
          ..where((reading) => reading.vocabId.equals(vocab.id))
          ..orderBy([(reading) => OrderingTerm.asc(reading.id)]))
        .get();

    final definitions = await (db.select(db.vocabDefinitions)
          ..where((definition) => definition.vocabId.equals(vocab.id))
          ..orderBy([(definition) => OrderingTerm.asc(definition.id)]))
        .get();

    final note = await getNote(vocab.id);

    return vocab
      ..writings = writings.isEmpty ? null : writings
      ..readings = readings
      ..definitions = definitions
      ..note = note?.note;
  }

  Future<List<Vocab>> getAll(List<int> idList, {FrontType? frontType}) async {
    if (idList.isEmpty) return [];

    final baseQuery = db.select(db.vocabs)
      ..where((vocab) => vocab.id.isIn(idList));

    late Map<int, Vocab> vocabMap = {};
    if (frontType == null) {
      // Get vocab only
      vocabMap = {for (var vocab in (await baseQuery.get())) vocab.id: vocab};
    } else {
      // If front type is given get that spaced repetition data too
      final query = baseQuery.join([
        leftOuterJoin(
            db.spacedRepetitionDatas,
            Expression.and([
              db.spacedRepetitionDatas.vocabId.equalsExp(db.vocabs.id),
              db.spacedRepetitionDatas.frontType.equals(frontType.index),
            ]))
      ]).map(
        (row) => row.readTable(db.vocabs)
          ..spacedRepetitionData =
              row.readTableOrNull(db.spacedRepetitionDatas),
      );

      vocabMap = {for (var vocab in (await query.get())) vocab.id: vocab};
    }

    final writings = await (db.select(db.vocabWritings)
          ..where((writing) => writing.vocabId.isIn(idList))
          ..orderBy([(writing) => OrderingTerm.asc(writing.id)]))
        .get();

    // Start loading readings while processing writings
    final readingsFuture = (db.select(db.vocabReadings)
          ..where((reading) => reading.vocabId.isIn(idList))
          ..orderBy([(reading) => OrderingTerm.asc(reading.id)]))
        .get();

    if (writings.isNotEmpty) {
      int currentVocabId = writings[0].vocabId;
      List<VocabWriting> currentWritings = [];
      for (final writing in writings) {
        // If id does not match got to new vocab, add current writings and clear list
        if (writing.vocabId != currentVocabId) {
          vocabMap[currentVocabId]!.writings =
              currentWritings.isEmpty ? null : currentWritings;
          currentVocabId = writing.vocabId;
          currentWritings = [];
        }
        currentWritings.add(writing);
      }
      // Add remaining writings
      vocabMap[currentVocabId]!.writings =
          currentWritings.isEmpty ? null : currentWritings;
    }

    final readings = await readingsFuture;
    // Start loading definitions while processing readings
    final definitionFuture = (db.select(db.vocabDefinitions)
          ..where((definition) => definition.vocabId.isIn(idList))
          ..orderBy([(definition) => OrderingTerm.asc(definition.id)]))
        .get();

    if (readings.isNotEmpty) {
      int currentVocabId = readings[0].vocabId;
      List<VocabReading> currentReadings = [];
      for (final reading in readings) {
        // If id does not match got to new vocab, add current readings and clear list
        if (reading.vocabId != currentVocabId) {
          vocabMap[currentVocabId]!.readings = currentReadings;
          currentVocabId = reading.vocabId;
          currentReadings = [];
        }
        currentReadings.add(reading);
      }
      // Add remaining readings
      vocabMap[currentVocabId]!.readings = currentReadings;
    }

    final definitions = await definitionFuture;
    // Start loading notes while processing definitions
    final noteFuture =
        (db.select(db.vocabNotes)..where((note) => note.id.isIn(idList))).get();

    if (definitions.isNotEmpty) {
      int currentVocabId = definitions[0].vocabId;
      List<VocabDefinition> currentDefinitions = [];
      for (final definition in definitions) {
        // If id does not match got to new vocab, add current definitions and clear list
        if (definition.vocabId != currentVocabId) {
          vocabMap[currentVocabId]!.definitions = currentDefinitions;
          currentVocabId = definition.vocabId;
          currentDefinitions = [];
        }
        currentDefinitions.add(definition);
      }
      // Add remaining definitions
      vocabMap[currentVocabId]!.definitions = currentDefinitions;
    }

    final notes = await noteFuture;
    for (final note in notes) {
      vocabMap[note.id]!.note = note.note;
    }

    // Put the results in the same order as the input
    List<Vocab> vocabList = [];
    for (final id in idList) {
      vocabList.add(vocabMap[id]!);
    }

    return vocabList;
  }

  Future<List<Vocab>> _getAllFromBase(List<Vocab> vocabList) async {
    if (vocabList.isEmpty) return vocabList;

    final vocabMap = {for (var vocab in vocabList) vocab.id: vocab};

    final writings = await (db.select(db.vocabWritings)
          ..where((writing) => writing.vocabId.isIn(vocabMap.keys))
          ..orderBy([(writing) => OrderingTerm.asc(writing.id)]))
        .get();

    // Start loading readings while processing writings
    final readingsFuture = (db.select(db.vocabReadings)
          ..where((reading) => reading.vocabId.isIn(vocabMap.keys))
          ..orderBy([(reading) => OrderingTerm.asc(reading.id)]))
        .get();

    if (writings.isNotEmpty) {
      int currentVocabId = writings[0].vocabId;
      List<VocabWriting> currentWritings = [];
      for (final writing in writings) {
        // If id does not match got to new vocab, add current writings and clear list
        if (writing.vocabId != currentVocabId) {
          vocabMap[currentVocabId]!.writings =
              currentWritings.isEmpty ? null : currentWritings;
          currentVocabId = writing.vocabId;
          currentWritings = [];
        }
        currentWritings.add(writing);
      }
      // Add remaining writings
      vocabMap[currentVocabId]!.writings =
          currentWritings.isEmpty ? null : currentWritings;
    }

    final readings = await readingsFuture;
    // Start loading definitions while processing readings
    final definitionFuture = (db.select(db.vocabDefinitions)
          ..where((definition) => definition.vocabId.isIn(vocabMap.keys))
          ..orderBy([(definition) => OrderingTerm.asc(definition.id)]))
        .get();

    if (readings.isNotEmpty) {
      int currentVocabId = readings[0].vocabId;
      List<VocabReading> currentReadings = [];
      for (final reading in readings) {
        // If id does not match got to new vocab, add current readings and clear list
        if (reading.vocabId != currentVocabId) {
          vocabMap[currentVocabId]!.readings = currentReadings;
          currentVocabId = reading.vocabId;
          currentReadings = [];
        }
        currentReadings.add(reading);
      }
      // Add remaining readings
      vocabMap[currentVocabId]!.readings = currentReadings;
    }

    final definitions = await definitionFuture;
    // Start loading notes while processing definitions
    final noteFuture = (db.select(db.vocabNotes)
          ..where((note) => note.id.isIn(vocabMap.keys)))
        .get();

    if (definitions.isNotEmpty) {
      int currentVocabId = definitions[0].vocabId;
      List<VocabDefinition> currentDefinitions = [];
      for (final definition in definitions) {
        // If id does not match got to new vocab, add current definitions and clear list
        if (definition.vocabId != currentVocabId) {
          vocabMap[currentVocabId]!.definitions = currentDefinitions;
          currentVocabId = definition.vocabId;
          currentDefinitions = [];
        }
        currentDefinitions.add(definition);
      }
      // Add remaining definitions
      vocabMap[currentVocabId]!.definitions = currentDefinitions;
    }

    final notes = await noteFuture;
    for (final note in notes) {
      vocabMap[note.id]!.note = note.note;
    }

    return vocabList;
  }

  Future<List<Vocab>> validateAll(List<int> idList) async {
    if (idList.isEmpty) return [];

    final vocabMap = {
      for (var vocab in (await (db.select(db.vocabs)
            ..where((row) => row.id.isIn(idList)))
          .get()))
        vocab.id: vocab
    };

    // Put the results in the same order as the input
    List<Vocab> vocabList = [];
    for (final id in idList) {
      final vocab = vocabMap[id];
      if (vocab != null) vocabList.add(vocab);
    }

    return vocabList;
  }

  Future<List<Vocab>> getByWriting(String text) async {
    final matchingWriting = Subquery(
      db.select(db.vocabWritings)
        ..where((writing) => Expression.or([
              writing.writing.equals(text),
              writing.writingSearchForm.equals(
                  _kanaKit.toHiragana(text.toLowerCase().romajiToHalfWidth())),
            ])),
      'matching_writing',
    );

    final query = db.select(db.vocabs).join([
      innerJoin(
        matchingWriting,
        matchingWriting.ref(db.vocabWritings.vocabId).equalsExp(db.vocabs.id),
        useColumns: false,
      ),
    ])
      ..groupBy([db.vocabs.id]);

    final baseList = await query.map((row) => row.readTable(db.vocabs)).get();

    return _getAllFromBase(baseList);
  }

  Future<List<Vocab>> getByReading(String text) async {
    final matchingReading = Subquery(
      db.select(db.vocabReadings)
        ..where((reading) => Expression.or([
              reading.reading.equals(text),
              reading.readingSearchForm.equals(_kanaKit.toHiragana(text)),
            ])),
      'matching_reading',
    );

    final query = db.select(db.vocabs).join([
      innerJoin(
        matchingReading,
        matchingReading.ref(db.vocabReadings.vocabId).equalsExp(db.vocabs.id),
        useColumns: false,
      ),
    ])
      ..groupBy([db.vocabs.id]);

    final baseList = await query.map((row) => row.readTable(db.vocabs)).get();

    return _getAllFromBase(baseList);
  }

  Future<List<Vocab>> getByWritingAndReading(
    String writingText,
    String readingText,
  ) async {
    final matchWriting = Subquery(
      db.select(db.vocabWritings)
        ..where((writing) => Expression.or([
              writing.writing.equals(writingText),
              writing.writingSearchForm.equals(_kanaKit
                  .toHiragana(writingText.toLowerCase().romajiToHalfWidth())),
            ])),
      'match_writing',
    );

    final matchReading = Subquery(
      db.select(db.vocabReadings)
        ..where((reading) => Expression.or([
              reading.reading.equals(readingText),
              reading.readingSearchForm
                  .equals(_kanaKit.toHiragana(readingText)),
            ])),
      'match_reading',
    );

    final query = db.select(db.vocabs).join([
      innerJoin(
        matchWriting,
        matchWriting.ref(db.vocabWritings.vocabId).equalsExp(db.vocabs.id),
        useColumns: false,
      ),
      innerJoin(
        matchReading,
        matchReading.ref(db.vocabReadings.vocabId).equalsExp(db.vocabs.id),
        useColumns: false,
      ),
    ])
      ..groupBy([db.vocabs.id]);

    final baseList = await query.map((row) => row.readTable(db.vocabs)).get();

    return _getAllFromBase(baseList);
  }

  Future<List<Vocab>> getUsingKanji(String kanji) async {
    final searchWriting = Subquery(
      db.select(db.vocabWritings)
        ..where((writing) => writing.writing.contains(kanji)),
      'search_writing',
    );

    final query = db.select(db.vocabs).join([
      innerJoin(
        searchWriting,
        searchWriting.ref(db.vocabWritings.vocabId).equalsExp(db.vocabs.id),
        useColumns: false,
      ),
    ])
      ..orderBy([OrderingTerm.desc(db.vocabs.frequencyScore)])
      ..groupBy([db.vocabs.id]);

    final baseList = await query.map((row) => row.readTable(db.vocabs)).get();

    return _getAllFromBase(baseList);
  }

  Future<List<Vocab>> search(String text) async {
    final cleanedText = RegExp.escape(text).toLowerCase().removeDiacritics();
    if (cleanedText.isEmpty) return [];

    if (_kanaKit.isRomaji(cleanedText)) {
      // Romaji
      final splits = cleanedText.splitWords();
      if (splits.isEmpty) splits.add(cleanedText);

      if (splits.length > 1) {
        // Search by definition
        return _searchByDefinition(cleanedText, splits);
      } else {
        // Search by romaji reading and definition

        // Search by definition
        final definitionResults =
            await _searchByDefinition(cleanedText, splits);

        // Search by romaji reading
        final searchReading = Subquery(
          db.select(db.vocabReadings)
            ..where((reading) => Expression.or([
                  reading.readingRomaji.like('$cleanedText%'),
                  reading.readingRomajiSimplified.like('$cleanedText%'),
                ])),
          'search_reading',
        );

        final minReadingRomajiLength =
            searchReading.ref(db.vocabReadings.readingRomaji).length.min();
        final query = db.select(db.vocabs).join([
          innerJoin(
            searchReading,
            searchReading.ref(db.vocabReadings.vocabId).equalsExp(db.vocabs.id),
            useColumns: false,
          ),
        ])
          ..addColumns([minReadingRomajiLength])
          ..orderBy([
            OrderingTerm.asc(minReadingRomajiLength),
            OrderingTerm.desc(db.vocabs.frequencyScore),
          ])
          ..groupBy([db.vocabs.id])
          ..limit(1000);

        // Get vocab and sort by if the reading is an exact match or not
        // This solves some romaji simplification problems and
        // makes possible sorting later more convenient
        final rows = await query.get();
        List<Vocab> exactMatchVocab = [];
        List<Vocab> otherVocab = [];
        for (final row in rows) {
          if (row.read(minReadingRomajiLength) == cleanedText.length) {
            exactMatchVocab.add(row.readTable(db.vocabs));
          } else {
            otherVocab.add(row.readTable(db.vocabs));
          }
        }

        final readingResults =
            await _getAllFromBase(exactMatchVocab + otherVocab);

        // If one of the lists is empty, can simply return the non empty one
        if (definitionResults.isEmpty) return readingResults;
        if (readingResults.isEmpty) return definitionResults;

        // Simple merging order
        // - Exact match readings results
        // - All definition results
        // - Remaining reading results
        List<Vocab> mergedResults = exactMatchVocab;
        Set<int> idSet = {for (var vocab in mergedResults) vocab.id};
        for (final vocab in definitionResults + otherVocab) {
          if (!idSet.contains(vocab.id)) {
            idSet.add(vocab.id);
            mergedResults.add(vocab);
          }
        }

        return mergedResults;
      }
    } else {
      // Japanese text
      if (_kanaKit.isKana(cleanedText)) {
        // Search by reading
        final searchReading = Subquery(
          db.select(db.vocabReadings)
            ..where((reading) => Expression.or([
                  reading.reading.like('$cleanedText%'),
                  reading.readingSearchForm
                      .like(_kanaKit.toHiragana('$cleanedText%')),
                ])),
          'search_reading',
        );

        final minReadingLength =
            searchReading.ref(db.vocabReadings.reading).length.min();
        final query = db.select(db.vocabs).join([
          innerJoin(
            searchReading,
            searchReading.ref(db.vocabReadings.vocabId).equalsExp(db.vocabs.id),
            useColumns: false,
          ),
        ])
          ..addColumns([minReadingLength])
          ..orderBy([
            OrderingTerm.asc(minReadingLength),
            OrderingTerm.desc(db.vocabs.frequencyScore),
          ])
          ..groupBy([db.vocabs.id])
          ..limit(1000);

        final baseList =
            await query.map((row) => row.readTable(db.vocabs)).get();

        return _getAllFromBase(baseList);
      } else {
        // Search by writing
        final searchWriting = Subquery(
          db.select(db.vocabWritings)
            ..where((writing) => Expression.or([
                  writing.writing.like('$cleanedText%'),
                  writing.writingSearchForm.like(_kanaKit.toHiragana(
                      '$cleanedText%'.toLowerCase().romajiToHalfWidth())),
                ])),
          'search_writing',
        );

        final minWritingLength =
            searchWriting.ref(db.vocabWritings.writing).length.min();
        final query = db.select(db.vocabs).join([
          innerJoin(
            searchWriting,
            searchWriting.ref(db.vocabWritings.vocabId).equalsExp(db.vocabs.id),
            useColumns: false,
          ),
        ])
          ..addColumns([minWritingLength])
          ..orderBy([
            OrderingTerm.asc(minWritingLength),
            OrderingTerm.desc(db.vocabs.frequencyScore),
          ])
          ..groupBy([db.vocabs.id])
          ..limit(1000);

        final baseList =
            await query.map((row) => row.readTable(db.vocabs)).get();

        return _getAllFromBase(baseList);
      }
    }
  }

  Future<List<Vocab>> _searchByDefinition(
    String cleanedText,
    List<String> splits,
  ) async {
    late final List<Vocab> vocabList;
    if (splits.length == 1) {
      // Create a subquery that finds words that start with the given word
      final searchDefinition = Subquery(
        db.select(db.vocabDefinitionWords)
          ..where((word) => word.word.like('${splits.last}%')),
        'search_definition',
      );

      final minWordLength =
          searchDefinition.ref(db.vocabDefinitionWords.word).length.min();
      vocabList = await (db.select(db.vocabs).join([
        innerJoin(
          searchDefinition,
          searchDefinition
              .ref(db.vocabDefinitionWords.vocabId)
              .equalsExp(db.vocabs.id),
          useColumns: false,
        ),
      ])
            ..addColumns([minWordLength])
            ..orderBy([
              OrderingTerm.asc(minWordLength),
              OrderingTerm.desc(db.vocabs.frequencyScore),
              OrderingTerm.desc(db.vocabs.common),
            ])
            ..groupBy([db.vocabs.id])
            ..limit(1000))
          .map((row) => row.readTable(db.vocabs))
          .get();
    } else {
      // Create a join that matches all but the last word and starts with for the last word
      // Then use having to exclude results that don't contain all words
      final uniqueWords = splits.toSet().toList();
      // Last word in splits might match another word so make sure to separate words correctly
      late final List<String> wordsExceptLast;
      if (splits.where((e) => e == splits.last).length > 1) {
        wordsExceptLast = uniqueWords;
      } else {
        wordsExceptLast = uniqueWords.sublist(0, uniqueWords.length - 1);
      }
      final startsWithLastWord = '${splits.last}%';
      final minStartsWithLastWordLength = db.vocabDefinitionWords.word.length
          .min(filter: db.vocabDefinitionWords.word.like(startsWithLastWord));

      vocabList = await (db.select(db.vocabs).join([
        innerJoin(
          db.vocabDefinitionWords,
          db.vocabDefinitionWords.vocabId.equalsExp(db.vocabs.id),
        ),
      ])
            ..addColumns([minStartsWithLastWordLength])
            ..orderBy([
              OrderingTerm.asc(
                minStartsWithLastWordLength,
                nulls: NullsOrder.last,
              ),
              OrderingTerm.desc(db.vocabs.frequencyScore),
              OrderingTerm.desc(db.vocabs.common),
            ])
            ..where(Expression.or([
              db.vocabDefinitionWords.word.isIn(wordsExceptLast),
              db.vocabDefinitionWords.word.like(startsWithLastWord),
            ]))
            ..groupBy(
              [db.vocabs.id],
              having: Expression.and([
                db.vocabDefinitionWords.word
                    .caseMatch(when: {
                      for (var w in wordsExceptLast) Variable(w): Variable(w)
                    })
                    .count(distinct: true)
                    .equals(wordsExceptLast.length),
                CaseWhenExpression(cases: [
                  CaseWhen(
                    db.vocabDefinitionWords.word.like(startsWithLastWord),
                    then: const Constant(0),
                  ),
                ]).count().isBiggerOrEqualValue(1),
              ]),
            )
            ..limit(500))
          .map((row) => row.readTable(db.vocabs))
          .get();
    }

    if (vocabList.isEmpty) return [];

    // Finish getting vocab
    await _getAllFromBase(vocabList);

    // Sort by how well search text matches vocab definition
    // Each nested list is for quality of match
    //    Nested list 0: definition 1 sub-definition contains only search text
    //    Nested list 1: definition 1 sub-definition starts with search text
    //    Nested list 2: exact match in definition 1 other than start
    //    Nested list 3: exact match in definition 2+
    //    Nested list 4: no match found
    List<List<Vocab>> nestedSortingList = [[], [], [], [], []];

    // Match word starting with search text
    final searchTextRegExp = RegExp(
      r'\b' + cleanedText,
      caseSensitive: false,
    );
    // Match search text at the start of string or after ';' and ignore leading/trailing parenthesis
    final startingRegExp = RegExp(
      r'(^|(; ))(\([^)]*\) )?\b' + cleanedText + r'( \([^)]*\))?',
      caseSensitive: false,
    );
    // Same as startingRegExp but with end of sub-definition
    final startingEndRegExp = RegExp(
      startingRegExp.pattern + r'($|;)',
      caseSensitive: false,
    );

    outer:
    for (var vocab in vocabList) {
      for (int i = 0; i < vocab.definitions.length; i++) {
        final definition = vocab.definitions[i].definition.removeDiacritics();
        if (definition.contains(searchTextRegExp)) {
          if (i == 0) {
            int foundIndex = definition.indexOf(startingRegExp);
            if (foundIndex != -1) {
              if (definition.contains(startingEndRegExp, foundIndex)) {
                nestedSortingList[0].add(vocab);
              } else {
                nestedSortingList[1].add(vocab);
              }
            } else {
              nestedSortingList[2].add(vocab);
            }
          } else {
            nestedSortingList[3].add(vocab);
          }
          continue outer;
        }
      }
      nestedSortingList[4].add(vocab);
    }

    return nestedSortingList[0] +
        nestedSortingList[1] +
        nestedSortingList[2] +
        nestedSortingList[3] +
        nestedSortingList[4];
  }

  Future<VocabNote?> getNote(int vocabId) async {
    return (db.select(db.vocabNotes)..where((note) => note.id.equals(vocabId)))
        .getSingleOrNull();
  }

  Future<List<VocabNote>> getAllNotes() async {
    return db.select(db.vocabNotes).get();
  }

  Future<VocabNote> setNote(int vocabId, String note) async {
    await db.into(db.vocabNotes).insert(
          VocabNotesCompanion(
            id: Value(vocabId),
            note: Value(note),
          ),
          mode: InsertMode.insertOrReplace,
        );

    return (await getNote(vocabId))!;
  }

  Future<void> deleteNote(int vocabId) async {
    await (db.delete(db.vocabNotes)..where((note) => note.id.equals(vocabId)))
        .go();
  }
}
