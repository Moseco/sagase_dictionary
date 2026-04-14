import 'package:drift/drift.dart';
import 'package:sagase_dictionary/src/database.dart';
import 'package:sagase_dictionary/src/datamodels/grammars.dart';
import 'package:sagase_dictionary/src/utils/enums.dart';

part 'grammars_dao.g.dart';

@DriftAccessor(tables: [Grammars])
class GrammarsDao extends DatabaseAccessor<AppDatabase>
    with _$GrammarsDaoMixin {
  GrammarsDao(super.db);

  Future<Grammar> get(int id) async {
    return (db.select(db.grammars)..where((grammars) => grammars.id.equals(id)))
        .getSingle();
  }

  Future<List<Grammar>> getAll(List<int> idList, {FrontType? frontType}) async {
    if (idList.isEmpty) return [];

    final baseQuery = db.select(db.grammars)
      ..where((grammars) => grammars.id.isIn(idList));

    if (frontType == null) return baseQuery.get();

    final query = baseQuery.join([
      leftOuterJoin(
          db.spacedRepetitionDatas,
          Expression.and([
            db.spacedRepetitionDatas.itemId.equalsExp(db.grammars.id),
            db.spacedRepetitionDatas.itemType
                .equals(DictionaryItemType.grammar.index),
            db.spacedRepetitionDatas.frontType.equals(frontType.index),
          ]))
    ]).map(
      (row) => row.readTable(db.grammars)
        ..spacedRepetitionData = row.readTableOrNull(db.spacedRepetitionDatas),
    );

    return query.get();
  }

  Future<List<Grammar>> validateAll(List<int> idList) async {
    if (idList.isEmpty) return [];

    final grammarMap = {
      for (var grammar in (await (db.select(db.grammars)
            ..where((row) => row.id.isIn(idList)))
          .get()))
        grammar.id: grammar
    };

    // Put the results in the same order as the input
    List<Grammar> grammarList = [];
    for (final id in idList) {
      final grammar = grammarMap[id];
      if (grammar != null) grammarList.add(grammar);
    }
    return grammarList;
  }
}
