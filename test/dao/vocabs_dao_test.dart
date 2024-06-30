import 'package:sagase_dictionary/src/database.dart';
import 'package:sagase_dictionary/src/datamodels/spaced_repetition_datas.dart';
import 'package:sagase_dictionary/src/dictionary_builder.dart';
import 'package:sagase_dictionary/src/utils/enums.dart';
import 'package:test/test.dart';

import '../common.dart';

void main() {
  group('DictionaryListsDaoTest', () {
    late AppDatabase database;

    setUp(() async {
      // Create basic database with data
      database = AppDatabase();

      // Vocab
      await DictionaryBuilder.createVocabDictionary(
        database,
        shortJMdict,
        shortPitchAccentData,
        shortFrequencyListData,
      );
    });

    tearDown(() async {
      await database.close();
    });

    test('get', () async {
      final vocab = await database.vocabsDao.get(1000220);
      expect(vocab.id, 1000220);
      expect(vocab.writings!.length, 1);
      expect(vocab.writings![0].writing, '明白');
      expect(vocab.readings.length, 1);
      expect(vocab.readings[0].reading, 'めいはく');
      expect(vocab.definitions.length, 1);
      expect(
        vocab.definitions[0].definition,
        'obvious; clear; plain; evident; apparent; explicit; overt',
      );
    });

    test('get - with spaced repetition - does not exist', () async {
      final vocab = await database.vocabsDao.get(
        1000220,
        frontType: FrontType.japanese,
      );
      expect(vocab.id, 1000220);
      expect(vocab.spacedRepetitionData, null);
    });

    test('get - with spaced repetition - does exists', () async {
      await database.spacedRepetitionDatasDao.set(
        SpacedRepetitionData.initial(
          dictionaryItem: await database.vocabsDao.get(1000220),
          frontType: FrontType.japanese,
        ),
      );

      final vocab = await database.vocabsDao.get(
        1000220,
        frontType: FrontType.japanese,
      );
      expect(vocab.id, 1000220);
      expect(vocab.spacedRepetitionData!.frontType, FrontType.japanese);
    });

    test('get - with spaced repetition - both exist', () async {
      await database.spacedRepetitionDatasDao.set(
        SpacedRepetitionData.initial(
          dictionaryItem: await database.vocabsDao.get(1000220),
          frontType: FrontType.japanese,
        ),
      );
      await database.spacedRepetitionDatasDao.set(
        SpacedRepetitionData.initial(
          dictionaryItem: await database.vocabsDao.get(1000220),
          frontType: FrontType.english,
        ),
      );

      final vocab = await database.vocabsDao.get(
        1000220,
        frontType: FrontType.english,
      );
      expect(vocab.id, 1000220);
      expect(vocab.spacedRepetitionData!.frontType, FrontType.english);
    });

    test('getAll', () async {
      final vocabList = await database.vocabsDao.getAll([1000220, 1000160]);
      expect(vocabList.length, 2);
      expect(vocabList[0].id, 1000220);
      expect(vocabList[0].writings!.length, 1);
      expect(vocabList[0].writings![0].writing, '明白');
      expect(vocabList[0].readings.length, 1);
      expect(vocabList[0].readings[0].reading, 'めいはく');
      expect(vocabList[0].definitions.length, 1);
      expect(
        vocabList[0].definitions[0].definition,
        'obvious; clear; plain; evident; apparent; explicit; overt',
      );
      expect(vocabList[1].id, 1000160);
    });

    test('validateAllVocab', () async {
      final vocabList = await database.vocabsDao.validateAllVocab([1000220, 7]);
      expect(vocabList.length, 1);
      expect(vocabList[0].id, 1000220);
    });

    test('getVocabByWriting', () async {
      final vocabList = await database.vocabsDao.getVocabByWriting('明白');
      expect(vocabList.length, 1);
      expect(vocabList[0].id, 1000220);
      expect(vocabList[0].writings!.length, 1);
      expect(vocabList[0].writings![0].writing, '明白');
      expect(vocabList[0].readings.length, 1);
      expect(vocabList[0].readings[0].reading, 'めいはく');
      expect(vocabList[0].definitions.length, 1);
    });

    test('getVocabByReading', () async {
      final vocabList = await database.vocabsDao.getVocabByReading('めいはく');
      expect(vocabList.length, 1);
      expect(vocabList[0].id, 1000220);
      expect(vocabList[0].writings!.length, 1);
      expect(vocabList[0].writings![0].writing, '明白');
      expect(vocabList[0].readings.length, 1);
      expect(vocabList[0].readings[0].reading, 'めいはく');
      expect(vocabList[0].definitions.length, 1);
    });

    test('getUsingKanji', () async {
      final vocabList = await database.vocabsDao.getUsingKanji('行');
      expect(vocabList.length, 2);
      expect(vocabList[0].writings![0].writing, '上手く行く');
      expect(vocabList[1].writings![0].writing, '行く');
    });

    test('searchVocab - definition single word', () async {
      final results = await database.vocabsDao.search('shirt');
      expect(results.length, 1);
      expect(results[0].id, 1000160);
    });

    test('searchVocab - definition partial word', () async {
      final results = await database.vocabsDao.search('shir');
      expect(results.length, 1);
      expect(results[0].id, 1000160);
    });

    test('searchVocab - definition multiple words', () async {
      final results = await database.vocabsDao.search('in a flash');
      expect(results.length, 1);
      expect(results[0].id, 1000390);
    });

    test('searchVocab - definition single and partial word', () async {
      final results = await database.vocabsDao.search('no ti');
      expect(results.length, 2);
      expect(results[0].id, 1000390);
      expect(results[1].id, 1003430);
    });

    test('searchVocab - writing complete', () async {
      final results = await database.vocabsDao.search('行く');
      expect(results.length, 1);
      expect(results[0].id, 1578850);
    });

    test('searchVocab - writing partial', () async {
      final results = await database.vocabsDao.search('行');
      expect(results.length, 1);
      expect(results[0].id, 1578850);
    });

    test('searchVocab - reading complete', () async {
      final results = await database.vocabsDao.search('きっと');
      expect(results.length, 1);
      expect(results[0].id, 1003430);
    });

    test('searchVocab - reading partial', () async {
      final results = await database.vocabsDao.search('きっ');
      expect(results.length, 1);
      expect(results[0].id, 1003430);
    });

    test('searchVocab - reading romaji complete', () async {
      final results = await database.vocabsDao.search('kitto');
      expect(results.length, 1);
      expect(results[0].id, 1003430);
    });

    test('searchVocab - reading romaji partial', () async {
      final results = await database.vocabsDao.search('kitt');
      expect(results.length, 1);
      expect(results[0].id, 1003430);
    });

    test('searchVocab - reading romaji simplified', () async {
      final results = await database.vocabsDao.search('kito');
      expect(results.length, 1);
      expect(results[0].id, 1003430);
    });
  });
}
