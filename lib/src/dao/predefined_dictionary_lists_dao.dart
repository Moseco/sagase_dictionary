import 'package:drift/drift.dart';
import 'package:sagase_dictionary/src/database.dart';
import 'package:sagase_dictionary/src/datamodels/predefined_dictionary_lists.dart';

part 'predefined_dictionary_lists_dao.g.dart';

@DriftAccessor(tables: [PredefinedDictionaryLists])
class PredefinedDictionaryListsDao extends DatabaseAccessor<AppDatabase>
    with _$PredefinedDictionaryListsDaoMixin {
  PredefinedDictionaryListsDao(super.db);

  Future<PredefinedDictionaryList> get(int id) async {
    return (db.select(db.predefinedDictionaryLists)
          ..where((list) => list.id.equals(id)))
        .getSingle();
  }

  Future<List<PredefinedDictionaryList>> getAll(List<int> ids) async {
    return (db.select(db.predefinedDictionaryLists)
          ..where((list) => list.id.isIn(ids)))
        .get();
  }

  Future<List<PredefinedDictionaryList>> getAllWithoutItems(
      List<int> ids) async {
    return (db.selectOnly(db.predefinedDictionaryLists)
          ..addColumns([
            db.predefinedDictionaryLists.id,
            db.predefinedDictionaryLists.name,
          ])
          ..where(db.predefinedDictionaryLists.id.isIn(ids)))
        .map((row) => PredefinedDictionaryList(
              id: row.read(db.predefinedDictionaryLists.id)!,
              name: row.read(db.predefinedDictionaryLists.name)!,
              vocab: [],
              kanji: [],
            ))
        .get();
  }

  Future<bool> exists(int id) async {
    return (await (db.select(db.predefinedDictionaryLists)
              ..where((list) => list.id.equals(id)))
            .getSingleOrNull()) !=
        null;
  }
}
