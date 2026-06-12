import 'package:drift/drift.dart';
import 'package:sagase_dictionary/src/database.dart';
import 'package:sagase_dictionary/src/datamodels/dictionary_item.dart';
import 'package:sagase_dictionary/src/datamodels/dictionary_item_ids_result.dart';
import 'package:sagase_dictionary/src/datamodels/my_dictionary_lists.dart';
import 'package:sagase_dictionary/src/utils/enums.dart';
import 'package:sagase_dictionary/src/utils/string_utils.dart';

part 'my_dictionary_lists_dao.g.dart';

@DriftAccessor(tables: [MyDictionaryLists, MyDictionaryListItems])
class MyDictionaryListsDao extends DatabaseAccessor<AppDatabase>
    with _$MyDictionaryListsDaoMixin {
  MyDictionaryListsDao(super.db);

  Future<MyDictionaryList> create(String name) async {
    String sanitizedName = name.sanitizeName();
    if (sanitizedName.isEmpty) sanitizedName = 'New list';

    int id = await db.into(db.myDictionaryLists).insert(
          MyDictionaryListsCompanion(
            name: Value(sanitizedName),
          ),
        );

    return (db.select(db.myDictionaryLists)
          ..where((list) => list.id.equals(id)))
        .getSingle();
  }

  Future<void> rename(MyDictionaryList myDictionaryList, String name) async {
    String sanitizedName = name.sanitizeName();
    if (sanitizedName.isEmpty) sanitizedName = 'New list';

    await (db.update(db.myDictionaryLists)
          ..where((list) => list.id.equals(myDictionaryList.id)))
        .write(
      MyDictionaryListsCompanion(
        name: Value(sanitizedName),
        timestamp: Value(DateTime.now()),
      ),
    );
  }

  Future<MyDictionaryList> get(int id) async {
    return (db.select(db.myDictionaryLists)
          ..where((list) => list.id.equals(id)))
        .getSingle();
  }

  Future<List<MyDictionaryList>> getAll() async {
    return (db.select(db.myDictionaryLists)
          ..orderBy([(list) => OrderingTerm.desc(list.timestamp)]))
        .get();
  }

  Future<List<MyDictionaryList>> getAllFromList(List<int> ids) async {
    List<MyDictionaryList> dictionaryLists = [];
    for (final id in ids) {
      dictionaryLists.add(await get(id));
    }
    return dictionaryLists;
  }

  Future<bool> exists(int id) async {
    return (await (db.select(db.myDictionaryLists)
              ..where((list) => list.id.equals(id)))
            .getSingleOrNull()) !=
        null;
  }

  Future<void> deleteMyDictionaryList(MyDictionaryList dictionaryList) async {
    await db.transaction(() async {
      // Update flashcard sets using the dictionary list
      await db.flashcardSetsDao.removeMyDictionaryList(dictionaryList);

      // Delete the dictionary list
      await (db.delete(db.myDictionaryLists)
            ..where((list) => list.id.equals(dictionaryList.id)))
          .go();

      // Delete my dictionary list items
      await (db.delete(db.myDictionaryListItems)
            ..where((item) => item.listId.equals(dictionaryList.id)))
          .go();
    });
  }

  Future<void> addDictionaryItem(
    MyDictionaryList dictionaryList,
    DictionaryItem dictionaryItem,
  ) async {
    await transaction(() async {
      // Add the dictionary list item
      await db.into(db.myDictionaryListItems).insert(
            MyDictionaryListItemsCompanion(
              listId: Value(dictionaryList.id),
              itemId: Value(dictionaryItem.id),
              itemType: Value(dictionaryItem.type),
            ),
          );

      // Update dictionary list timestamp
      await (db.update(db.myDictionaryLists)
            ..where((list) => list.id.equals(dictionaryList.id)))
          .write(MyDictionaryListsCompanion(timestamp: Value(DateTime.now())));
    });
  }

  Future<void> addDictionaryItems(
    MyDictionaryList dictionaryList,
    List<DictionaryItem> dictionaryItems,
  ) async {
    final items = dictionaryItems.map((item) {
      return MyDictionaryListItemsCompanion(
        listId: Value(dictionaryList.id),
        itemId: Value(item.id),
        itemType: Value(item.type),
      );
    }).toList();

    await transaction(() async {
      for (final item in items) {
        await db
            .into(db.myDictionaryListItems)
            .insert(item, mode: InsertMode.insertOrIgnore);
      }

      await (db.update(db.myDictionaryLists)
            ..where((list) => list.id.equals(dictionaryList.id)))
          .write(MyDictionaryListsCompanion(timestamp: Value(DateTime.now())));
    });
  }

  Future<void> removeDictionaryItem(
    MyDictionaryList dictionaryList,
    DictionaryItem dictionaryItem,
  ) async {
    await transaction(() async {
      // Remove the dictionary list item
      await (db.delete(db.myDictionaryListItems)
            ..where((item) => Expression.and([
                  item.listId.equals(dictionaryList.id),
                  item.itemId.equals(dictionaryItem.id),
                  item.itemType.equals(dictionaryItem.type.index),
                ])))
          .go();

      // Update dictionary list timestamp
      await (db.update(db.myDictionaryLists)
            ..where((list) => list.id.equals(dictionaryList.id)))
          .write(MyDictionaryListsCompanion(timestamp: Value(DateTime.now())));
    });
  }

  Future<DictionaryItemIdsResult> getDictionaryListItems(
    MyDictionaryList dictionaryList,
  ) async {
    final items = await (db.select(db.myDictionaryListItems)
          ..where((item) => item.listId.equals(dictionaryList.id))
          ..orderBy([(item) => OrderingTerm.desc(item.id)]))
        .get();

    List<int> vocabIds = [];
    List<int> kanjiIds = [];
    List<int> grammarIds = [];
    for (final item in items) {
      switch (item.itemType) {
        case DictionaryItemType.vocab:
          vocabIds.add(item.itemId);
          break;
        case DictionaryItemType.kanji:
          kanjiIds.add(item.itemId);
          break;
        case DictionaryItemType.grammar:
          grammarIds.add(item.itemId);
          break;
        case DictionaryItemType.properNoun:
          break;
      }
    }

    return DictionaryItemIdsResult(
      vocabIds: vocabIds,
      kanjiIds: kanjiIds,
      grammarIds: grammarIds,
    );
  }

  Future<List<int>> getContainingDictionaryItem(
    DictionaryItem dictionaryItem,
  ) async {
    return (db.select(db.myDictionaryListItems)
          ..where((item) => Expression.and([
                item.itemId.equals(dictionaryItem.id),
                item.itemType.equals(dictionaryItem.type.index),
              ])))
        .map((row) => row.listId)
        .get();
  }

  Stream<List<MyDictionaryList>> watchAll() {
    return (db.select(db.myDictionaryLists)
          ..orderBy([(list) => OrderingTerm.desc(list.timestamp)]))
        .watch();
  }

  Stream<DictionaryItemIdsResult> watchMyDictionaryListItems(
    MyDictionaryList dictionaryList,
  ) {
    return (db.select(db.myDictionaryListItems)
          ..where((item) => item.listId.equals(dictionaryList.id))
          ..orderBy([(item) => OrderingTerm.desc(item.id)]))
        .watch()
        .map((items) {
      List<int> vocabIds = [];
      List<int> kanjiIds = [];
      List<int> grammarIds = [];
      for (final item in items) {
        switch (item.itemType) {
          case DictionaryItemType.vocab:
            vocabIds.add(item.itemId);
            break;
          case DictionaryItemType.kanji:
            kanjiIds.add(item.itemId);
            break;
          case DictionaryItemType.grammar:
            grammarIds.add(item.itemId);
            break;
          case DictionaryItemType.properNoun:
            break;
        }
      }

      return DictionaryItemIdsResult(
        vocabIds: vocabIds,
        kanjiIds: kanjiIds,
        grammarIds: grammarIds,
      );
    });
  }

  Stream<List<int>> watchContainingDictionaryItem(
    DictionaryItem dictionaryItem,
  ) {
    return (db.select(db.myDictionaryListItems)
          ..where((item) => Expression.and([
                item.itemId.equals(dictionaryItem.id),
                item.itemType.equals(dictionaryItem.type.index),
              ])))
        .map((e) => e.listId)
        .watch();
  }

  Future<void> importBackup(String source) async {
    final dictionaryList = MyDictionaryList.fromBackupJson(source);
    String sanitizedName = dictionaryList.name.sanitizeName();
    if (sanitizedName.isEmpty) sanitizedName = 'My list';

    await db.transaction(() async {
      // Delete existing my dictionary list if it exists
      final conflicting = await (db.select(db.myDictionaryLists)
            ..where((list) => list.id.equals(dictionaryList.id)))
          .getSingleOrNull();
      if (conflicting != null) await deleteMyDictionaryList(conflicting);

      // Add my dictionary list itself
      await db.into(db.myDictionaryLists).insert(
            MyDictionaryListsCompanion(
              id: Value(dictionaryList.id),
              name: Value(sanitizedName),
            ),
          );

      // Add dictionary list items for all valid vocab
      // In reverse order to preserve order for user
      final vocabList = await db.vocabsDao.validateAll(dictionaryList.vocab);
      await addDictionaryItems(dictionaryList, vocabList.reversed.toList());

      // Add dictionary list items for all valid kanji
      // In reverse order to preserve order for user
      final kanjiList = await db.kanjisDao.validateAll(dictionaryList.kanji);
      await addDictionaryItems(dictionaryList, kanjiList.reversed.toList());

      // Add dictionary list items for all valid grammar
      // In reverse order to preserve order for user
      final grammarList =
          await db.grammarsDao.validateAll(dictionaryList.grammar);
      await addDictionaryItems(dictionaryList, grammarList.reversed.toList());

      // Set original timestamp
      await (db.update(db.myDictionaryLists)
            ..where((list) => list.id.equals(dictionaryList.id)))
          .write(
        MyDictionaryListsCompanion(
          timestamp: Value(dictionaryList.timestamp),
        ),
      );
    });
  }

  Future<MyDictionaryList?> importShare(String source) async {
    // Parse source text and sanitize name
    final sourceDictionaryList = MyDictionaryList.fromShareJson(source);

    if (sourceDictionaryList == null) return null;

    String name = sourceDictionaryList.name.sanitizeName();
    if (name.isEmpty) name = 'Imported list';

    return db.transaction(() async {
      // Create the dictionary list itself
      final myList = await create(name);

      // Validate vocab and add dictionary items
      // In reverse order to preserve order for user
      final validatedVocab =
          await db.vocabsDao.validateAll(sourceDictionaryList.vocab);
      await addDictionaryItems(myList, validatedVocab.reversed.toList());

      // Validate kanji and add dictionary items
      // In reverse order to preserve order for user
      final validatedKanji =
          await db.kanjisDao.validateAll(sourceDictionaryList.kanji);
      await addDictionaryItems(myList, validatedKanji.reversed.toList());

      // Validate grammar and add dictionary items
      // In reverse order to preserve order for user
      final validatedGrammar =
          await db.grammarsDao.validateAll(sourceDictionaryList.grammar);
      await addDictionaryItems(myList, validatedGrammar.reversed.toList());

      return myList;
    });
  }

  Future<void> deleteAll() async {
    await db.delete(db.myDictionaryLists).go();
    await db.delete(db.myDictionaryListItems).go();
  }
}
