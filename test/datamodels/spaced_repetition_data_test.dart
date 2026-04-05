import 'dart:convert';

import 'package:drift/drift.dart' as drift;
import 'package:drift_dev/api/migrations_native.dart';
import 'package:sagase_dictionary/src/database.dart';
import 'package:sagase_dictionary/src/datamodels/spaced_repetition_datas.dart';
import 'package:sagase_dictionary/src/utils/constants.dart';
import 'package:sagase_dictionary/src/utils/enums.dart';
import 'package:test/test.dart';
import '../drift/my_database/generated/schema.dart';
import '../drift/my_database/generated/schema_v3.dart' as v3;
import '../drift/my_database/generated/schema_v4.dart' as v4;
import '../drift/my_database/generated/schema_v5.dart' as v5;

void main() {
  group('SpacedRepetitionDataTest', () {
    test('toBackupJson and fromBackupJson', () {
      final data = SpacedRepetitionData(
        itemId: 1,
        itemType: DictionaryItemType.vocab,
        frontType: FrontType.japanese,
        interval: 1,
        repetitions: 2,
        easeFactor: 3,
        dueDate: 2022,
        totalAnswers: 5,
        totalWrongAnswers: 4,
      );

      // Backup and import
      final newData = SpacedRepetitionData.fromBackupJson(
        jsonDecode(data.toBackupJson()),
        data.itemId,
        data.itemType,
        data.frontType,
      );

      expect(newData.itemId, 1);
      expect(newData.itemType, DictionaryItemType.vocab);
      expect(newData.frontType, FrontType.japanese);
      expect(newData.interval, 1);
      expect(newData.repetitions, 2);
      expect(newData.easeFactor, 3);
      expect(newData.dueDate, 2022);
      expect(newData.totalAnswers, 5);
      expect(newData.totalWrongAnswers, 4);
    });

    test('fromBackupJsonOld - vocab', () {
      final newData = SpacedRepetitionData.fromBackupJsonOld(
        {
          SagaseDictionaryConstants.backupSpacedRepetitionDataInterval: 1,
          SagaseDictionaryConstants.backupSpacedRepetitionDataRepetitions: 2,
          SagaseDictionaryConstants.backupSpacedRepetitionDataEaseFactor: 3.0,
          SagaseDictionaryConstants.backupSpacedRepetitionDataDueDate: 2022,
          SagaseDictionaryConstants.backupSpacedRepetitionDataTotalAnswers: 5,
          SagaseDictionaryConstants.backupSpacedRepetitionDataTotalWrongAnswers:
              4,
        },
        vocabId: 1,
        kanjiId: 0,
        frontType: FrontType.japanese,
      );

      expect(newData.itemId, 1);
      expect(newData.itemType, DictionaryItemType.vocab);
      expect(newData.frontType, FrontType.japanese);
      expect(newData.interval, 1);
      expect(newData.repetitions, 2);
      expect(newData.easeFactor, 3);
      expect(newData.dueDate, 2022);
      expect(newData.totalAnswers, 5);
      expect(newData.totalWrongAnswers, 4);
    });

    test('fromBackupJsonOld - kanji', () {
      final newData = SpacedRepetitionData.fromBackupJsonOld(
        {
          SagaseDictionaryConstants.backupSpacedRepetitionDataInterval: 1,
          SagaseDictionaryConstants.backupSpacedRepetitionDataRepetitions: 2,
          SagaseDictionaryConstants.backupSpacedRepetitionDataEaseFactor: 3.0,
          SagaseDictionaryConstants.backupSpacedRepetitionDataDueDate: 2022,
          SagaseDictionaryConstants.backupSpacedRepetitionDataTotalAnswers: 5,
          SagaseDictionaryConstants.backupSpacedRepetitionDataTotalWrongAnswers:
              4,
        },
        vocabId: 0,
        kanjiId: 1,
        frontType: FrontType.japanese,
      );

      expect(newData.itemId, 1);
      expect(newData.itemType, DictionaryItemType.kanji);
      expect(newData.frontType, FrontType.japanese);
      expect(newData.interval, 1);
      expect(newData.repetitions, 2);
      expect(newData.easeFactor, 3);
      expect(newData.dueDate, 2022);
      expect(newData.totalAnswers, 5);
      expect(newData.totalWrongAnswers, 4);
    });

    test('migrates table from v3 to v5', () async {
      final verifier = SchemaVerifier(GeneratedHelper());

      final schema = await verifier.schemaAt(3);

      // Add some data to the table being migrated
      final oldDb = v3.DatabaseAtV3(schema.newConnection());
      await oldDb
          .into(oldDb.spacedRepetitionDatas)
          .insert(v3.SpacedRepetitionDatasCompanion(
            vocabId: drift.Value(1),
            kanjiId: drift.Value(0),
            frontType: drift.Value(FrontType.japanese.index),
            interval: drift.Value(5),
            repetitions: drift.Value(10),
            easeFactor: drift.Value(2.5),
            dueDate: drift.Value(1234567890),
            totalAnswers: drift.Value(15),
            totalWrongAnswers: drift.Value(3),
          ));
      await oldDb
          .into(oldDb.spacedRepetitionDatas)
          .insert(v3.SpacedRepetitionDatasCompanion(
            vocabId: drift.Value(0),
            kanjiId: drift.Value(2),
            frontType: drift.Value(FrontType.english.index),
            interval: drift.Value(3),
            repetitions: drift.Value(7),
            easeFactor: drift.Value(2.8),
            dueDate: drift.Value(0),
            totalAnswers: drift.Value(20),
            totalWrongAnswers: drift.Value(5),
          ));
      await oldDb.close();

      // Run migration to v4
      final db = AppDatabase(schema.newConnection());
      await verifier.migrateAndValidate(db, 4);
      await db.close();

      // Verify the data at v4
      final v4Db = v4.DatabaseAtV4(schema.newConnection());
      final vocabDataV4 = await (v4Db.select(v4Db.spacedRepetitionDatas)
            ..where((spacedRepetitionDatas) =>
                spacedRepetitionDatas.vocabId.equals(1)))
          .getSingle();

      expect(vocabDataV4.itemId, 1);
      expect(vocabDataV4.itemType, DictionaryItemType.vocab.index);
      expect(vocabDataV4.interval, 5);
      expect(vocabDataV4.repetitions, 10);

      final kanjiDataV4 = await (v4Db.select(v4Db.spacedRepetitionDatas)
            ..where((spacedRepetitionDatas) =>
                spacedRepetitionDatas.kanjiId.equals(2)))
          .getSingle();

      expect(kanjiDataV4.itemId, 2);
      expect(kanjiDataV4.itemType, DictionaryItemType.kanji.index);
      expect(kanjiDataV4.interval, 3);
      expect(kanjiDataV4.repetitions, 7);

      await v4Db.close();

      // Continue migration to v5
      final db5 = AppDatabase(schema.newConnection());
      await verifier.migrateAndValidate(db5, 5);
      await db5.close();

      // Verify the data at v5
      final v5Db = v5.DatabaseAtV5(schema.newConnection());
      final allDataV5 = await v5Db.select(v5Db.spacedRepetitionDatas).get();

      expect(allDataV5.length, 2);

      // Verify vocab data
      final vocabDataV5 = allDataV5.firstWhere(
        (data) =>
            data.itemId == 1 &&
            data.itemType == DictionaryItemType.vocab.index &&
            data.frontType == FrontType.japanese.index,
      );
      expect(vocabDataV5.interval, 5);
      expect(vocabDataV5.repetitions, 10);
      expect(vocabDataV5.easeFactor, 2.5);
      expect(vocabDataV5.dueDate, 1234567890);
      expect(vocabDataV5.totalAnswers, 15);
      expect(vocabDataV5.totalWrongAnswers, 3);

      // Verify kanji data
      final kanjiDataV5 = allDataV5.firstWhere(
        (data) =>
            data.itemId == 2 &&
            data.itemType == DictionaryItemType.kanji.index &&
            data.frontType == FrontType.english.index,
      );
      expect(kanjiDataV5.interval, 3);
      expect(kanjiDataV5.repetitions, 7);
      expect(kanjiDataV5.easeFactor, 2.8);
      expect(kanjiDataV5.dueDate, 0);
      expect(kanjiDataV5.totalAnswers, 20);
      expect(kanjiDataV5.totalWrongAnswers, 5);

      await v5Db.close();
    });
  });
}
