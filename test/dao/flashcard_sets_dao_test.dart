import 'package:drift/native.dart';
import 'package:sagase_dictionary/src/database.dart';
import 'package:sagase_dictionary/src/datamodels/flashcard_sets.dart';
import 'package:test/test.dart';

void main() {
  group('FlashcardSetsDaoTest', () {
    late AppDatabase database;

    setUp(() {
      database = AppDatabase();
    });

    tearDown(() async {
      await database.close();
    });

    test('create', () async {
      final flashcardSet = await database.flashcardSetsDao.create('set');
      expect(flashcardSet.name, 'set');
    });

    test('setFlashcardSet', () async {
      final flashcardSet = await database.flashcardSetsDao.create('set');
      expect(flashcardSet.name, 'set');

      flashcardSet.name = 'new name';
      await database.flashcardSetsDao.setFlashcardSet(flashcardSet);

      final flashcardSets = await database.flashcardSetsDao.getAll();
      expect(flashcardSets.length, 1);
      expect(flashcardSets[0].id, flashcardSet.id);
      expect(flashcardSets[0].name, 'new name');
    });

    test('deleteFlashcardSet', () async {
      final flashcardSet = await database.flashcardSetsDao.create('set');

      var flashcardSets = await database.flashcardSetsDao.getAll();
      expect(flashcardSets.length, 1);

      await database.flashcardSetsDao.deleteFlashcardSet(flashcardSet);

      flashcardSets = await database.flashcardSetsDao.getAll();
      expect(flashcardSets.length, 0);
    });

    test('getAll', () async {
      final flashcardSet1 = await database.flashcardSetsDao.create('set1');
      final flashcardSet2 = await database.flashcardSetsDao.create('set2');

      final flashcardSets = await database.flashcardSetsDao.getAll();
      expect(flashcardSets.length, 2);
      expect(flashcardSets[0].id, flashcardSet1.id);
      expect(flashcardSets[0].name, 'set1');
      expect(flashcardSets[1].id, flashcardSet2.id);
      expect(flashcardSets[1].name, 'set2');
    });

    test('removeMyDictionaryList', () async {
      // Create flashcard sets
      final flashcardSet1 = await database.flashcardSetsDao.create('set1');
      final flashcardSet2 = await database.flashcardSetsDao.create('set2');

      // Create dictionary list and add it to a flashcard set
      final dictionaryList = await database.myDictionaryListsDao.create('name');
      flashcardSet1.myDictionaryLists.add(dictionaryList.id);
      await database.flashcardSetsDao.setFlashcardSet(flashcardSet1);

      // Confirm flashcard set was updated
      var flashcardSets = await database.flashcardSetsDao.getAll();
      expect(flashcardSets.length, 2);
      expect(flashcardSets[0].id, flashcardSet1.id);
      expect(flashcardSets[0].name, 'set1');
      expect(flashcardSets[0].myDictionaryLists, [dictionaryList.id]);
      expect(flashcardSets[1].id, flashcardSet2.id);

      // Delete my dictionary list from all flashcard sets
      await database.flashcardSetsDao.removeMyDictionaryList(dictionaryList);

      // Confirm flashcard set was updated
      flashcardSets = await database.flashcardSetsDao.getAll();
      expect(flashcardSets.length, 2);
      expect(flashcardSets[0].id, flashcardSet1.id);
      expect(flashcardSets[0].name, 'set1');
      expect(flashcardSets[0].myDictionaryLists, []);
      expect(flashcardSets[1].id, flashcardSet2.id);
    });

    test('importBackup', () async {
      // Create a my dictionary list
      final dictionaryList = await database.myDictionaryListsDao.create('list');

      // Create flashcard set and add the my dictionary list to it
      final flashcardSet = await database.flashcardSetsDao.create('set');
      flashcardSet.myDictionaryLists.add(dictionaryList.id);
      await database.flashcardSetsDao.setFlashcardSet(flashcardSet);

      // Change name and add lists that do not exist
      flashcardSet.name = 'new name';
      flashcardSet.predefinedDictionaryLists.add(0);
      flashcardSet.myDictionaryLists.add(10);

      // Import and check
      await database.flashcardSetsDao.importBackup(flashcardSet.toBackupJson());

      final importedFlashcardSet =
          (await database.flashcardSetsDao.getAll())[0];
      expect(importedFlashcardSet.name, 'new name');
      expect(importedFlashcardSet.myDictionaryLists.length, 1);
      expect(importedFlashcardSet.myDictionaryLists[0], dictionaryList.id);
      expect(importedFlashcardSet.predefinedDictionaryLists.length, 0);
    });

    group('createFlashcardSetLog', () {
      test('valid', () async {
        final flashcardSet = await database.flashcardSetsDao.create('set');
        final flashcardSetLog = await database.flashcardSetsDao
            .createFlashcardSetLog(flashcardSet, 20240910);

        expect(flashcardSetLog.flashcardSetId, flashcardSet.id);
        expect(flashcardSetLog.date, 20240910);
        expect(flashcardSetLog.flashcardsCompleted, 0);
        expect(flashcardSetLog.flashcardsGotWrong, 0);
        expect(flashcardSetLog.newFlashcardsCompleted, 0);
      });

      test('try to create for same date', () async {
        final flashcardSet = await database.flashcardSetsDao.create('set');
        await database.flashcardSetsDao
            .createFlashcardSetLog(flashcardSet, 20240910);

        expect(
          database.flashcardSetsDao
              .createFlashcardSetLog(flashcardSet, 20240910),
          throwsA(isA<SqliteException>()),
        );
      });
    });

    test('setFlashcardSetLog', () async {
      final flashcardSet = await database.flashcardSetsDao.create('set');
      final flashcardSetLog = await database.flashcardSetsDao
          .createFlashcardSetLog(flashcardSet, 20240910);

      flashcardSetLog.flashcardsCompleted++;
      await database.flashcardSetsDao.setFlashcardSetLog(
        flashcardSetLog,
      );

      final updatedFlashcardSetStatsLog = await database.flashcardSetsDao
          .getFlashcardSetLog(flashcardSet, 20240910);

      expect(updatedFlashcardSetStatsLog!.flashcardsCompleted, 1);
    });

    test('getFlashcardSetLog', () async {
      final flashcardSet = await database.flashcardSetsDao.create('set');

      var flashcardSetLog = await database.flashcardSetsDao
          .getFlashcardSetLog(flashcardSet, 20240910);
      expect(flashcardSetLog, null);

      await database.flashcardSetsDao
          .createFlashcardSetLog(flashcardSet, 20240910);

      flashcardSetLog = await database.flashcardSetsDao
          .getFlashcardSetLog(flashcardSet, 20240910);
      expect(flashcardSetLog!.date, 20240910);
    });

    test('getFlashcardSetLogRange', () async {
      final flashcardSet = await database.flashcardSetsDao.create('set');
      await database.flashcardSetsDao
          .createFlashcardSetLog(flashcardSet, 20240910);
      await database.flashcardSetsDao
          .createFlashcardSetLog(flashcardSet, 20240909);
      await database.flashcardSetsDao
          .createFlashcardSetLog(flashcardSet, 20240908);
      await database.flashcardSetsDao
          .createFlashcardSetLog(flashcardSet, 20240907);

      final flashcardSetLogs = await database.flashcardSetsDao
          .getFlashcardSetLogRange(flashcardSet, 20240908, 20240909);
      expect(flashcardSetLogs.length, 2);
      expect(flashcardSetLogs[0].date, 20240909);
      expect(flashcardSetLogs[1].date, 20240908);
    });

    test('deleteFlashcardSetLogs', () async {
      final flashcardSet1 = await database.flashcardSetsDao.create('set1');
      final flashcardSet2 = await database.flashcardSetsDao.create('set2');
      await database.flashcardSetsDao
          .createFlashcardSetLog(flashcardSet1, 20240910);
      await database.flashcardSetsDao
          .createFlashcardSetLog(flashcardSet2, 20240909);
      await database.flashcardSetsDao
          .createFlashcardSetLog(flashcardSet1, 20240908);
      await database.flashcardSetsDao
          .createFlashcardSetLog(flashcardSet2, 20240907);

      await database.flashcardSetsDao.deleteFlashcardSetLogs(flashcardSet1);

      final flashcardSetLogs1 = await database.flashcardSetsDao
          .getFlashcardSetLogRange(flashcardSet1, 20240907, 20240910);
      expect(flashcardSetLogs1.length, 0);

      final flashcardSetLogs2 = await database.flashcardSetsDao
          .getFlashcardSetLogRange(flashcardSet2, 20240907, 20240910);
      expect(flashcardSetLogs2.length, 2);
      expect(flashcardSetLogs2[0].date, 20240909);
      expect(flashcardSetLogs2[1].date, 20240907);
    });

    test('toBackupJson/fromBackupJson', () {
      final flashcardSetLog = FlashcardSetLog(
        id: 1,
        flashcardSetId: 2,
        date: 3,
        flashcardsCompleted: 4,
        flashcardsGotWrong: 5,
        newFlashcardsCompleted: 6,
      );

      final importedFlashcardSetStatsLog =
          FlashcardSetLog.fromBackupJson(flashcardSetLog.toBackupJson());

      expect(importedFlashcardSetStatsLog.id, 1);
      expect(importedFlashcardSetStatsLog.flashcardSetId, 2);
      expect(importedFlashcardSetStatsLog.date, 3);
      expect(importedFlashcardSetStatsLog.flashcardsCompleted, 4);
      expect(importedFlashcardSetStatsLog.flashcardsGotWrong, 5);
      expect(importedFlashcardSetStatsLog.newFlashcardsCompleted, 6);
    });

    test('deleteAll', () async {
      await database.flashcardSetsDao.create('set');

      var flashcardSets = await database.flashcardSetsDao.getAll();
      expect(flashcardSets.length, 1);

      await database.flashcardSetsDao.deleteAll();

      flashcardSets = await database.flashcardSetsDao.getAll();
      expect(flashcardSets.length, 0);
    });
  });
}
