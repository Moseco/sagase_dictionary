import 'dart:ffi';
import 'dart:io';
import 'dart:math';

import 'package:isar/isar.dart';
import 'package:sagase_dictionary/src/datamodels/kanji.dart';
import 'package:sagase_dictionary/src/datamodels/kanji_radical.dart';
import 'package:sagase_dictionary/src/datamodels/vocab.dart';
import 'package:sagase_dictionary/src/dictionary_builder.dart';
import 'package:sagase_dictionary/src/utils/string_utils.dart';
import 'package:test/test.dart';
import 'package:path/path.dart' as path;

import 'common.dart';

void main() {
  group('DictionaryBuilderTest', () {
    late Isar isar;

    setUp(() async {
      // Create directory .dart_tool/isar/test_files
      final dartToolDir = path.join(Directory.current.path, '.dart_tool');
      String testTempPath = path.join(dartToolDir, 'isar', 'test_files');
      String downloadPath = path.join(dartToolDir, 'isar');
      await Directory(testTempPath).create(recursive: true);

      // Get name of isar binary based on platform
      late String binaryName;
      switch (Abi.current()) {
        case Abi.macosX64:
          binaryName = 'libisar.dylib';
          break;
        case Abi.linuxX64:
          binaryName = 'libisar.so';
          break;
        case Abi.windowsX64:
          binaryName = 'isar.dll';
          break;
        default:
          throw Exception('Unsupported platform for testing');
      }

      // Downloads Isar binary file
      await Isar.initializeIsarCore(
        libraries: {Abi.current(): path.join(downloadPath, binaryName)},
        download: true,
      );

      // Open Isar instance with random name
      isar = await Isar.open(
        DictionaryBuilder.dictionarySchemas,
        directory: testTempPath,
        name: Random().nextInt(pow(2, 32) as int).toString(),
        inspector: false,
      );
    });

    tearDown(() => isar.close(deleteFromDisk: true));
    test('Vocab database creation with short source dictionary', () async {
      await DictionaryBuilder.createVocabDictionary(
        isar,
        shortJMdict,
        pitchAccentsTest,
        frequencyListTest,
      );

      final vocab0 = await isar.vocabs.get(1000220);
      expect(vocab0!.commonWord, true);
      // Kanji-reading pairs
      expect(vocab0.kanjiReadingPairs.length, 1);
      // Pair 1
      expect(vocab0.kanjiReadingPairs[0].kanjiWritings!.length, 1);
      expect(vocab0.kanjiReadingPairs[0].kanjiWritings![0].kanji, '明白');
      expect(vocab0.kanjiReadingPairs[0].kanjiWritings![0].info, null);
      expect(vocab0.kanjiReadingPairs[0].readings.length, 1);
      expect(vocab0.kanjiReadingPairs[0].readings[0].reading, 'めいはく');
      expect(vocab0.kanjiReadingPairs[0].readings[0].info, null);
      expect(vocab0.kanjiReadingPairs[0].readings[0].pitchAccents, [0]);
      expect(vocab0.frequencyScore, 15145);
      // Definition
      expect(vocab0.pos, null);
      expect(vocab0.definitions.length, 1);
      expect(vocab0.definitions[0].definition,
          'obvious; clear; plain; evident; apparent; explicit; overt');
      expect(vocab0.definitions[0].additionalInfo, null);
      expect(vocab0.definitions[0].pos!.length, 1);
      expect(vocab0.definitions[0].pos![0], PartOfSpeech.adjectiveNa);
      expect(vocab0.definitions[0].appliesTo, null);
      expect(vocab0.definitions[0].miscInfo, null);
      expect(vocab0.definitions[0].dialects, null);
      expect(vocab0.definitions[0].examples!.length, 1);
      expect(vocab0.definitions[0].examples![0].japanese, '何をしなければならないかは明白です。');
      expect(vocab0.definitions[0].examples![0].english,
          'It is clear what must be done.');
      expect(vocab0.definitions[0].crossReferences, null);
      expect(vocab0.definitions[0].antonyms, null);
      // Japanese text index
      expect(vocab0.japaneseTextIndex.length, 2);
      expect(vocab0.japaneseTextIndex[0], '明白');
      expect(vocab0.japaneseTextIndex[1], 'めいはく');
      // Romaji text index
      expect(vocab0.romajiTextIndex.length, 1);
      expect(vocab0.romajiTextIndex[0], 'meihaku');

      final vocab1 = await isar.vocabs.get(1000390);
      expect(vocab1!.commonWord, true);
      // Kanji-reading pairs
      expect(vocab1.kanjiReadingPairs.length, 1);
      // Pair 1
      expect(vocab1.kanjiReadingPairs[0].kanjiWritings!.length, 4);
      expect(vocab1.kanjiReadingPairs[0].kanjiWritings![0].kanji, 'あっという間に');
      expect(vocab1.kanjiReadingPairs[0].kanjiWritings![1].kanji, 'あっと言う間に');
      expect(vocab1.kanjiReadingPairs[0].kanjiWritings![2].kanji, 'アッという間に');
      expect(vocab1.kanjiReadingPairs[0].kanjiWritings![3].kanji, 'アッと言う間に');
      expect(vocab1.kanjiReadingPairs[0].readings.length, 1);
      expect(vocab1.kanjiReadingPairs[0].readings[0].reading, 'あっというまに');
      expect(vocab1.kanjiReadingPairs[0].readings[0].pitchAccents, null);
      // Definition
      expect(vocab1.pos, null);
      expect(vocab1.definitions.length, 1);
      expect(vocab1.definitions[0].definition,
          'in an instant; in a flash; in the blink of an eye; in no time at all; just like that');
      expect(vocab1.definitions[0].pos!.length, 2);
      expect(vocab1.definitions[0].pos![0], PartOfSpeech.expressions);
      expect(vocab1.definitions[0].pos![1], PartOfSpeech.adverb);
      expect(vocab1.definitions[0].examples!.length, 1);
      expect(vocab1.definitions[0].examples![0].japanese, '休暇はあっという間に終わった。');
      expect(vocab1.definitions[0].examples![0].english,
          'The holiday ended all too soon.');
      // Japanese text index
      expect(vocab1.japaneseTextIndex.length, 4);
      expect(vocab1.japaneseTextIndex[0], 'あっとゆう間に');
      expect(vocab1.japaneseTextIndex[1], 'あっというまに');
      expect(vocab1.japaneseTextIndex[2], 'あっという間に');
      expect(vocab1.japaneseTextIndex[3], 'あっと言う間に');
      // Romaji text index
      expect(vocab1.romajiTextIndex.length, 2);
      expect(vocab1.romajiTextIndex[0], 'atoimani');
      expect(vocab1.romajiTextIndex[1], 'attoiumani');

      final vocab2 = await isar.vocabs.get(1003430);
      expect(vocab2!.commonWord, true);
      // Kanji-reading pairs
      expect(vocab2.kanjiReadingPairs.length, 1);
      // Pair 1
      expect(vocab2.kanjiReadingPairs[0].kanjiWritings!.length, 2);
      expect(vocab2.kanjiReadingPairs[0].kanjiWritings![0].kanji, '屹度');
      expect(vocab2.kanjiReadingPairs[0].kanjiWritings![0].info!.length, 2);
      expect(vocab2.kanjiReadingPairs[0].kanjiWritings![0].info![0],
          KanjiInfo.ateji);
      expect(vocab2.kanjiReadingPairs[0].kanjiWritings![0].info![1],
          KanjiInfo.rareKanjiForm);
      expect(vocab2.kanjiReadingPairs[0].kanjiWritings![1].kanji, '急度');
      expect(vocab2.kanjiReadingPairs[0].kanjiWritings![1].info!.length, 2);
      expect(vocab2.kanjiReadingPairs[0].kanjiWritings![1].info![0],
          KanjiInfo.ateji);
      expect(vocab2.kanjiReadingPairs[0].kanjiWritings![1].info![1],
          KanjiInfo.rareKanjiForm);
      expect(vocab2.kanjiReadingPairs[0].readings.length, 2);
      expect(vocab2.kanjiReadingPairs[0].readings[0].reading, 'きっと');
      expect(vocab2.kanjiReadingPairs[0].readings[0].pitchAccents, [0, 1]);
      expect(vocab2.kanjiReadingPairs[0].readings[1].reading, 'キッと');
      // Definitions
      expect(vocab2.pos!.length, 1);
      expect(vocab2.pos![0], PartOfSpeech.adverb);
      expect(vocab2.definitions.length, 4);
      // Definition 1
      expect(vocab2.definitions[0].definition,
          'surely; undoubtedly; almost certainly; most likely (e.g. 90 percent)');
      expect(vocab2.definitions[0].pos, null);
      expect(vocab2.definitions[0].miscInfo!.length, 2);
      expect(vocab2.definitions[0].miscInfo![0],
          MiscellaneousInfo.usuallyKanaAlone);
      expect(vocab2.definitions[0].miscInfo![1],
          MiscellaneousInfo.onomatopoeicOrMimeticWord);
      expect(vocab2.definitions[0].examples!.length, 1);
      expect(vocab2.definitions[0].examples![0].japanese,
          'でもよー、オラのおとうさんは良い気しねーよ、きっと。');
      expect(vocab2.definitions[0].examples![0].english,
          'But I don\'t think Dad would like me to.');
      // Definition 2
      expect(vocab2.definitions[1].definition, 'sternly; severely');
      expect(vocab2.definitions[1].additionalInfo, 'esp. キッと');
      expect(vocab2.definitions[1].pos, null);
      expect(vocab2.definitions[1].miscInfo!.length, 2);
      expect(vocab2.definitions[1].miscInfo![0],
          MiscellaneousInfo.usuallyKanaAlone);
      expect(vocab2.definitions[1].miscInfo![1],
          MiscellaneousInfo.onomatopoeicOrMimeticWord);
      // Definition 3
      expect(vocab2.definitions[2].definition,
          'having no slack; rigid; stiff; tight');
      expect(vocab2.definitions[2].pos, null);
      expect(vocab2.definitions[2].miscInfo!.length, 2);
      expect(vocab2.definitions[2].miscInfo![0],
          MiscellaneousInfo.usuallyKanaAlone);
      expect(vocab2.definitions[2].miscInfo![1],
          MiscellaneousInfo.onomatopoeicOrMimeticWord);
      // Definition 4
      expect(vocab2.definitions[3].definition, 'suddenly; abruptly; instantly');
      expect(vocab2.definitions[3].pos, null);
      expect(vocab2.definitions[3].miscInfo!.length, 3);
      expect(vocab2.definitions[3].miscInfo![0],
          MiscellaneousInfo.usuallyKanaAlone);
      expect(vocab2.definitions[3].miscInfo![1],
          MiscellaneousInfo.onomatopoeicOrMimeticWord);
      expect(vocab2.definitions[3].miscInfo![2], MiscellaneousInfo.archaism);
      // Japanese text index
      expect(vocab2.japaneseTextIndex.length, 3);
      expect(vocab2.japaneseTextIndex[0], '屹度');
      expect(vocab2.japaneseTextIndex[1], '急度');
      expect(vocab2.japaneseTextIndex[2], 'きっと');
      // Romaji text index
      expect(vocab2.romajiTextIndex.length, 2);
      expect(vocab2.romajiTextIndex[0], 'kito');
      expect(vocab2.romajiTextIndex[1], 'kitto');

      final vocab3 = await isar.vocabs.get(1578850);
      expect(vocab3!.commonWord, true);
      // Kanji-reading pairs
      expect(vocab3.kanjiReadingPairs.length, 1);
      // Pair 1
      expect(vocab3.kanjiReadingPairs[0].kanjiWritings!.length, 3);
      expect(vocab3.kanjiReadingPairs[0].kanjiWritings![0].kanji, '行く');
      expect(vocab3.kanjiReadingPairs[0].kanjiWritings![1].kanji, '逝く');
      expect(vocab3.kanjiReadingPairs[0].kanjiWritings![2].kanji, '往く');
      expect(vocab3.kanjiReadingPairs[0].kanjiWritings![2].info!.length, 1);
      expect(vocab3.kanjiReadingPairs[0].kanjiWritings![2].info![0],
          KanjiInfo.outdatedKanji);
      expect(vocab3.kanjiReadingPairs[0].readings.length, 2);
      expect(vocab3.kanjiReadingPairs[0].readings[0].reading, 'いく');
      expect(vocab3.kanjiReadingPairs[0].readings[1].reading, 'ゆく');
      // Definitions
      expect(vocab3.pos!.length, 1);
      expect(vocab3.pos![0], PartOfSpeech.verbGodanKS);
      expect(vocab3.definitions.length, 10);
      // Definition 1
      expect(vocab3.definitions[0].definition,
          'to go; to move (in a direction or towards a specific location); to head (towards); to be transported (towards); to reach');
      expect(vocab3.definitions[0].pos!.length, 1);
      expect(vocab3.definitions[0].pos![0], PartOfSpeech.verbIntransitive);
      expect(vocab3.definitions[0].examples!.length, 1);
      expect(vocab3.definitions[0].examples![0].japanese, 'お母さん、泳ぎに行ってもいい。');
      expect(vocab3.definitions[0].examples![0].english,
          'Can I go swimming, Mother?');
      expect(vocab3.definitions[0].crossReferences!.length, 1);
      expect(vocab3.definitions[0].crossReferences![0].ids, null);
      expect(vocab3.definitions[0].crossReferences![0].text, '来る');
      expect(vocab3.definitions[0].antonyms, null);
      // Definition 2
      expect(vocab3.definitions[1].definition, 'to proceed; to take place');
      expect(vocab3.definitions[1].additionalInfo,
          'い sometimes omitted in auxiliary use');
      expect(vocab3.definitions[1].pos!.length, 1);
      expect(vocab3.definitions[1].pos![0], PartOfSpeech.verbIntransitive);
      expect(vocab3.definitions[1].examples!.length, 1);
      expect(vocab3.definitions[1].examples![0].japanese,
          '私達はそれを禍とせず最善を尽くして頑張っていかなくてはならない。');
      expect(vocab3.definitions[1].examples![0].english,
          'We\'ll have to try and make the best of it.');
      expect(vocab3.definitions[1].crossReferences!.length, 1);
      expect(vocab3.definitions[1].crossReferences![0].ids, [1310500]);
      expect(vocab3.definitions[1].crossReferences![0].text, '旨く行く');
      expect(vocab3.definitions[1].antonyms, null);
      // Definition 3
      expect(
          vocab3.definitions[2].definition, 'to pass through; to come and go');
      expect(vocab3.definitions[2].pos!.length, 1);
      expect(vocab3.definitions[2].pos![0], PartOfSpeech.verbIntransitive);
      expect(vocab3.definitions[2].examples!.length, 1);
      expect(vocab3.definitions[2].examples![0].japanese,
          'これらの規則はずっと守られてきたし、これからもいつも守られていくだろう。');
      expect(vocab3.definitions[2].examples![0].english,
          'These rules have been and always will be observed.');
      // Definition 4
      expect(vocab3.definitions[3].definition, 'to walk');
      expect(vocab3.definitions[3].pos!.length, 1);
      expect(vocab3.definitions[3].pos![0], PartOfSpeech.verbIntransitive);
      // Definition 5
      expect(vocab3.definitions[4].definition, 'to die; to pass away');
      expect(vocab3.definitions[4].pos!.length, 1);
      expect(vocab3.definitions[4].pos![0], PartOfSpeech.verbIntransitive);
      expect(vocab3.definitions[4].appliesTo!.length, 1);
      expect(vocab3.definitions[4].appliesTo![0], '逝く');
      // Definition 6
      expect(vocab3.definitions[5].definition, 'to do (in a specific way)');
      expect(vocab3.definitions[5].pos!.length, 1);
      expect(vocab3.definitions[5].pos![0], PartOfSpeech.verbIntransitive);
      // Definition 7
      expect(vocab3.definitions[6].definition, 'to stream; to flow');
      expect(vocab3.definitions[6].pos!.length, 1);
      expect(vocab3.definitions[6].pos![0], PartOfSpeech.verbIntransitive);
      // Definition 8
      expect(vocab3.definitions[7].definition, 'to continue');
      expect(
          vocab3.definitions[7].additionalInfo, 'after the -te form of a verb');
      expect(vocab3.definitions[7].pos!.length, 1);
      expect(vocab3.definitions[7].pos![0], PartOfSpeech.auxiliaryV);
      expect(vocab3.definitions[7].miscInfo!.length, 1);
      expect(vocab3.definitions[7].miscInfo![0],
          MiscellaneousInfo.usuallyKanaAlone);
      // Definition 9
      expect(vocab3.definitions[8].definition,
          'to have an orgasm; to come; to cum');
      expect(vocab3.definitions[8].pos!.length, 1);
      expect(vocab3.definitions[8].pos![0], PartOfSpeech.verbIntransitive);
      expect(vocab3.definitions[8].miscInfo!.length, 1);
      expect(vocab3.definitions[8].miscInfo![0],
          MiscellaneousInfo.usuallyKanaAlone);
      // Definition 10
      expect(vocab3.definitions[9].definition,
          'to trip; to get high; to have a drug-induced hallucination');
      expect(vocab3.definitions[9].pos!.length, 1);
      expect(vocab3.definitions[9].pos![0], PartOfSpeech.verbIntransitive);
      expect(vocab3.definitions[9].miscInfo!.length, 2);
      expect(vocab3.definitions[9].miscInfo![0],
          MiscellaneousInfo.usuallyKanaAlone);
      expect(vocab3.definitions[9].miscInfo![1], MiscellaneousInfo.slang);
      // Japanese text index
      expect(vocab3.japaneseTextIndex.length, 5);
      expect(vocab3.japaneseTextIndex[0], 'いく');
      expect(vocab3.japaneseTextIndex[1], 'ゆく');
      expect(vocab3.japaneseTextIndex[2], '行く');
      expect(vocab3.japaneseTextIndex[3], '逝く');
      expect(vocab3.japaneseTextIndex[4], '往く');
      // Romaji text index
      expect(vocab3.romajiTextIndex.length, 2);
      expect(vocab3.romajiTextIndex[0], 'iku');
      expect(vocab3.romajiTextIndex[1], 'yuku');

      final vocab4 = await isar.vocabs.get(2002400);
      expect(vocab4!.commonWord, true);
      // Kanji-reading pairs
      expect(vocab4.kanjiReadingPairs.length, 1);
      // Pair 1
      expect(vocab4.kanjiReadingPairs[0].kanjiWritings, null);
      expect(vocab4.kanjiReadingPairs[0].readings.length, 3);
      expect(vocab4.kanjiReadingPairs[0].readings[0].reading, 'ううん');
      expect(vocab4.kanjiReadingPairs[0].readings[1].reading, 'うーん');
      expect(vocab4.kanjiReadingPairs[0].readings[2].reading, 'ウーン');
      // Definitions
      expect(vocab4.pos!.length, 1);
      expect(vocab4.pos![0], PartOfSpeech.interjection);
      expect(vocab4.definitions.length, 3);
      // Definition 1
      expect(vocab4.definitions[0].definition, 'um; er; well');
      expect(vocab4.definitions[0].pos, null);
      expect(vocab4.definitions[0].examples!.length, 1);
      expect(vocab4.definitions[0].examples![0].japanese,
          'ウーン、どっちの道に行っても迷いそうな気がする。');
      expect(vocab4.definitions[0].examples![0].english,
          'Hmm. I have a feeling I\'m going to get lost whichever road I take.');
      expect(vocab4.definitions[0].crossReferences!.length, 1);
      expect(vocab4.definitions[0].crossReferences![0].ids, null);
      expect(vocab4.definitions[0].crossReferences![0].text, 'うん');
      expect(vocab4.definitions[0].antonyms, null);
      // Definition 2
      expect(vocab4.definitions[1].definition, 'nuh-uh; no');
      expect(vocab4.definitions[1].pos, null);
      expect(vocab4.definitions[1].appliesTo!.length, 1);
      expect(vocab4.definitions[1].appliesTo![0], 'ううん');
      expect(vocab4.definitions[1].examples!.length, 2);
      expect(vocab4.definitions[1].examples![0].japanese, 'うーんいいなあ。そこへ行こう。');
      expect(vocab4.definitions[1].examples![0].english,
          'Hm, that\'s a good idea. Let\'s go there.');
      expect(vocab4.definitions[1].examples![1].japanese,
          'ううん、由美ちゃんが魔法瓶に入れて、部室に持って来てくれたの。');
      expect(vocab4.definitions[1].examples![1].english,
          'No, Yumi put it in a thermos flask and brought it into the club room.');
      // Definition 3
      expect(vocab4.definitions[2].definition, 'oof');
      expect(vocab4.definitions[2].pos, null);
      expect(vocab4.definitions[2].crossReferences!.length, 1);
      expect(vocab4.definitions[2].crossReferences![0].ids, null);
      expect(vocab4.definitions[2].crossReferences![0].text, 'うん');
      expect(vocab4.definitions[2].antonyms, null);
      // Japanese text index
      expect(vocab4.japaneseTextIndex.length, 2);
      expect(vocab4.japaneseTextIndex[0], 'ううん');
      expect(vocab4.japaneseTextIndex[1], 'うーん');
      // Romaji text index
      expect(vocab4.romajiTextIndex.length, 3);
      expect(vocab4.romajiTextIndex[0], 'un');
      expect(vocab4.romajiTextIndex[1], 'uun');
      expect(vocab4.romajiTextIndex[2], 'u-n');

      final vocab5 = await isar.vocabs.get(1002360);
      expect(vocab5!.commonWord, false);
      // Kanji-reading pairs
      expect(vocab5.kanjiReadingPairs.length, 3);
      // Pair 1
      expect(vocab5.kanjiReadingPairs[0].kanjiWritings!.length, 2);
      expect(vocab5.kanjiReadingPairs[0].kanjiWritings![0].kanji, 'お待ちどおさま');
      expect(vocab5.kanjiReadingPairs[0].kanjiWritings![1].kanji, 'お待ちどお様');
      expect(vocab5.kanjiReadingPairs[0].kanjiWritings![0].info, null);
      expect(vocab5.kanjiReadingPairs[0].kanjiWritings![1].info, null);
      expect(vocab5.kanjiReadingPairs[0].readings.length, 1);
      expect(vocab5.kanjiReadingPairs[0].readings[0].reading, 'おまちどおさま');
      // Pair 2
      expect(vocab5.kanjiReadingPairs[1].kanjiWritings!.length, 3);
      expect(vocab5.kanjiReadingPairs[1].kanjiWritings![0].kanji, 'お待ち遠様');
      expect(vocab5.kanjiReadingPairs[1].kanjiWritings![1].kanji, '御待ち遠様');
      expect(vocab5.kanjiReadingPairs[1].kanjiWritings![2].kanji, 'お待ち遠さま');
      expect(vocab5.kanjiReadingPairs[1].kanjiWritings![0].info, null);
      expect(vocab5.kanjiReadingPairs[1].kanjiWritings![1].info, null);
      expect(vocab5.kanjiReadingPairs[1].kanjiWritings![2].info, null);
      expect(vocab5.kanjiReadingPairs[1].readings.length, 2);
      expect(vocab5.kanjiReadingPairs[1].readings[0].reading, 'おまちどおさま');
      expect(vocab5.kanjiReadingPairs[1].readings[1].reading, 'おまちどうさま');
      // Pair 3
      expect(vocab5.kanjiReadingPairs[2].kanjiWritings!.length, 2);
      expect(vocab5.kanjiReadingPairs[2].kanjiWritings![0].kanji, 'お待ちどうさま');
      expect(vocab5.kanjiReadingPairs[2].kanjiWritings![1].kanji, 'お待ちどう様');
      expect(vocab5.kanjiReadingPairs[2].kanjiWritings![0].info!.length, 1);
      expect(vocab5.kanjiReadingPairs[2].kanjiWritings![0].info![0],
          KanjiInfo.irregularKana);
      expect(vocab5.kanjiReadingPairs[2].kanjiWritings![1].info!.length, 1);
      expect(vocab5.kanjiReadingPairs[2].kanjiWritings![1].info![0],
          KanjiInfo.irregularKana);
      expect(vocab5.kanjiReadingPairs[2].readings.length, 1);
      expect(vocab5.kanjiReadingPairs[2].readings[0].reading, 'おまちどうさま');
      expect(vocab5.kanjiReadingPairs[2].readings[0].info!.length, 1);
      expect(vocab5.kanjiReadingPairs[2].readings[0].info![0],
          ReadingInfo.irregularKana);
      // Definition
      expect(vocab5.pos, null);
      expect(vocab5.definitions.length, 1);
      expect(vocab5.definitions[0].definition,
          'I\'m sorry to have kept you waiting');
      expect(vocab5.definitions[0].pos!.length, 1);
      expect(vocab5.definitions[0].pos![0], PartOfSpeech.expressions);
      // Japanese text index
      expect(vocab5.japaneseTextIndex.length, 9);
      expect(vocab5.japaneseTextIndex[0], 'お待ち遠様');
      expect(vocab5.japaneseTextIndex[1], '御待ち遠様');
      expect(vocab5.japaneseTextIndex[2], 'お待ちどお様');
      expect(vocab5.japaneseTextIndex[3], 'お待ち遠さま');
      expect(vocab5.japaneseTextIndex[4], 'お待ちどう様');
      expect(vocab5.japaneseTextIndex[5], 'おまちどおさま');
      expect(vocab5.japaneseTextIndex[6], 'お待ちどおさま');
      expect(vocab5.japaneseTextIndex[7], 'おまちどうさま');
      expect(vocab5.japaneseTextIndex[8], 'お待ちどうさま');
      // Romaji text index
      expect(vocab5.romajiTextIndex.length, 3);
      expect(vocab5.romajiTextIndex[0], 'omachidosama');
      expect(vocab5.romajiTextIndex[1], 'omachidoosama');
      expect(vocab5.romajiTextIndex[2], 'omachidousama');

      final vocab6 = await isar.vocabs.get(1001390);
      expect(vocab6!.commonWord, true);
      // Kanji-reading pairs
      expect(vocab6.kanjiReadingPairs.length, 1);
      // Pair 1
      expect(vocab6.kanjiReadingPairs[0].kanjiWritings!.length, 2);
      expect(vocab6.kanjiReadingPairs[0].kanjiWritings![0].kanji, '御田');
      expect(vocab6.kanjiReadingPairs[0].kanjiWritings![0].info!.length, 1);
      expect(vocab6.kanjiReadingPairs[0].kanjiWritings![0].info![0],
          KanjiInfo.rareKanjiForm);
      expect(vocab6.kanjiReadingPairs[0].kanjiWritings![1].kanji, 'お田');
      expect(vocab6.kanjiReadingPairs[0].kanjiWritings![1].info!.length, 1);
      expect(vocab6.kanjiReadingPairs[0].kanjiWritings![1].info![0],
          KanjiInfo.rareKanjiForm);
      expect(vocab6.kanjiReadingPairs[0].readings.length, 1);
      expect(vocab6.kanjiReadingPairs[0].readings[0].reading, 'おでん');
      expect(vocab6.kanjiReadingPairs[0].readings[0].pitchAccents, [2]);
      // Definition
      expect(vocab6.pos, null);
      expect(vocab6.definitions.length, 1);
      expect(vocab6.definitions[0].definition,
          'oden; dish of various ingredients, e.g. egg, daikon, potato, chikuwa, konnyaku stewed in soy-flavored dashi');
      expect(vocab6.definitions[0].pos!.length, 1);
      expect(vocab6.definitions[0].pos![0], PartOfSpeech.noun);
      expect(vocab6.definitions[0].fields!.length, 1);
      expect(vocab6.definitions[0].fields![0], Field.foodCooking);
      expect(vocab6.definitions[0].miscInfo!.length, 1);
      expect(vocab6.definitions[0].miscInfo![0],
          MiscellaneousInfo.usuallyKanaAlone);
      // Japanese text index
      expect(vocab6.japaneseTextIndex.length, 3);
      expect(vocab6.japaneseTextIndex[0], '御田');
      expect(vocab6.japaneseTextIndex[1], 'お田');
      expect(vocab6.japaneseTextIndex[2], 'おでん');
      // Romaji text index
      expect(vocab6.romajiTextIndex.length, 1);
      expect(vocab6.romajiTextIndex[0], 'oden');

      final vocab7 = await isar.vocabs.get(2067590);
      expect(vocab7!.commonWord, false);
      // Kanji-reading pairs
      expect(vocab7.kanjiReadingPairs.length, 1);
      // Pair 1
      expect(vocab7.kanjiReadingPairs[0].readings.length, 3);
      expect(vocab7.kanjiReadingPairs[0].readings[0].reading, 'めんこい');
      expect(vocab7.kanjiReadingPairs[0].readings[1].reading, 'めごい');
      expect(vocab7.kanjiReadingPairs[0].readings[2].reading, 'めんごい');
      // Definition
      expect(vocab7.pos, null);
      expect(vocab7.definitions.length, 1);
      expect(vocab7.definitions[0].definition,
          'dear; darling; adorable; precious; cute; lovely; sweet; beloved; charming');
      expect(vocab7.definitions[0].pos!.length, 1);
      expect(vocab7.definitions[0].pos![0], PartOfSpeech.adjectiveI);
      expect(vocab7.definitions[0].dialects!.length, 2);
      expect(vocab7.definitions[0].dialects![0], Dialect.touhokuBen);
      expect(vocab7.definitions[0].dialects![1], Dialect.hokkaidoBen);
      // Japanese text index
      expect(vocab7.japaneseTextIndex.length, 3);
      expect(vocab7.japaneseTextIndex[0], 'めごい');
      expect(vocab7.japaneseTextIndex[1], 'めんこい');
      expect(vocab7.japaneseTextIndex[2], 'めんごい');
      // Romaji text index
      expect(vocab7.romajiTextIndex.length, 3);
      expect(vocab7.romajiTextIndex[0], 'megoi');
      expect(vocab7.romajiTextIndex[1], 'menkoi');
      expect(vocab7.romajiTextIndex[2], 'mengoi');

      final vocab8 = await isar.vocabs.get(1000160);
      expect(vocab8!.commonWord, true);
      // Kanji-reading pairs
      expect(vocab8.kanjiReadingPairs.length, 1);
      // Pair 1
      expect(vocab8.kanjiReadingPairs[0].kanjiWritings!.length, 1);
      expect(vocab8.kanjiReadingPairs[0].kanjiWritings![0].kanji, 'Ｔシャツ');
      expect(vocab8.kanjiReadingPairs[0].readings.length, 1);
      expect(vocab8.kanjiReadingPairs[0].readings[0].reading, 'ティーシャツ');
      // Definition
      expect(vocab8.pos, null);
      expect(vocab8.definitions.length, 1);
      expect(vocab8.definitions[0].definition, 'T-shirt; tee shirt');
      expect(vocab8.definitions[0].pos!.length, 1);
      expect(vocab8.definitions[0].pos![0], PartOfSpeech.noun);
      // Japanese text index
      expect(vocab8.japaneseTextIndex.length, 2);
      expect(vocab8.japaneseTextIndex[0], 'tしゃつ');
      expect(vocab8.japaneseTextIndex[1], 'てぃいしゃつ');
      // Romaji text index
      expect(vocab8.romajiTextIndex.length, 2);
      expect(vocab8.romajiTextIndex[0], 'teishatsu');
      expect(vocab8.romajiTextIndex[1], 'teiishatsu');

      final vocab9 = await isar.vocabs.get(1310840);
      expect(vocab9!.definitions[0].crossReferences, null);
      expect(vocab9.definitions[0].antonyms!.length, 1);
      expect(vocab9.definitions[0].antonyms![0].ids, null);
      expect(vocab9.definitions[0].antonyms![0].text, '活語');
    });

    test('Kanji radicals database creation with short source', () async {
      await DictionaryBuilder.createRadicalDictionary(
        isar,
        shortKanjiRadicalData,
        shortKanjiStrokeData,
      );

      final radical1 = await isar.kanjiRadicals.getByRadical('一');
      expect(radical1!.radical, '一');
      expect(radical1.kangxiId, 1);
      expect(radical1.strokeCount, 1);
      expect(radical1.meaning, 'one');
      expect(radical1.reading, 'イチ');
      expect(radical1.position, KanjiRadicalPosition.none);
      expect(radical1.importance, KanjiRadicalImportance.top75);
      expect(radical1.strokes!.length, 1);
      expect(radical1.variants, null);
      expect(radical1.variantOf, null);

      final radical2 = await isar.kanjiRadicals.getByRadical('乙');
      expect(radical2!.radical, '乙');
      expect(radical2.strokeCount, 1);
      expect(radical2.meaning, 'second');
      expect(radical2.kangxiId, 5);
      expect(radical2.reading, 'オツ, おつにょう, つりばり');
      expect(radical2.position, KanjiRadicalPosition.none);
      expect(radical2.importance, KanjiRadicalImportance.none);
      expect(radical2.variants, ['乚']);
      expect(radical2.variantOf, null);

      final radical3 = await isar.kanjiRadicals.getByRadical('乚');
      expect(radical3!.radical, '乚');
      expect(radical3.kangxiId, null);
      expect(radical3.strokeCount, 1);
      expect(radical3.meaning, 'second');
      expect(radical3.reading, 'オツ, おつにょう, つりばり');
      expect(radical3.position, KanjiRadicalPosition.none);
      expect(radical3.importance, KanjiRadicalImportance.none);
      expect(radical3.variants, null);
      expect(radical3.variantOf, '乙');
    });

    test('Kanji database creation with short source dictionary', () async {
      // First create radicals
      await DictionaryBuilder.createRadicalDictionary(
        isar,
        shortKanjiRadicalData,
        shortKanjiStrokeData,
      );

      // Create kanji dictionary
      await DictionaryBuilder.createKanjiDictionary(
        isar,
        shortKanjidic2,
        shortKanjiComponents,
        shortKanjiStrokeData,
      );

      final kanji1 = await isar.kanjis.get('亜'.kanjiCodePoint());
      expect(kanji1!.kanji, '亜');
      expect(kanji1.radical, '二');
      expect(kanji1.components!.length, 2);
      expect(kanji1.components![0], '一');
      expect(kanji1.components![1], '口');
      expect(kanji1.grade, 8);
      expect(kanji1.strokeCount, 7);
      expect(kanji1.frequency, 1509);
      expect(kanji1.jlpt, 1);
      expect(kanji1.meanings, ['Asia', 'rank next', 'come after', '-ous']);
      expect(kanji1.onReadings!.length, 1);
      expect(kanji1.onReadings![0], 'ア');
      expect(kanji1.kunReadings!.length, 1);
      expect(kanji1.kunReadings![0], 'つ.ぐ');
      expect(kanji1.nanori!.length, 3);
      expect(kanji1.nanori![0], 'や');
      expect(kanji1.nanori![1], 'つぎ');
      expect(kanji1.nanori![2], 'つぐ');
      expect(kanji1.strokes!.length, 7);

      final kanji2 = await isar.kanjis.get('悪'.kanjiCodePoint());
      expect(kanji2!.kanji, '悪');
      expect(kanji2.radical, '心');
      expect(kanji2.components!.length, 2);
      expect(kanji2.components![0], '一');
      expect(kanji2.components![1], '口');
      expect(kanji2.grade, 3);
      expect(kanji2.strokeCount, 11);
      expect(kanji2.frequency, 530);
      expect(kanji2.jlpt, 3);
      expect(
          kanji2.meanings, ['bad', 'vice', 'rascal', 'false', 'evil', 'wrong']);
      expect(kanji2.onReadings!.length, 2);
      expect(kanji2.onReadings![0], 'アク');
      expect(kanji2.onReadings![1], 'オ');
      expect(kanji2.kunReadings!.length, 9);
      expect(kanji2.kunReadings![0], 'わる.い');
      expect(kanji2.kunReadings![1], 'わる-');
      expect(kanji2.kunReadings![2], 'あ.し');
      expect(kanji2.kunReadings![3], 'にく.い');
      expect(kanji2.kunReadings![4], '-にく.い');
      expect(kanji2.kunReadings![5], 'ああ');
      expect(kanji2.kunReadings![6], 'いずくに');
      expect(kanji2.kunReadings![7], 'いずくんぞ');
      expect(kanji2.kunReadings![8], 'にく.む');
      expect(kanji2.nanori, null);

      final kanji3 = await isar.kanjis.get('亞'.kanjiCodePoint());
      expect(kanji3!.kanji, '亞');
      expect(kanji3.radical, '二');
      expect(kanji3.components!.length, 1);
      expect(kanji3.components![0], '一');
      expect(kanji3.grade, 255);
      expect(kanji3.strokeCount, 8);
      expect(kanji3.frequency, null);
      expect(kanji3.jlpt, 255);
      expect(kanji3.meanings, ['rank', 'follow']);
      expect(kanji3.onReadings!.length, 1);
      expect(kanji3.onReadings![0], 'ア');
      expect(kanji3.kunReadings!.length, 1);
      expect(kanji3.kunReadings![0], 'つ.ぐ');
      expect(kanji3.nanori, null);
    });
  });
}
