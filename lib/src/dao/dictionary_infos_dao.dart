import 'package:drift/drift.dart';
import 'package:sagase_dictionary/src/database.dart';
import 'package:sagase_dictionary/src/datamodels/dictionary_infos.dart';

part 'dictionary_infos_dao.g.dart';

@DriftAccessor(tables: [DictionaryInfos])
class DictionaryInfosDao extends DatabaseAccessor<AppDatabase>
    with _$DictionaryInfosDaoMixin {
  DictionaryInfosDao(super.db);

  Future<DictionaryInfo?> get() async {
    return (db.select(db.dictionaryInfos)..where((info) => info.id.equals(0)))
        .getSingleOrNull();
  }
}
