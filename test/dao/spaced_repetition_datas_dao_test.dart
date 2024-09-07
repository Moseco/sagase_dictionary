import 'package:drift/drift.dart' as drift;
import 'package:sagase_dictionary/src/database.dart';
import 'package:sagase_dictionary/src/datamodels/spaced_repetition_datas.dart';
import 'package:sagase_dictionary/src/dictionary_builder.dart';
import 'package:sagase_dictionary/src/utils/enums.dart';
import 'package:test/test.dart';

import '../common.dart';

void main() {
  group('DictionaryInfosDaoTest', () {
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

    test('vocabId and kanjiId constraints', () async {
      expect(
        () async => await database
            .into(database.spacedRepetitionDatas)
            .insert(SpacedRepetitionDatasCompanion(
              vocabId: drift.Value(0),
              kanjiId: drift.Value(0),
              frontType: drift.Value(FrontType.japanese),
              interval: drift.Value(0),
              repetitions: drift.Value(0),
              easeFactor: drift.Value(0),
              dueDate: drift.Value(0),
              totalAnswers: drift.Value(0),
              totalWrongAnswers: drift.Value(0),
            )),
        throwsException,
      );

      expect(
        () async => await database
            .into(database.spacedRepetitionDatas)
            .insert(SpacedRepetitionDatasCompanion(
              vocabId: drift.Value(1),
              kanjiId: drift.Value(1),
              frontType: drift.Value(FrontType.japanese),
              interval: drift.Value(0),
              repetitions: drift.Value(0),
              easeFactor: drift.Value(0),
              dueDate: drift.Value(0),
              totalAnswers: drift.Value(0),
              totalWrongAnswers: drift.Value(0),
            )),
        throwsException,
      );
    });

    test('set', () async {
      // Set initial
      final vocab = await database.vocabsDao.get(1000160);

      await database.spacedRepetitionDatasDao.set(
        SpacedRepetitionData.initial(
          dictionaryItem: vocab,
          frontType: FrontType.japanese,
        ),
      );

      expect(
        (await database.vocabsDao.get(1000160, frontType: FrontType.japanese))
            .spacedRepetitionData!
            .repetitions,
        0,
      );

      // Overwrite
      await database.spacedRepetitionDatasDao.set(
        SpacedRepetitionData.initial(
          dictionaryItem: vocab,
          frontType: FrontType.japanese,
        ).copyWith(repetitions: 1),
      );

      expect(
        (await database.vocabsDao.get(1000160, frontType: FrontType.japanese))
            .spacedRepetitionData!
            .repetitions,
        1,
      );
    });

    test('deleteSpacedRepetitionData', () async {
      final vocab = await database.vocabsDao.get(1000160);

      await database.spacedRepetitionDatasDao.set(
        SpacedRepetitionData.initial(
          dictionaryItem: vocab,
          frontType: FrontType.japanese,
        ),
      );

      await database.spacedRepetitionDatasDao
          .deleteSpacedRepetitionData(vocab, FrontType.japanese);

      expect(
        (await database.vocabsDao.get(1000160, frontType: FrontType.japanese))
            .spacedRepetitionData,
        null,
      );
    });

    test('getAll', () async {
      final vocab = await database.vocabsDao.get(1000160);

      await database.spacedRepetitionDatasDao.set(
        SpacedRepetitionData.initial(
          dictionaryItem: vocab,
          frontType: FrontType.japanese,
        ),
      );

      await database.spacedRepetitionDatasDao.set(
        SpacedRepetitionData.initial(
          dictionaryItem: vocab,
          frontType: FrontType.english,
        ),
      );

      final results = await database.spacedRepetitionDatasDao.getAll();
      expect(results.length, 2);
    });

    test('deleteAll', () async {
      final vocab = await database.vocabsDao.get(1000160);

      await database.spacedRepetitionDatasDao.set(
        SpacedRepetitionData.initial(
          dictionaryItem: vocab,
          frontType: FrontType.japanese,
        ),
      );

      expect(
        (await database.spacedRepetitionDatasDao.getAll()).length,
        1,
      );

      await database.spacedRepetitionDatasDao.deleteAll();

      expect(
        (await database.spacedRepetitionDatasDao.getAll()).length,
        0,
      );
    });
  });
}
