import 'package:drift/drift.dart' as drift;
import 'package:drift_dev/api/migrations_native.dart';
import 'package:sagase_dictionary/src/database.dart';
import 'package:sagase_dictionary/src/datamodels/my_dictionary_lists.dart';
import 'package:sagase_dictionary/src/utils/enums.dart';
import 'package:sagase_dictionary/src/utils/string_utils.dart';
import 'package:test/test.dart';
import '../drift/my_database/generated/schema.dart';
import '../drift/my_database/generated/schema_v3.dart' as v3;
import '../drift/my_database/generated/schema_v4.dart' as v4;
import '../drift/my_database/generated/schema_v5.dart' as v5;

void main() {
  group('MyDictionaryListTest', () {
    test('toBackupJson and fromBackupJson', () async {
      final now = DateTime.now();
      final myList = MyDictionaryList(
        id: 1,
        name: 'list1',
        timestamp: now,
        vocab: [0, 1],
        kanji: ['a'.kanjiCodePoint(), 'b'.kanjiCodePoint()],
        grammar: [10, 20],
      );

      // Backup and import
      final newMyList = MyDictionaryList.fromBackupJson(myList.toBackupJson());

      expect(newMyList.id, 1);
      expect(newMyList.name, 'list1');
      expect(newMyList.timestamp.millisecondsSinceEpoch,
          now.millisecondsSinceEpoch);
      expect(newMyList.vocab.length, 2);
      expect(newMyList.vocab.contains(0), true);
      expect(newMyList.vocab.contains(1), true);
      expect(newMyList.kanji.length, 2);
      expect(newMyList.kanji.contains('a'.kanjiCodePoint()), true);
      expect(newMyList.kanji.contains('b'.kanjiCodePoint()), true);
      expect(newMyList.grammar, [10, 20]);
    });

    test('fromBackupJson without grammar field', () {
      final json =
          '{"id":1,"name":"list1","timestamp":0,"vocab":[0,1],"kanji":[97,98]}';

      final myList = MyDictionaryList.fromBackupJson(json);

      expect(myList.vocab, [0, 1]);
      expect(myList.kanji, [97, 98]);
      expect(myList.grammar, []);
    });

    test('toShareJson and fromShareJson', () {
      final myList = MyDictionaryList(
        id: 1,
        name: 'list1',
        timestamp: DateTime.now(),
        vocab: [0, 1],
        kanji: ['a'.kanjiCodePoint(), 'b'.kanjiCodePoint()],
        grammar: [10, 20],
      );

      // Export and import
      final newMyList = MyDictionaryList.fromShareJson(myList.toShareJson());

      expect(newMyList!.name, 'list1');
      expect(newMyList.vocab, [0, 1]);
      expect(newMyList.kanji, ['a'.kanjiCodePoint(), 'b'.kanjiCodePoint()]);
      expect(newMyList.grammar, [10, 20]);
    });

    test('fromShareJson without grammar field', () {
      String json =
          '{"type":"my_dictionary_list","name":"list1","vocab":[0,1],"kanji":[97,98]}';

      final myList = MyDictionaryList.fromShareJson(json);

      expect(myList!.vocab, [0, 1]);
      expect(myList.kanji, [97, 98]);
      expect(myList.grammar, []);
    });

    test('fromShareJson with invalid input', () {
      String json = '{"name":"list1","vocab":[0,1],"kanji":[97,98]}';

      final myList = MyDictionaryList.fromShareJson(json);

      expect(myList, null);
    });

    test('migrates table from v3 to v5', () async {
      final verifier = SchemaVerifier(GeneratedHelper());

      final schema = await verifier.schemaAt(3);

      // Add some data to the table being migrated
      final oldDb = v3.DatabaseAtV3(schema.newConnection());
      await oldDb
          .into(oldDb.myDictionaryListItems)
          .insert(v3.MyDictionaryListItemsCompanion(
            listId: drift.Value(1),
            vocabId: drift.Value(1),
            kanjiId: drift.Value(0),
          ));
      await oldDb
          .into(oldDb.myDictionaryListItems)
          .insert(v3.MyDictionaryListItemsCompanion(
            listId: drift.Value(1),
            vocabId: drift.Value(0),
            kanjiId: drift.Value(2),
          ));
      await oldDb.close();

      // Run migration to v4
      final db = AppDatabase(schema.newConnection());
      await verifier.migrateAndValidate(db, 4);
      await db.close();

      // Verify the data at v4
      final v4Db = v4.DatabaseAtV4(schema.newConnection());
      final vocabDataV4 = await (v4Db.select(v4Db.myDictionaryListItems)
            ..where((myDictionaryListItems) =>
                myDictionaryListItems.vocabId.equals(1)))
          .getSingle();

      expect(vocabDataV4.listId, 1);
      expect(vocabDataV4.itemId, 1);
      expect(vocabDataV4.itemType, DictionaryItemType.vocab.index);

      final kanjiDataV4 = await (v4Db.select(v4Db.myDictionaryListItems)
            ..where((myDictionaryListItems) =>
                myDictionaryListItems.kanjiId.equals(2)))
          .getSingle();

      expect(kanjiDataV4.listId, 1);
      expect(kanjiDataV4.itemId, 2);
      expect(kanjiDataV4.itemType, DictionaryItemType.kanji.index);

      await v4Db.close();

      // Continue migration to v5
      final db5 = AppDatabase(schema.newConnection());
      await verifier.migrateAndValidate(db5, 5);
      await db5.close();

      // Verify the data at v5
      final v5Db = v5.DatabaseAtV5(schema.newConnection());
      final allDataV5 = await v5Db.select(v5Db.myDictionaryListItems).get();

      expect(allDataV5.length, 2);

      // Verify vocab data
      final vocabDataV5 = allDataV5.firstWhere(
        (data) =>
            data.itemId == 1 && data.itemType == DictionaryItemType.vocab.index,
      );
      expect(vocabDataV5.listId, 1);

      // Verify kanji data
      final kanjiDataV5 = allDataV5.firstWhere(
        (data) =>
            data.itemId == 2 && data.itemType == DictionaryItemType.kanji.index,
      );
      expect(kanjiDataV5.listId, 1);

      await v5Db.close();
    });
  });
}
