import 'package:async/async.dart';
import 'package:sagase_dictionary/src/database.dart';
import 'package:sagase_dictionary/src/datamodels/my_dictionary_lists.dart';
import 'package:sagase_dictionary/src/dictionary_builder.dart';
import 'package:sagase_dictionary/src/utils/string_utils.dart';
import 'package:test/test.dart';

import '../common.dart';

void main() {
  group('MyDictionaryListsDaoTest', () {
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

      // Radicals
      await DictionaryBuilder.createRadicalDictionary(
        database,
        shortKanjiRadicalData,
        shortKanjiStrokeData,
      );

      // Kanji
      await DictionaryBuilder.createKanjiDictionary(
        database,
        shortKanjidic2,
        shortKanjiComponentData,
        shortKanjiStrokeData,
      );
    });

    tearDown(() async {
      await database.close();
    });

    test('create', () async {
      final dictionaryList =
          await database.myDictionaryListsDao.create('list1');

      expect(dictionaryList.name, 'list1');
    });

    test('rename', () async {
      final dictionaryList =
          await database.myDictionaryListsDao.create('list1');

      await database.myDictionaryListsDao.rename(dictionaryList, 'new name');
      final renamedDictionaryList =
          await database.myDictionaryListsDao.get(dictionaryList.id);

      expect(renamedDictionaryList.name, 'new name');
      expect(
        renamedDictionaryList.timestamp != dictionaryList.timestamp,
        false,
      );
    });

    test('get', () async {
      final dictionaryList =
          await database.myDictionaryListsDao.create('list1');
      final sameDictionaryList =
          await database.myDictionaryListsDao.get(dictionaryList.id);

      expect(dictionaryList.id == sameDictionaryList.id, true);
      expect(dictionaryList.name == sameDictionaryList.name, true);
      expect(
        dictionaryList.timestamp == sameDictionaryList.timestamp,
        true,
      );
    });

    test('getAll', () async {
      final dictionaryList1 =
          await database.myDictionaryListsDao.create('list1');
      final dictionaryList2 =
          await database.myDictionaryListsDao.create('list2');
      final dictionaryList3 =
          await database.myDictionaryListsDao.create('list3');

      final allDictionaryLists = await database.myDictionaryListsDao.getAll();
      expect(allDictionaryLists.length, 3);
      expect(allDictionaryLists[0].id, dictionaryList1.id);
      expect(allDictionaryLists[1].id, dictionaryList2.id);
      expect(allDictionaryLists[2].id, dictionaryList3.id);
    });

    test('getAllFromList', () async {
      final dictionaryList1 =
          await database.myDictionaryListsDao.create('list1');
      final dictionaryList2 =
          await database.myDictionaryListsDao.create('list2');
      await database.myDictionaryListsDao.create('list3');

      final dictionaryLists =
          await database.myDictionaryListsDao.getAllFromList([
        dictionaryList1.id,
        dictionaryList2.id,
      ]);

      expect(dictionaryLists.length, 2);
      expect(dictionaryLists[0].id, dictionaryList1.id);
      expect(dictionaryLists[1].id, dictionaryList2.id);
    });

    test('exists', () async {
      final doesNotExist = await database.myDictionaryListsDao.exists(0);
      expect(doesNotExist, false);

      final dictionaryList1 =
          await database.myDictionaryListsDao.create('list1');
      final doesExist =
          await database.myDictionaryListsDao.exists(dictionaryList1.id);
      expect(doesExist, true);
    });

    test('deleteMyDictionaryList', () async {
      // Create dictionary lists
      final dictionaryList1 =
          await database.myDictionaryListsDao.create('list1');
      final dictionaryList2 =
          await database.myDictionaryListsDao.create('list2');
      final dictionaryList3 =
          await database.myDictionaryListsDao.create('list3');

      // Create flashcard set using the dictionary list to be deleted
      final flashcardSet = await database.flashcardSetsDao.create('set1');
      flashcardSet.myDictionaryLists.add(dictionaryList2.id);
      await database.flashcardSetsDao.setFlashcardSet(flashcardSet);
      final flashcardSets = await database.flashcardSetsDao.getAll();
      expect(flashcardSets.length, 1);
      expect(flashcardSets[0].myDictionaryLists.length, 1);
      expect(flashcardSets[0].myDictionaryLists[0], dictionaryList2.id);

      // Add dictionary item to dictionary list
      await database.myDictionaryListsDao.addDictionaryItem(
        dictionaryList2,
        await database.vocabsDao.get(1000220),
      );

      // Check for deleted dictionary list
      await database.myDictionaryListsDao
          .deleteMyDictionaryList(dictionaryList2);
      final allDictionaryLists2 = await database.myDictionaryListsDao.getAll();
      expect(allDictionaryLists2.length, 2);
      expect(allDictionaryLists2[0].id, dictionaryList1.id);
      expect(allDictionaryLists2[1].id, dictionaryList3.id);

      // Check there are no my dictionary list items for the deleted list
      final myDictionaryListItems = await database.myDictionaryListsDao
          .getDictionaryListItems(dictionaryList2);
      expect(myDictionaryListItems.vocabIds.length, 0);
      expect(myDictionaryListItems.kanjiIds.length, 0);

      // Check updated flashcard set
      final newFlashcardSets = await database.flashcardSetsDao.getAll();
      expect(newFlashcardSets.length, 1);
      expect(newFlashcardSets[0].myDictionaryLists.length, 0);
    });

    test('Dictionary items', () async {
      final dictionaryList1 =
          await database.myDictionaryListsDao.create('list1');
      final dictionaryList2 =
          await database.myDictionaryListsDao.create('list2');
      final dictionaryList3 =
          await database.myDictionaryListsDao.create('list3');

      // Get empty items
      final emptyList1Items = await database.myDictionaryListsDao
          .getDictionaryListItems(dictionaryList1);
      expect(emptyList1Items.vocabIds.length, 0);
      expect(emptyList1Items.kanjiIds.length, 0);

      // Add items to dictionary list 1
      await database.myDictionaryListsDao.addDictionaryItem(
        dictionaryList1,
        await database.vocabsDao.get(1000220),
      );
      await database.myDictionaryListsDao.addDictionaryItem(
        dictionaryList1,
        await database.vocabsDao.get(1003430),
      );
      await database.myDictionaryListsDao.addDictionaryItem(
        dictionaryList1,
        await database.kanjisDao.get('亞'.kanjiCodePoint()),
      );

      // Add one of the same items to dictionary list 2
      await database.myDictionaryListsDao.addDictionaryItem(
        dictionaryList2,
        await database.vocabsDao.get(1000220),
      );

      // Get newly added to list
      final list1Items = await database.myDictionaryListsDao
          .getDictionaryListItems(dictionaryList1);
      expect(list1Items.vocabIds.length, 2);
      expect(list1Items.vocabIds[0], 1003430);
      expect(list1Items.vocabIds[1], 1000220);
      expect(list1Items.kanjiIds.length, 1);
      expect(list1Items.kanjiIds[0], '亞'.kanjiCodePoint());

      final list2Items = await database.myDictionaryListsDao
          .getDictionaryListItems(dictionaryList2);
      expect(list2Items.vocabIds.length, 1);
      expect(list2Items.vocabIds[0], 1000220);
      expect(list2Items.kanjiIds.length, 0);

      // Confirm list 3 is still empty
      final emptyList3Items = await database.myDictionaryListsDao
          .getDictionaryListItems(dictionaryList3);
      expect(emptyList3Items.vocabIds.length, 0);
      expect(emptyList3Items.kanjiIds.length, 0);

      // Remove vocab from dictionary list 1 and confirm contents
      await database.myDictionaryListsDao.removeDictionaryItem(
        dictionaryList1,
        await database.vocabsDao.get(1003430),
      );
      final newList1Items = await database.myDictionaryListsDao
          .getDictionaryListItems(dictionaryList1);
      expect(newList1Items.vocabIds.length, 1);
      expect(newList1Items.vocabIds[0], 1000220);
      expect(newList1Items.kanjiIds.length, 1);
      expect(newList1Items.kanjiIds[0], '亞'.kanjiCodePoint());

      final newList2Items = await database.myDictionaryListsDao
          .getDictionaryListItems(dictionaryList2);
      expect(newList2Items.vocabIds.length, 1);
      expect(newList2Items.vocabIds[0], 1000220);
      expect(list2Items.kanjiIds.length, 0);
    });

    test('getContainingDictionaryItem', () async {
      final dictionaryList1 =
          await database.myDictionaryListsDao.create('list1');
      await database.myDictionaryListsDao.create('list2');

      await database.myDictionaryListsDao.addDictionaryItem(
        dictionaryList1,
        await database.vocabsDao.get(1000220),
      );

      expect(
        await database.myDictionaryListsDao
            .getContainingDictionaryItem(await database.vocabsDao.get(1000220)),
        [dictionaryList1.id],
      );
      expect(
        await database.myDictionaryListsDao
            .getContainingDictionaryItem(await database.vocabsDao.get(1003430)),
        [],
      );
    });

    test('watchAll', () async {
      final dictionaryList1 =
          await database.myDictionaryListsDao.create('list1');
      await database.myDictionaryListsDao.create('list2');

      final events = StreamQueue(
        database.myDictionaryListsDao.watchAll(),
      );

      var currentEvent = await events.next;
      expect(currentEvent.length, 2);
      expect(currentEvent[0].name, 'list1');
      expect(currentEvent[1].name, 'list2');

      await database.myDictionaryListsDao.rename(dictionaryList1, 'new name');

      currentEvent = await events.next;
      expect(currentEvent.length, 2);
      expect(currentEvent[0].name, 'new name');
      expect(currentEvent[1].name, 'list2');
    });

    test('watchDictionaryListItems', () async {
      final dictionaryList1 =
          await database.myDictionaryListsDao.create('list1');

      final events = StreamQueue(
        database.myDictionaryListsDao
            .watchMyDictionaryListItems(dictionaryList1),
      );

      var currentEvent = await events.next;
      expect(currentEvent.vocabIds.length, 0);
      expect(currentEvent.kanjiIds.length, 0);

      await database.myDictionaryListsDao.addDictionaryItem(
        dictionaryList1,
        await database.vocabsDao.get(1000220),
      );

      currentEvent = await events.next;
      expect(currentEvent.vocabIds.length, 1);
      expect(currentEvent.vocabIds[0], 1000220);
      expect(currentEvent.kanjiIds.length, 0);

      await database.myDictionaryListsDao.addDictionaryItem(
        dictionaryList1,
        await database.vocabsDao.get(1003430),
      );

      currentEvent = await events.next;
      expect(currentEvent.vocabIds.length, 2);
      expect(currentEvent.vocabIds[0], 1003430);
      expect(currentEvent.vocabIds[1], 1000220);
      expect(currentEvent.kanjiIds.length, 0);
    });

    test('watchContainingDictionaryItem', () async {
      final dictionaryList =
          await database.myDictionaryListsDao.create('list1');
      final vocab = await database.vocabsDao.get(1003430);
      final events = StreamQueue(
        database.myDictionaryListsDao.watchContainingDictionaryItem(vocab),
      );

      var currentEvent = await events.next;
      expect(currentEvent.length, 0);

      await database.myDictionaryListsDao
          .addDictionaryItem(dictionaryList, vocab);

      currentEvent = await events.next;
      expect(currentEvent, [dictionaryList.id]);

      await database.myDictionaryListsDao
          .removeDictionaryItem(dictionaryList, vocab);

      currentEvent = await events.next;
      expect(currentEvent.length, 0);
    });

    test('importBackup', () async {
      String export = MyDictionaryList(
        id: 0,
        name: 'list1',
        timestamp: DateTime.now(),
        vocab: [1003430, 1],
        kanji: [1, '亞'.kanjiCodePoint()],
      ).toBackupJson();

      await database.myDictionaryListsDao.importBackup(export);
      final myList = await database.myDictionaryListsDao.get(0);

      expect(myList.name, 'list1');

      final result =
          await database.myDictionaryListsDao.getDictionaryListItems(myList);
      expect(result.vocabIds.length, 1);
      expect(result.vocabIds[0], 1003430);
      expect(result.kanjiIds.length, 1);
      expect(result.kanjiIds[0], '亞'.kanjiCodePoint());
    });

    test('importBackup - conflicting exists', () async {
      final original = await database.myDictionaryListsDao.create('original');
      await database.myDictionaryListsDao.addDictionaryItem(
        original,
        await database.vocabsDao.get(1000220),
      );

      expect(original.name, 'original');
      final originalItems =
          await database.myDictionaryListsDao.getDictionaryListItems(original);
      expect(originalItems.vocabIds.length, 1);
      expect(originalItems.vocabIds[0], 1000220);
      expect(originalItems.kanjiIds.length, 0);

      String export = MyDictionaryList(
        id: original.id,
        name: 'list1',
        timestamp: DateTime.now(),
        vocab: [1003430, 1],
        kanji: [1, '亞'.kanjiCodePoint()],
      ).toBackupJson();

      await database.myDictionaryListsDao.importBackup(export);
      final myList = await database.myDictionaryListsDao.get(original.id);

      expect(myList.name, 'list1');

      final result =
          await database.myDictionaryListsDao.getDictionaryListItems(myList);
      expect(result.vocabIds.length, 1);
      expect(result.vocabIds[0], 1003430);
      expect(result.kanjiIds.length, 1);
      expect(result.kanjiIds[0], '亞'.kanjiCodePoint());
    });

    test('importShare', () async {
      String export = MyDictionaryList(
        id: 0,
        name: 'list1',
        timestamp: DateTime.now(),
        vocab: [1003430, 1],
        kanji: [1, '亞'.kanjiCodePoint()],
      ).toShareJson();

      final myList = await database.myDictionaryListsDao.importShare(export);

      expect(myList!.name, 'list1');

      final result =
          await database.myDictionaryListsDao.getDictionaryListItems(myList);
      expect(result.vocabIds.length, 1);
      expect(result.vocabIds[0], 1003430);
      expect(result.kanjiIds.length, 1);
      expect(result.kanjiIds[0], '亞'.kanjiCodePoint());
    });
  });
}
