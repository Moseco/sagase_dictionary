import 'package:drift/drift.dart';
import 'package:sagase_dictionary/src/database.dart';
import 'package:sagase_dictionary/src/datamodels/grammar_lessons.dart';
import 'package:sagase_dictionary/src/utils/enums.dart';

part 'grammar_lessons_dao.g.dart';

@DriftAccessor(tables: [GrammarLessons])
class GrammarLessonsDao extends DatabaseAccessor<AppDatabase>
    with _$GrammarLessonsDaoMixin {
  GrammarLessonsDao(super.db);

  Future<GrammarLesson> get(int id) async {
    return (db.select(db.grammarLessons)
          ..where((grammarLessons) => grammarLessons.id.equals(id)))
        .getSingle();
  }

  Future<List<GrammarLesson>> getAll(List<int> idList,
      {FrontType? frontType}) async {
    if (idList.isEmpty) return [];

    final baseQuery = db.select(db.grammarLessons)
      ..where((grammarLessons) => grammarLessons.id.isIn(idList));

    if (frontType == null) return baseQuery.get();

    final query = baseQuery.join([
      leftOuterJoin(
          db.spacedRepetitionDatas,
          Expression.and([
            db.spacedRepetitionDatas.itemId.equalsExp(db.grammarLessons.id),
            db.spacedRepetitionDatas.itemType
                .equals(DictionaryItemType.grammar.index),
            db.spacedRepetitionDatas.frontType.equals(frontType.index),
          ]))
    ]).map(
      (row) => row.readTable(db.grammarLessons)
        ..spacedRepetitionData = row.readTableOrNull(db.spacedRepetitionDatas),
    );

    return query.get();
  }
}
