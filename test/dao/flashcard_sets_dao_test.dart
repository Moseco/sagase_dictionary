import 'package:sagase_dictionary/src/database.dart';
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
  });
}
