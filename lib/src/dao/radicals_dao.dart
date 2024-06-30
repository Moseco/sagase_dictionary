import 'package:drift/drift.dart';
import 'package:sagase_dictionary/src/database.dart';
import 'package:sagase_dictionary/src/datamodels/radicals.dart';

part 'radicals_dao.g.dart';

@DriftAccessor(tables: [Radicals])
class RadicalsDao extends DatabaseAccessor<AppDatabase>
    with _$RadicalsDaoMixin {
  RadicalsDao(super.db);

  Future<Radical> get(String radical) async {
    return (db.select(db.radicals)..where((r) => r.radical.equals(radical)))
        .getSingle();
  }

  Future<List<Radical>> getAll() async {
    return (db.select(db.radicals)
          ..orderBy([(radical) => OrderingTerm.asc(radical.id)]))
        .get();
  }

  Future<List<Radical>> getClassic() async {
    return (db.select(db.radicals)
          ..where((radical) => radical.kangxiId.isNotNull())
          ..orderBy([(radical) => OrderingTerm.asc(radical.kangxiId)]))
        .get();
  }

  Future<List<Radical>> getImportant() async {
    return (db.select(db.radicals)
          ..where((radical) => radical.importance.isNotNull())
          ..orderBy([
            (radical) => OrderingTerm.asc(radical.importance),
            (radical) => OrderingTerm.asc(radical.kangxiId),
          ]))
        .get();
  }
}
