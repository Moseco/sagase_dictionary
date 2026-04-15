import 'package:drift/drift.dart' as drift;
import 'package:drift_dev/api/migrations_native.dart';
import 'package:sagase_dictionary/src/database.dart';
import 'package:test/test.dart';
import '../drift/my_database/generated/schema.dart';
import '../drift/my_database/generated/schema_v4.dart' as v4;
import '../drift/my_database/generated/schema_v5.dart' as v5;

void main() {
  test('migrates table from v4 to v5', () async {
    final verifier = SchemaVerifier(GeneratedHelper());

    final schema = await verifier.schemaAt(4);

    // Add some data to the table being migrated
    final oldDb = v4.DatabaseAtV4(schema.newConnection());
    await oldDb
        .into(oldDb.predefinedDictionaryLists)
        .insert(v4.PredefinedDictionaryListsCompanion(
          id: drift.Value(0),
          name: drift.Value('Vocab list'),
          vocab: drift.Value('[1000160,1000220]'),
          kanji: drift.Value('[]'),
        ));
    await oldDb
        .into(oldDb.predefinedDictionaryLists)
        .insert(v4.PredefinedDictionaryListsCompanion(
          id: drift.Value(1),
          name: drift.Value('Kanji list'),
          vocab: drift.Value('[]'),
          kanji: drift.Value('[100,200]'),
        ));
    await oldDb.close();

    // Run migration to v5
    final db = AppDatabase(schema.newConnection());
    await verifier.migrateAndValidate(db, 5);
    await db.close();

    // Verify the data at v5
    final v5Db = v5.DatabaseAtV5(schema.newConnection());
    final allData = await v5Db.select(v5Db.predefinedDictionaryLists).get();

    expect(allData.length, 2);

    final vocabList = allData.firstWhere((data) => data.id == 0);
    expect(vocabList.name, 'Vocab list');
    expect(vocabList.vocab, '[1000160,1000220]');
    expect(vocabList.kanji, '[]');
    expect(vocabList.grammar, '[]');

    final kanjiList = allData.firstWhere((data) => data.id == 1);
    expect(kanjiList.name, 'Kanji list');
    expect(kanjiList.vocab, '[]');
    expect(kanjiList.kanji, '[100,200]');
    expect(kanjiList.grammar, '[]');

    await v5Db.close();
  });
}
