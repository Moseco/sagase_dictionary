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
      await database.flashcardSetsDao
          .createFlashcardSetReport(flashcardSet, 20240929);

      var flashcardSets = await database.flashcardSetsDao.getAll();
      expect(flashcardSets.length, 1);
      var flashcardSetReports =
          await database.flashcardSetsDao.getAllFlashcardSetReports();
      expect(flashcardSetReports.length, 1);

      await database.flashcardSetsDao.deleteFlashcardSet(flashcardSet);

      flashcardSets = await database.flashcardSetsDao.getAll();
      expect(flashcardSets.length, 0);
      flashcardSetReports =
          await database.flashcardSetsDao.getAllFlashcardSetReports();
      expect(flashcardSetReports.length, 0);
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

    group('createFlashcardSetReport', () {
      test('valid', () async {
        final flashcardSet = await database.flashcardSetsDao.create('set');
        final flashcardSetReport = await database.flashcardSetsDao
            .createFlashcardSetReport(flashcardSet, 20240910);

        expect(flashcardSetReport.flashcardSetId, flashcardSet.id);
        expect(flashcardSetReport.date, 20240910);
        expect(flashcardSetReport.dueFlashcardsCompleted, 0);
        expect(flashcardSetReport.dueFlashcardsGotWrong, 0);
        expect(flashcardSetReport.newFlashcardsCompleted, 0);
      });

      test('try to create for same date', () async {
        final flashcardSet = await database.flashcardSetsDao.create('set');
        await database.flashcardSetsDao
            .createFlashcardSetReport(flashcardSet, 20240910);

        expect(
          database.flashcardSetsDao
              .createFlashcardSetReport(flashcardSet, 20240910),
          throwsA(isA<SqliteException>()),
        );
      });
    });

    test('setFlashcardSetReport', () async {
      final flashcardSet = await database.flashcardSetsDao.create('set');
      final flashcardSetReport = await database.flashcardSetsDao
          .createFlashcardSetReport(flashcardSet, 20240910);

      flashcardSetReport.dueFlashcardsCompleted++;
      await database.flashcardSetsDao.setFlashcardSetReport(
        flashcardSetReport,
      );

      final updatedFlashcardSetReport = await database.flashcardSetsDao
          .getFlashcardSetReport(flashcardSet, 20240910);

      expect(updatedFlashcardSetReport!.dueFlashcardsCompleted, 1);
    });

    test('getFlashcardSetReport', () async {
      final flashcardSet = await database.flashcardSetsDao.create('set');

      var flashcardSetReport = await database.flashcardSetsDao
          .getFlashcardSetReport(flashcardSet, 20240910);
      expect(flashcardSetReport, null);

      await database.flashcardSetsDao
          .createFlashcardSetReport(flashcardSet, 20240910);

      flashcardSetReport = await database.flashcardSetsDao
          .getFlashcardSetReport(flashcardSet, 20240910);
      expect(flashcardSetReport!.date, 20240910);
    });

    test('getRecentFlashcardSetReport', () async {
      final flashcardSet1 = await database.flashcardSetsDao.create('set1');
      final flashcardSet2 = await database.flashcardSetsDao.create('set2');

      await database.flashcardSetsDao
          .createFlashcardSetReport(flashcardSet2, 20240907);

      var flashcardSetReport = await database.flashcardSetsDao
          .getRecentFlashcardSetReport(flashcardSet1);
      expect(flashcardSetReport, null);

      await database.flashcardSetsDao
          .createFlashcardSetReport(flashcardSet2, 20240911);
      await database.flashcardSetsDao
          .createFlashcardSetReport(flashcardSet1, 20240910);
      await database.flashcardSetsDao
          .createFlashcardSetReport(flashcardSet1, 20240909);
      await database.flashcardSetsDao
          .createFlashcardSetReport(flashcardSet2, 20240908);

      flashcardSetReport = await database.flashcardSetsDao
          .getRecentFlashcardSetReport(flashcardSet1);
      expect(flashcardSetReport!.date, 20240910);
    });

    test('getAllFlashcardSetReports', () async {
      final flashcardSet1 = await database.flashcardSetsDao.create('set1');
      final flashcardSet2 = await database.flashcardSetsDao.create('set2');
      await database.flashcardSetsDao
          .createFlashcardSetReport(flashcardSet1, 20240910);
      await database.flashcardSetsDao
          .createFlashcardSetReport(flashcardSet2, 20240909);
      await database.flashcardSetsDao
          .createFlashcardSetReport(flashcardSet1, 20240908);
      await database.flashcardSetsDao
          .createFlashcardSetReport(flashcardSet2, 20240907);

      final flashcardSetReports =
          await database.flashcardSetsDao.getAllFlashcardSetReports();
      expect(flashcardSetReports.length, 4);
    });

    test('getFlashcardSetReportRange', () async {
      final flashcardSet = await database.flashcardSetsDao.create('set');
      await database.flashcardSetsDao
          .createFlashcardSetReport(flashcardSet, 20240910);
      await database.flashcardSetsDao
          .createFlashcardSetReport(flashcardSet, 20240909);
      await database.flashcardSetsDao
          .createFlashcardSetReport(flashcardSet, 20240908);
      await database.flashcardSetsDao
          .createFlashcardSetReport(flashcardSet, 20240907);

      final flashcardSetReports = await database.flashcardSetsDao
          .getFlashcardSetReportRange(flashcardSet, 20240908, 20240909);
      expect(flashcardSetReports.length, 2);
      expect(flashcardSetReports[0].date, 20240908);
      expect(flashcardSetReports[1].date, 20240909);
    });

    test('deleteFlashcardSetReports', () async {
      final flashcardSet1 = await database.flashcardSetsDao.create('set1');
      final flashcardSet2 = await database.flashcardSetsDao.create('set2');
      await database.flashcardSetsDao
          .createFlashcardSetReport(flashcardSet1, 20240910);
      await database.flashcardSetsDao
          .createFlashcardSetReport(flashcardSet2, 20240909);
      await database.flashcardSetsDao
          .createFlashcardSetReport(flashcardSet1, 20240908);
      await database.flashcardSetsDao
          .createFlashcardSetReport(flashcardSet2, 20240907);

      await database.flashcardSetsDao.deleteFlashcardSetReports(flashcardSet1);

      final flashcardSetReports1 = await database.flashcardSetsDao
          .getFlashcardSetReportRange(flashcardSet1, 20240907, 20240910);
      expect(flashcardSetReports1.length, 0);

      final flashcardSetReports2 = await database.flashcardSetsDao
          .getFlashcardSetReportRange(flashcardSet2, 20240907, 20240910);
      expect(flashcardSetReports2.length, 2);
      expect(flashcardSetReports2[0].date, 20240907);
      expect(flashcardSetReports2[1].date, 20240909);
    });

    test('toBackupJson/fromBackupJson', () {
      final flashcardSetReport = FlashcardSetReport(
        id: 1,
        flashcardSetId: 2,
        date: 3,
        dueFlashcardsCompleted: 4,
        dueFlashcardsGotWrong: 5,
        newFlashcardsCompleted: 6,
      );

      final importedFlashcardSetReport =
          FlashcardSetReport.fromBackupJson(flashcardSetReport.toBackupJson());

      expect(importedFlashcardSetReport.id, 1);
      expect(importedFlashcardSetReport.flashcardSetId, 2);
      expect(importedFlashcardSetReport.date, 3);
      expect(importedFlashcardSetReport.dueFlashcardsCompleted, 4);
      expect(importedFlashcardSetReport.dueFlashcardsGotWrong, 5);
      expect(importedFlashcardSetReport.newFlashcardsCompleted, 6);
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
