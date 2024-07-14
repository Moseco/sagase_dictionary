import 'package:sagase_dictionary/src/database.dart';
import 'package:sagase_dictionary/src/dictionary_builder.dart';
import 'package:sagase_dictionary/src/utils/constants.dart';
import 'package:sagase_dictionary/src/utils/enums.dart';
import 'package:sagase_dictionary/src/utils/string_utils.dart';
import 'package:test/test.dart';

import 'common.dart';

void main() {
  group('DictionaryBuilderTest', () {
    late AppDatabase database;

    setUp(() => database = AppDatabase());

    tearDown(() async {
      await database.close();
    });

    test('Dictionary creation with short version', () async {
      await DictionaryBuilder.createDictionary(
        database,
        shortJMdict,
        shortKanjidic2,
        shortRadicalData,
        shortKanjiStrokeData,
        shortKanjiComponentData,
        shortVocabListData,
        shortKanjiListData,
        shortPitchAccentData,
        shortFrequencyListData,
      );

      // Dictionary info
      final dictionaryInfo = await database.dictionaryInfosDao.get();
      expect(dictionaryInfo!.id, 0);
      expect(
        dictionaryInfo.version,
        SagaseDictionaryConstants.dictionaryVersion,
      );

      // Vocab
      final vocab0 = await database.vocabsDao.get(1000220);
      expect(vocab0.pos, null);
      expect(vocab0.common, true);
      expect(vocab0.frequencyScore, 15145);
      // Writings
      expect(vocab0.writings!.length, 1);
      expect(vocab0.writings![0].writing, '明白');
      expect(vocab0.writings![0].writingSearchForm, null);
      expect(vocab0.writings![0].info, null);
      // Readings
      expect(vocab0.readings.length, 1);
      expect(vocab0.readings[0].reading, 'めいはく');
      expect(vocab0.readings[0].readingSearchForm, null);
      expect(vocab0.readings[0].readingRomaji, 'meihaku');
      expect(vocab0.readings[0].readingRomajiSimplified, null);
      expect(vocab0.readings[0].associatedWritings, null);
      expect(vocab0.readings[0].info, null);
      expect(vocab0.readings[0].pitchAccents, [0]);
      // Definitions
      expect(vocab0.definitions.length, 1);
      expect(vocab0.definitions[0].definition,
          'obvious; clear; plain; evident; apparent; explicit; overt');
      expect(vocab0.definitions[0].additionalInfo, null);
      expect(vocab0.definitions[0].pos, [PartOfSpeech.adjectiveNa]);
      expect(vocab0.definitions[0].appliesTo, null);
      expect(vocab0.definitions[0].miscInfo, null);
      expect(vocab0.definitions[0].dialects, null);
      expect(vocab0.definitions[0].examples!.length, 1);
      expect(vocab0.definitions[0].examples![0].japanese, '何をしなければならないかは明白です。');
      expect(vocab0.definitions[0].examples![0].english,
          'It is clear what must be done.');
      expect(vocab0.definitions[0].crossReferences, null);
      expect(vocab0.definitions[0].antonyms, null);

      final vocab1 = await database.vocabsDao.get(1000390);
      expect(vocab1.pos, null);
      expect(vocab1.common, true);
      expect(vocab1.frequencyScore, 0);
      // Writings
      expect(vocab1.writings!.length, 6);
      expect(vocab1.writings![0].writing, 'あっという間に');
      expect(vocab1.writings![0].writingSearchForm, null);
      expect(vocab1.writings![0].info, null);
      expect(vocab1.writings![1].writing, 'あっと言う間に');
      expect(vocab1.writings![1].writingSearchForm, null);
      expect(vocab1.writings![1].info, null);
      expect(vocab1.writings![2].writing, 'アッという間に');
      expect(vocab1.writings![2].writingSearchForm, 'あっという間に');
      expect(vocab1.writings![2].info, null);
      expect(vocab1.writings![3].writing, 'アッと言う間に');
      expect(vocab1.writings![3].writingSearchForm, 'あっと言う間に');
      expect(vocab1.writings![3].info, null);
      expect(vocab1.writings![4].writing, 'あっとゆう間に');
      expect(vocab1.writings![4].writingSearchForm, null);
      expect(vocab1.writings![4].info, [WritingInfo.searchOnlyForm]);
      expect(vocab1.writings![5].writing, 'アッとゆう間に');
      expect(vocab1.writings![5].writingSearchForm, 'あっとゆう間に');
      expect(vocab1.writings![5].info, [WritingInfo.searchOnlyForm]);
      // Readings
      expect(vocab1.readings.length, 1);
      expect(vocab1.readings[0].reading, 'あっというまに');
      expect(vocab1.readings[0].readingSearchForm, null);
      expect(vocab1.readings[0].readingRomaji, 'attoiumani');
      expect(vocab1.readings[0].readingRomajiSimplified, 'atoimani');
      expect(vocab1.readings[0].associatedWritings, null);
      expect(vocab1.readings[0].info, null);
      expect(vocab1.readings[0].pitchAccents, null);
      // Definition
      expect(vocab1.definitions.length, 1);
      expect(vocab1.definitions[0].definition,
          'in an instant; in a flash; in the blink of an eye; in no time at all; just like that');
      expect(vocab1.definitions[0].pos,
          [PartOfSpeech.expressions, PartOfSpeech.adverb]);
      expect(vocab1.definitions[0].examples!.length, 1);
      expect(vocab1.definitions[0].examples![0].japanese, '休暇はあっという間に終わった。');
      expect(vocab1.definitions[0].examples![0].english,
          'The holiday ended all too soon.');

      final vocab2 = await database.vocabsDao.get(1003430);
      expect(vocab2.pos, [PartOfSpeech.adverb]);
      expect(vocab2.common, true);
      expect(vocab2.frequencyScore, 0);
      // Writings
      expect(vocab2.writings!.length, 2);
      expect(vocab2.writings![0].writing, '屹度');
      expect(vocab2.writings![0].writingSearchForm, null);
      expect(vocab2.writings![0].info,
          [WritingInfo.ateji, WritingInfo.rareKanjiForm]);
      expect(vocab2.writings![1].writing, '急度');
      expect(vocab2.writings![1].writingSearchForm, null);
      expect(vocab2.writings![1].info,
          [WritingInfo.ateji, WritingInfo.rareKanjiForm]);
      // Readings
      expect(vocab2.readings.length, 2);
      expect(vocab2.readings[0].reading, 'きっと');
      expect(vocab2.readings[0].readingSearchForm, null);
      expect(vocab2.readings[0].readingRomaji, 'kitto');
      expect(vocab2.readings[0].readingRomajiSimplified, 'kito');
      expect(vocab2.readings[0].associatedWritings, null);
      expect(vocab2.readings[0].info, null);
      expect(vocab2.readings[0].pitchAccents, [0, 1]);
      expect(vocab2.readings[1].reading, 'キッと');
      expect(vocab2.readings[1].readingSearchForm, 'きっと');
      expect(vocab2.readings[1].readingRomaji, 'kitto');
      expect(vocab2.readings[1].readingRomajiSimplified, 'kito');
      expect(vocab2.readings[1].associatedWritings, null);
      expect(vocab2.readings[1].info, null);
      expect(vocab2.readings[1].pitchAccents, null);
      // Definitions
      expect(vocab2.definitions.length, 4);
      // Definition 1
      expect(vocab2.definitions[0].definition,
          'surely; undoubtedly; almost certainly; most likely (e.g. 90 percent)');
      expect(vocab2.definitions[0].pos, null);
      expect(vocab2.definitions[0].miscInfo, [
        MiscellaneousInfo.usuallyKanaAlone,
        MiscellaneousInfo.onomatopoeicOrMimeticWord
      ]);
      expect(vocab2.definitions[0].examples!.length, 1);
      expect(vocab2.definitions[0].examples![0].japanese,
          'でもよー、オラのおとうさんは良い気しねーよ、きっと。');
      expect(vocab2.definitions[0].examples![0].english,
          'But I don\'t think Dad would like me to.');
      // Definition 2
      expect(vocab2.definitions[1].definition, 'sternly; severely');
      expect(vocab2.definitions[1].additionalInfo, 'esp. キッと');
      expect(vocab2.definitions[1].pos, null);
      expect(vocab2.definitions[1].miscInfo, [
        MiscellaneousInfo.usuallyKanaAlone,
        MiscellaneousInfo.onomatopoeicOrMimeticWord
      ]);
      // Definition 3
      expect(vocab2.definitions[2].definition,
          'having no slack; rigid; stiff; tight');
      expect(vocab2.definitions[2].pos, null);
      expect(vocab2.definitions[2].miscInfo, [
        MiscellaneousInfo.usuallyKanaAlone,
        MiscellaneousInfo.onomatopoeicOrMimeticWord
      ]);
      // Definition 4
      expect(vocab2.definitions[3].definition, 'suddenly; abruptly; instantly');
      expect(vocab2.definitions[3].pos, null);
      expect(vocab2.definitions[3].miscInfo, [
        MiscellaneousInfo.usuallyKanaAlone,
        MiscellaneousInfo.onomatopoeicOrMimeticWord,
        MiscellaneousInfo.archaism
      ]);

      final vocab3 = await database.vocabsDao.get(1578850);
      expect(vocab3.pos, [PartOfSpeech.verbGodanKS]);
      expect(vocab3.common, true);
      expect(vocab3.frequencyScore, 0);
      // Writings
      expect(vocab3.writings!.length, 3);
      expect(vocab3.writings![0].writing, '行く');
      expect(vocab3.writings![0].writingSearchForm, null);
      expect(vocab3.writings![0].info, null);
      expect(vocab3.writings![1].writing, '逝く');
      expect(vocab3.writings![1].writingSearchForm, null);
      expect(vocab3.writings![1].info, null);
      expect(vocab3.writings![2].writing, '往く');
      expect(vocab3.writings![2].writingSearchForm, null);
      expect(vocab3.writings![2].info, [WritingInfo.outdatedKanji]);
      // Readings
      expect(vocab3.readings.length, 2);
      expect(vocab3.readings[0].reading, 'いく');
      expect(vocab3.readings[0].readingSearchForm, null);
      expect(vocab3.readings[0].readingRomaji, 'iku');
      expect(vocab3.readings[0].readingRomajiSimplified, null);
      expect(vocab3.readings[0].associatedWritings, null);
      expect(vocab3.readings[0].info, null);
      expect(vocab3.readings[0].pitchAccents, null);
      expect(vocab3.readings[1].reading, 'ゆく');
      expect(vocab3.readings[1].readingSearchForm, null);
      expect(vocab3.readings[1].readingRomaji, 'yuku');
      expect(vocab3.readings[1].readingRomajiSimplified, null);
      expect(vocab3.readings[1].associatedWritings, null);
      expect(vocab3.readings[1].info, null);
      expect(vocab3.readings[1].pitchAccents, null);
      // Definitions
      expect(vocab3.definitions.length, 10);
      // Definition 1
      expect(vocab3.definitions[0].definition,
          'to go; to move (in a direction or towards a specific location); to head (towards); to be transported (towards); to reach');
      expect(vocab3.definitions[0].pos, [PartOfSpeech.verbIntransitive]);
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
      expect(vocab3.definitions[1].pos, [PartOfSpeech.verbIntransitive]);
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
      expect(vocab3.definitions[2].pos, [PartOfSpeech.verbIntransitive]);
      expect(vocab3.definitions[2].examples!.length, 1);
      expect(vocab3.definitions[2].examples![0].japanese,
          'これらの規則はずっと守られてきたし、これからもいつも守られていくだろう。');
      expect(vocab3.definitions[2].examples![0].english,
          'These rules have been and always will be observed.');
      // Definition 4
      expect(vocab3.definitions[3].definition, 'to walk');
      expect(vocab3.definitions[3].pos, [PartOfSpeech.verbIntransitive]);
      // Definition 5
      expect(vocab3.definitions[4].definition, 'to die; to pass away');
      expect(vocab3.definitions[4].pos, [PartOfSpeech.verbIntransitive]);
      expect(vocab3.definitions[4].appliesTo!.length, 1);
      expect(vocab3.definitions[4].appliesTo![0], '逝く');
      // Definition 6
      expect(vocab3.definitions[5].definition, 'to do (in a specific way)');
      expect(vocab3.definitions[5].pos, [PartOfSpeech.verbIntransitive]);
      // Definition 7
      expect(vocab3.definitions[6].definition, 'to stream; to flow');
      expect(vocab3.definitions[6].pos, [PartOfSpeech.verbIntransitive]);
      // Definition 8
      expect(vocab3.definitions[7].definition, 'to continue');
      expect(
          vocab3.definitions[7].additionalInfo, 'after the -te form of a verb');
      expect(vocab3.definitions[7].pos, [PartOfSpeech.auxiliaryV]);
      expect(
          vocab3.definitions[7].miscInfo, [MiscellaneousInfo.usuallyKanaAlone]);
      // Definition 9
      expect(vocab3.definitions[8].definition,
          'to have an orgasm; to come; to cum');
      expect(vocab3.definitions[8].pos, [PartOfSpeech.verbIntransitive]);
      expect(
          vocab3.definitions[8].miscInfo, [MiscellaneousInfo.usuallyKanaAlone]);
      // Definition 10
      expect(vocab3.definitions[9].definition,
          'to trip; to get high; to have a drug-induced hallucination');
      expect(vocab3.definitions[9].pos, [PartOfSpeech.verbIntransitive]);
      expect(vocab3.definitions[9].miscInfo,
          [MiscellaneousInfo.usuallyKanaAlone, MiscellaneousInfo.slang]);

      final vocab4 = await database.vocabsDao.get(2002400);
      expect(vocab4.pos, [PartOfSpeech.interjection]);
      expect(vocab4.common, true);
      expect(vocab4.frequencyScore, 0);
      // Writings
      expect(vocab4.writings, null);
      //Readings
      expect(vocab4.readings.length, 3);
      expect(vocab4.readings[0].reading, 'ううん');
      expect(vocab4.readings[0].readingSearchForm, null);
      expect(vocab4.readings[0].readingRomaji, 'uun');
      expect(vocab4.readings[0].readingRomajiSimplified, 'un');
      expect(vocab4.readings[0].associatedWritings, null);
      expect(vocab4.readings[0].info, null);
      expect(vocab4.readings[0].pitchAccents, null);
      expect(vocab4.readings[1].reading, 'うーん');
      expect(vocab4.readings[1].readingSearchForm, null);
      expect(vocab4.readings[1].readingRomaji, 'u-n');
      expect(vocab4.readings[1].readingRomajiSimplified, 'un');
      expect(vocab4.readings[1].associatedWritings, null);
      expect(vocab4.readings[1].info, null);
      expect(vocab4.readings[1].pitchAccents, null);
      expect(vocab4.readings[2].reading, 'ウーン');
      expect(vocab4.readings[2].readingSearchForm, 'ううん');
      expect(vocab4.readings[2].readingRomaji, 'uun');
      expect(vocab4.readings[2].readingRomajiSimplified, 'un');
      expect(vocab4.readings[2].associatedWritings, null);
      expect(vocab4.readings[2].info, null);
      expect(vocab4.readings[2].pitchAccents, null);
      // Definitions
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

      final vocab5 = await database.vocabsDao.get(1002360);
      expect(vocab5.pos, null);
      expect(vocab5.common, false);
      expect(vocab5.frequencyScore, 0);
      // Writings
      expect(vocab5.writings!.length, 7);
      expect(vocab5.writings![0].writing, 'お待ちどおさま');
      expect(vocab5.writings![0].writingSearchForm, null);
      expect(vocab5.writings![0].info, null);
      expect(vocab5.writings![1].writing, 'お待ち遠様');
      expect(vocab5.writings![1].writingSearchForm, null);
      expect(vocab5.writings![1].info, null);
      expect(vocab5.writings![2].writing, '御待ち遠様');
      expect(vocab5.writings![2].writingSearchForm, null);
      expect(vocab5.writings![2].info, null);
      expect(vocab5.writings![3].writing, 'お待ち遠さま');
      expect(vocab5.writings![3].writingSearchForm, null);
      expect(vocab5.writings![3].info, null);
      expect(vocab5.writings![4].writing, 'お待ちどお様');
      expect(vocab5.writings![4].writingSearchForm, null);
      expect(vocab5.writings![4].info, null);
      expect(vocab5.writings![5].writing, 'お待ちどうさま');
      expect(vocab5.writings![5].writingSearchForm, null);
      expect(vocab5.writings![5].info, [WritingInfo.irregularKana]);
      expect(vocab5.writings![6].writing, 'お待ちどう様');
      expect(vocab5.writings![6].writingSearchForm, null);
      expect(vocab5.writings![6].info, [WritingInfo.irregularKana]);
      // Readings
      expect(vocab5.readings.length, 2);
      expect(vocab5.readings[0].reading, 'おまちどおさま');
      expect(vocab5.readings[0].readingSearchForm, null);
      expect(vocab5.readings[0].readingRomaji, 'omachidoosama');
      expect(vocab5.readings[0].readingRomajiSimplified, null);
      expect(vocab5.readings[0].associatedWritings!.length, 5);
      expect(vocab5.readings[0].associatedWritings![0], 'お待ちどおさま');
      expect(vocab5.readings[0].associatedWritings![1], 'お待ち遠様');
      expect(vocab5.readings[0].associatedWritings![2], '御待ち遠様');
      expect(vocab5.readings[0].associatedWritings![3], 'お待ち遠さま');
      expect(vocab5.readings[0].associatedWritings![4], 'お待ちどお様');
      expect(vocab5.readings[0].info, null);
      expect(vocab5.readings[0].pitchAccents, null);
      expect(vocab5.readings[1].reading, 'おまちどうさま');
      expect(vocab5.readings[1].readingSearchForm, null);
      expect(vocab5.readings[1].readingRomaji, 'omachidousama');
      expect(vocab5.readings[1].readingRomajiSimplified, 'omachidosama');
      expect(vocab5.readings[1].associatedWritings!.length, 5);
      expect(vocab5.readings[1].associatedWritings![0], 'お待ち遠様');
      expect(vocab5.readings[1].associatedWritings![1], '御待ち遠様');
      expect(vocab5.readings[1].associatedWritings![2], 'お待ち遠さま');
      expect(vocab5.readings[1].associatedWritings![3], 'お待ちどうさま');
      expect(vocab5.readings[1].associatedWritings![4], 'お待ちどう様');
      expect(vocab5.readings[1].info, [ReadingInfo.irregularKana]);
      expect(vocab5.readings[1].pitchAccents, null);
      // Definition
      expect(vocab5.definitions.length, 1);
      expect(vocab5.definitions[0].definition,
          'I\'m sorry to have kept you waiting');
      expect(vocab5.definitions[0].pos, [PartOfSpeech.expressions]);

      final vocab6 = await database.vocabsDao.get(1001390);
      expect(vocab6.pos, null);
      expect(vocab6.common, true);
      expect(vocab6.frequencyScore, 0);
      // Writings
      expect(vocab6.writings!.length, 2);
      expect(vocab6.writings![0].writing, '御田');
      expect(vocab6.writings![0].writingSearchForm, null);
      expect(vocab6.writings![0].info, [WritingInfo.rareKanjiForm]);
      expect(vocab6.writings![1].writing, 'お田');
      expect(vocab6.writings![1].writingSearchForm, null);
      expect(vocab6.writings![1].info, [WritingInfo.rareKanjiForm]);
      // Readings
      expect(vocab6.readings.length, 1);
      expect(vocab6.readings[0].reading, 'おでん');
      expect(vocab6.readings[0].readingSearchForm, null);
      expect(vocab6.readings[0].readingRomaji, 'oden');
      expect(vocab6.readings[0].readingRomajiSimplified, null);
      expect(vocab6.readings[0].associatedWritings, null);
      expect(vocab6.readings[0].info, null);
      expect(vocab6.readings[0].pitchAccents, [2]);
      // Definition
      expect(vocab6.definitions.length, 1);
      expect(vocab6.definitions[0].definition,
          'oden; dish of various ingredients, e.g. egg, daikon, potato, chikuwa, konnyaku stewed in soy-flavored dashi');
      expect(vocab6.definitions[0].pos, [PartOfSpeech.noun]);
      expect(vocab6.definitions[0].fields!.length, 1);
      expect(vocab6.definitions[0].fields![0], Field.foodCooking);
      expect(
          vocab6.definitions[0].miscInfo, [MiscellaneousInfo.usuallyKanaAlone]);

      final vocab7 = await database.vocabsDao.get(2067590);
      expect(vocab7.pos, null);
      expect(vocab7.common, false);
      expect(vocab7.frequencyScore, 0);
      // Writings
      expect(vocab7.writings, null);
      // Readings
      expect(vocab7.readings.length, 3);
      expect(vocab7.readings[0].reading, 'めんこい');
      expect(vocab7.readings[0].readingSearchForm, null);
      expect(vocab7.readings[0].readingRomaji, 'menkoi');
      expect(vocab7.readings[0].readingRomajiSimplified, null);
      expect(vocab7.readings[0].associatedWritings, null);
      expect(vocab7.readings[0].info, null);
      expect(vocab7.readings[0].pitchAccents, null);
      expect(vocab7.readings[1].reading, 'めごい');
      expect(vocab7.readings[1].readingSearchForm, null);
      expect(vocab7.readings[1].readingRomaji, 'megoi');
      expect(vocab7.readings[1].readingRomajiSimplified, null);
      expect(vocab7.readings[1].associatedWritings, null);
      expect(vocab7.readings[1].info, null);
      expect(vocab7.readings[1].pitchAccents, null);
      expect(vocab7.readings[2].reading, 'めんごい');
      expect(vocab7.readings[2].readingSearchForm, null);
      expect(vocab7.readings[2].readingRomaji, 'mengoi');
      expect(vocab7.readings[2].readingRomajiSimplified, null);
      expect(vocab7.readings[2].associatedWritings, null);
      expect(vocab7.readings[2].info, null);
      expect(vocab7.readings[2].pitchAccents, null);
      // Definition
      expect(vocab7.definitions.length, 1);
      expect(vocab7.definitions[0].definition,
          'dear; darling; adorable; precious; cute; lovely; sweet; beloved; charming');
      expect(vocab7.definitions[0].pos!.length, 1);
      expect(vocab7.definitions[0].pos![0], PartOfSpeech.adjectiveI);
      expect(vocab7.definitions[0].dialects!.length, 2);
      expect(vocab7.definitions[0].dialects![0], Dialect.touhokuBen);
      expect(vocab7.definitions[0].dialects![1], Dialect.hokkaidoBen);

      final vocab8 = await database.vocabsDao.get(1000160);
      expect(vocab8.pos, null);
      expect(vocab8.common, true);
      expect(vocab8.frequencyScore, 0);
      // Writings
      expect(vocab8.writings!.length, 1);
      expect(vocab8.writings![0].writing, 'Ｔシャツ');
      expect(vocab8.writings![0].writingSearchForm, 'tしゃつ');
      expect(vocab8.writings![0].info, null);
      // Readings
      expect(vocab8.readings.length, 1);
      expect(vocab8.readings[0].reading, 'ティーシャツ');
      expect(vocab8.readings[0].readingSearchForm, 'てぃいしゃつ');
      expect(vocab8.readings[0].readingRomaji, 'teiishatsu');
      expect(vocab8.readings[0].readingRomajiSimplified, 'teishatsu');
      expect(vocab8.readings[0].associatedWritings, null);
      expect(vocab8.readings[0].info, null);
      expect(vocab8.readings[0].pitchAccents, null);
      // Definition
      expect(vocab8.definitions.length, 1);
      expect(vocab8.definitions[0].definition, 'T-shirt; tee shirt');
      expect(vocab8.definitions[0].pos!.length, 1);
      expect(vocab8.definitions[0].pos![0], PartOfSpeech.noun);

      final vocab9 = await database.vocabsDao.get(1310840);
      expect(vocab9.definitions[0].crossReferences, null);
      expect(vocab9.definitions[0].antonyms!.length, 1);
      expect(vocab9.definitions[0].antonyms![0].ids, null);
      expect(vocab9.definitions[0].antonyms![0].text, '活語');

      // Radicals
      final radical1 = await database.radicalsDao.get('一');
      expect(radical1.radical, '一');
      expect(radical1.kangxiId, 1);
      expect(radical1.strokeCount, 1);
      expect(radical1.meaning, 'one');
      expect(radical1.reading, 'イチ');
      expect(radical1.position, null);
      expect(radical1.importance, RadicalImportance.top75);
      expect(radical1.strokes!.length, 1);
      expect(radical1.variants, null);
      expect(radical1.variantOf, null);

      final radical2 = await database.radicalsDao.get('乙');
      expect(radical2.radical, '乙');
      expect(radical2.strokeCount, 1);
      expect(radical2.meaning, 'second');
      expect(radical2.kangxiId, 5);
      expect(radical2.reading, 'オツ, おつにょう, つりばり');
      expect(radical2.position, null);
      expect(radical2.importance, null);
      expect(radical2.variants, ['乚']);
      expect(radical2.variantOf, null);

      final radical3 = await database.radicalsDao.get('乚');
      expect(radical3.radical, '乚');
      expect(radical3.kangxiId, null);
      expect(radical3.strokeCount, 1);
      expect(radical3.meaning, 'second');
      expect(radical3.reading, 'オツ, おつにょう, つりばり');
      expect(radical3.position, null);
      expect(radical3.importance, null);
      expect(radical3.variants, null);
      expect(radical3.variantOf, '乙');

      // Kanji
      final kanji1 = await database.kanjisDao.getKanji('亜');
      expect(kanji1.kanji, '亜');
      expect(kanji1.meaning, 'Asia; rank next; come after; -ous');
      expect(kanji1.radical, '二');
      expect(kanji1.components!.length, 2);
      expect(kanji1.components![0], '一');
      expect(kanji1.components![1], '口');
      expect(kanji1.grade, KanjiGrade.middleSchool);
      expect(kanji1.strokeCount, 7);
      expect(kanji1.frequency, 1509);
      expect(kanji1.jlpt, JlptLevel.n1);
      expect(kanji1.strokes!.length, 7);
      expect(kanji1.compounds, null);
      expect(kanji1.onReadings!.length, 1);
      expect(kanji1.onReadings![0].reading, 'ア');
      expect(kanji1.onReadings![0].readingSearchForm, 'あ');
      expect(kanji1.onReadings![0].readingRomaji, 'a');
      expect(kanji1.onReadings![0].readingRomajiSimplified, null);
      expect(kanji1.kunReadings!.length, 1);
      expect(kanji1.kunReadings![0].reading, 'つ.ぐ');
      expect(kanji1.kunReadings![0].readingSearchForm, 'つぐ');
      expect(kanji1.kunReadings![0].readingRomaji, 'tsugu');
      expect(kanji1.kunReadings![0].readingRomajiSimplified, null);
      expect(kanji1.nanori!.length, 3);
      expect(kanji1.nanori![0].reading, 'や');
      expect(kanji1.nanori![0].readingSearchForm, null);
      expect(kanji1.nanori![0].readingRomaji, 'ya');
      expect(kanji1.nanori![0].readingRomajiSimplified, null);
      expect(kanji1.nanori![1].reading, 'つぎ');
      expect(kanji1.nanori![1].readingSearchForm, null);
      expect(kanji1.nanori![1].readingRomaji, 'tsugi');
      expect(kanji1.nanori![1].readingRomajiSimplified, null);
      expect(kanji1.nanori![2].reading, 'つぐ');
      expect(kanji1.nanori![2].readingSearchForm, null);
      expect(kanji1.nanori![2].readingRomaji, 'tsugu');
      expect(kanji1.nanori![2].readingRomajiSimplified, null);

      final kanji2 = await database.kanjisDao.getKanji('悪');
      expect(kanji2.kanji, '悪');
      expect(kanji2.meaning, 'bad; vice; rascal; false; evil; wrong');
      expect(kanji2.radical, '心');
      expect(kanji2.components!.length, 2);
      expect(kanji2.components![0], '一');
      expect(kanji2.components![1], '口');
      expect(kanji2.grade, KanjiGrade.third);
      expect(kanji2.strokeCount, 11);
      expect(kanji2.frequency, 530);
      expect(kanji2.jlpt, JlptLevel.n3);
      expect(kanji2.strokes, null);
      expect(kanji2.compounds, null);
      expect(kanji2.onReadings!.length, 2);
      expect(kanji2.onReadings![0].reading, 'アク');
      expect(kanji2.onReadings![0].readingSearchForm, 'あく');
      expect(kanji2.onReadings![0].readingRomaji, 'aku');
      expect(kanji2.onReadings![0].readingRomajiSimplified, null);
      expect(kanji2.onReadings![1].reading, 'オ');
      expect(kanji2.onReadings![1].readingSearchForm, 'お');
      expect(kanji2.onReadings![1].readingRomaji, 'o');
      expect(kanji2.onReadings![1].readingRomajiSimplified, null);
      expect(kanji2.kunReadings!.length, 9);
      expect(kanji2.kunReadings![0].reading, 'わる.い');
      expect(kanji2.kunReadings![0].readingSearchForm, 'わるい');
      expect(kanji2.kunReadings![0].readingRomaji, 'warui');
      expect(kanji2.kunReadings![0].readingRomajiSimplified, null);
      expect(kanji2.kunReadings![1].reading, 'わる-');
      expect(kanji2.kunReadings![1].readingSearchForm, 'わる');
      expect(kanji2.kunReadings![1].readingRomaji, 'waru');
      expect(kanji2.kunReadings![1].readingRomajiSimplified, null);
      expect(kanji2.kunReadings![2].reading, 'あ.し');
      expect(kanji2.kunReadings![2].readingSearchForm, 'あし');
      expect(kanji2.kunReadings![2].readingRomaji, 'ashi');
      expect(kanji2.kunReadings![2].readingRomajiSimplified, null);
      expect(kanji2.kunReadings![3].reading, 'にく.い');
      expect(kanji2.kunReadings![3].readingSearchForm, 'にくい');
      expect(kanji2.kunReadings![3].readingRomaji, 'nikui');
      expect(kanji2.kunReadings![3].readingRomajiSimplified, null);
      expect(kanji2.kunReadings![4].reading, '-にく.い');
      expect(kanji2.kunReadings![4].readingSearchForm, 'にくい');
      expect(kanji2.kunReadings![4].readingRomaji, 'nikui');
      expect(kanji2.kunReadings![4].readingRomajiSimplified, null);
      expect(kanji2.kunReadings![5].reading, 'ああ');
      expect(kanji2.kunReadings![5].readingSearchForm, null);
      expect(kanji2.kunReadings![5].readingRomaji, 'aa');
      expect(kanji2.kunReadings![5].readingRomajiSimplified, null);
      expect(kanji2.kunReadings![6].reading, 'いずくに');
      expect(kanji2.kunReadings![6].readingSearchForm, null);
      expect(kanji2.kunReadings![6].readingRomaji, 'izukuni');
      expect(kanji2.kunReadings![6].readingRomajiSimplified, null);
      expect(kanji2.kunReadings![7].reading, 'いずくんぞ');
      expect(kanji2.kunReadings![7].readingSearchForm, null);
      expect(kanji2.kunReadings![7].readingRomaji, 'izukunzo');
      expect(kanji2.kunReadings![7].readingRomajiSimplified, null);
      expect(kanji2.kunReadings![8].reading, 'にく.む');
      expect(kanji2.kunReadings![8].readingSearchForm, 'にくむ');
      expect(kanji2.kunReadings![8].readingRomaji, 'nikumu');
      expect(kanji2.kunReadings![8].readingRomajiSimplified, null);
      expect(kanji2.nanori, null);

      final kanji3 = await database.kanjisDao.getKanji('亞');
      expect(kanji3.kanji, '亞');
      expect(kanji3.meaning, 'rank; follow');
      expect(kanji3.radical, '二');
      expect(kanji3.components!.length, 1);
      expect(kanji3.components![0], '一');
      expect(kanji3.grade, KanjiGrade.jinmeiyou);
      expect(kanji3.strokeCount, 8);
      expect(kanji3.frequency, null);
      expect(kanji3.jlpt, null);
      expect(kanji3.strokes, null);
      expect(kanji3.compounds, null);
      expect(kanji3.onReadings!.length, 1);
      expect(kanji3.onReadings![0].reading, 'ア');
      expect(kanji3.onReadings![0].readingSearchForm, 'あ');
      expect(kanji3.onReadings![0].readingRomaji, 'a');
      expect(kanji3.onReadings![0].readingRomajiSimplified, null);
      expect(kanji3.kunReadings!.length, 1);
      expect(kanji3.kunReadings![0].reading, 'つ.ぐ');
      expect(kanji3.kunReadings![0].readingSearchForm, 'つぐ');
      expect(kanji3.kunReadings![0].readingRomaji, 'tsugu');
      expect(kanji3.kunReadings![0].readingRomajiSimplified, null);
      expect(kanji3.nanori, null);

      final kanji4 = await database.kanjisDao.getKanji('行');
      expect(kanji4.kanji, '行');
      expect(
        kanji4.meaning,
        'going; journey; carry out; conduct; act; line; row; bank',
      );
      expect(kanji4.radical, '行');
      expect(kanji4.components, null);
      expect(kanji4.grade, KanjiGrade.second);
      expect(kanji4.strokeCount, 6);
      expect(kanji4.frequency, 20);
      expect(kanji4.jlpt, JlptLevel.n4);
      expect(kanji4.strokes, null);
      expect(kanji4.compounds!.length, 2);
      expect(kanji4.compounds![0], 1310500);
      expect(kanji4.compounds![1], 1578850);
      expect(kanji4.onReadings!.length, 3);
      expect(kanji4.onReadings![0].reading, 'コウ');
      expect(kanji4.onReadings![0].readingSearchForm, 'こう');
      expect(kanji4.onReadings![0].readingRomaji, 'kou');
      expect(kanji4.onReadings![0].readingRomajiSimplified, null);
      expect(kanji4.onReadings![1].reading, 'ギョウ');
      expect(kanji4.onReadings![1].readingSearchForm, 'ぎょう');
      expect(kanji4.onReadings![1].readingRomaji, 'gyou');
      expect(kanji4.onReadings![1].readingRomajiSimplified, null);
      expect(kanji4.onReadings![2].reading, 'アン');
      expect(kanji4.onReadings![2].readingSearchForm, 'あん');
      expect(kanji4.onReadings![2].readingRomaji, 'an');
      expect(kanji4.onReadings![2].readingRomajiSimplified, null);
      expect(kanji4.kunReadings!.length, 8);
      expect(kanji4.kunReadings![0].reading, 'い.く');
      expect(kanji4.kunReadings![0].readingSearchForm, 'いく');
      expect(kanji4.kunReadings![0].readingRomaji, 'iku');
      expect(kanji4.kunReadings![0].readingRomajiSimplified, null);
      expect(kanji4.kunReadings![1].reading, 'ゆ.く');
      expect(kanji4.kunReadings![1].readingSearchForm, 'ゆく');
      expect(kanji4.kunReadings![1].readingRomaji, 'yuku');
      expect(kanji4.kunReadings![1].readingRomajiSimplified, null);
      expect(kanji4.kunReadings![2].reading, '-ゆ.き');
      expect(kanji4.kunReadings![2].readingSearchForm, 'ゆき');
      expect(kanji4.kunReadings![2].readingRomaji, 'yuki');
      expect(kanji4.kunReadings![2].readingRomajiSimplified, null);
      expect(kanji4.kunReadings![3].reading, '-ゆき');
      expect(kanji4.kunReadings![3].readingSearchForm, 'ゆき');
      expect(kanji4.kunReadings![3].readingRomaji, 'yuki');
      expect(kanji4.kunReadings![3].readingRomajiSimplified, null);
      expect(kanji4.kunReadings![4].reading, '-い.き');
      expect(kanji4.kunReadings![4].readingSearchForm, 'いき');
      expect(kanji4.kunReadings![4].readingRomaji, 'iki');
      expect(kanji4.kunReadings![4].readingRomajiSimplified, null);
      expect(kanji4.kunReadings![5].reading, '-いき');
      expect(kanji4.kunReadings![5].readingSearchForm, 'いき');
      expect(kanji4.kunReadings![5].readingRomaji, 'iki');
      expect(kanji4.kunReadings![5].readingRomajiSimplified, null);
      expect(kanji4.kunReadings![6].reading, 'おこな.う');
      expect(kanji4.kunReadings![6].readingSearchForm, 'おこなう');
      expect(kanji4.kunReadings![6].readingRomaji, 'okonau');
      expect(kanji4.kunReadings![6].readingRomajiSimplified, null);
      expect(kanji4.kunReadings![7].reading, 'おこ.なう');
      expect(kanji4.kunReadings![7].readingSearchForm, 'おこなう');
      expect(kanji4.kunReadings![7].readingRomaji, 'okonau');
      expect(kanji4.kunReadings![7].readingRomajiSimplified, null);
      expect(kanji4.nanori!.length, 6);
      expect(kanji4.nanori![0].reading, 'いく');
      expect(kanji4.nanori![0].readingSearchForm, null);
      expect(kanji4.nanori![0].readingRomaji, 'iku');
      expect(kanji4.nanori![0].readingRomajiSimplified, null);
      expect(kanji4.nanori![1].reading, 'なみ');
      expect(kanji4.nanori![1].readingSearchForm, null);
      expect(kanji4.nanori![1].readingRomaji, 'nami');
      expect(kanji4.nanori![1].readingRomajiSimplified, null);
      expect(kanji4.nanori![2].reading, 'なめ');
      expect(kanji4.nanori![2].readingSearchForm, null);
      expect(kanji4.nanori![2].readingRomaji, 'name');
      expect(kanji4.nanori![2].readingRomajiSimplified, null);
      expect(kanji4.nanori![3].reading, 'みち');
      expect(kanji4.nanori![3].readingSearchForm, null);
      expect(kanji4.nanori![3].readingRomaji, 'michi');
      expect(kanji4.nanori![3].readingRomajiSimplified, null);
      expect(kanji4.nanori![4].reading, 'ゆき');
      expect(kanji4.nanori![4].readingSearchForm, null);
      expect(kanji4.nanori![4].readingRomaji, 'yuki');
      expect(kanji4.nanori![4].readingRomajiSimplified, null);
      expect(kanji4.nanori![5].reading, 'ゆく');
      expect(kanji4.nanori![5].readingSearchForm, null);
      expect(kanji4.nanori![5].readingRomaji, 'yuku');
      expect(kanji4.nanori![5].readingRomajiSimplified, null);

      // Predefined dictionary lists
      final n5List = await database.predefinedDictionaryListsDao
          .get(SagaseDictionaryConstants.dictionaryListIdJlptVocabN5);
      expect(n5List.vocab.length, 1);
      expect(n5List.vocab[0], 1578850);

      final jouyouList = await database.predefinedDictionaryListsDao
          .get(SagaseDictionaryConstants.dictionaryListIdJouyou);
      expect(jouyouList.kanji.length, 1);
      expect(jouyouList.kanji[0], '亜'.kanjiCodePoint());
    });
  });
}
