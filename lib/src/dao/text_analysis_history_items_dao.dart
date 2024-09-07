import 'package:drift/drift.dart';
import 'package:sagase_dictionary/src/database.dart';
import 'package:sagase_dictionary/src/datamodels/text_analysis_history_items.dart';

part 'text_analysis_history_items_dao.g.dart';

@DriftAccessor(tables: [TextAnalysisHistoryItems])
class TextAnalysisHistoryItemsDao extends DatabaseAccessor<AppDatabase>
    with _$TextAnalysisHistoryItemsDaoMixin {
  TextAnalysisHistoryItemsDao(super.db);

  Future<TextAnalysisHistoryItem> create(String analysisText) async {
    int id = await db.into(db.textAnalysisHistoryItems).insert(
        TextAnalysisHistoryItemsCompanion(analysisText: Value(analysisText)));

    return (db.select(db.textAnalysisHistoryItems)
          ..where((item) => item.id.equals(id)))
        .getSingle();
  }

  Future<void> set(TextAnalysisHistoryItem textAnalysisHistoryItem) async {
    await db.into(db.textAnalysisHistoryItems).insert(
          textAnalysisHistoryItem.toCompanion(true),
          mode: InsertMode.insertOrReplace,
        );
  }

  Future<List<TextAnalysisHistoryItem>> getAll() async {
    // TODO maybe remove old items?

    return (db.select(db.textAnalysisHistoryItems)
          ..orderBy([(item) => OrderingTerm.desc(item.id)])
          ..limit(50))
        .get();
  }

  Future<void> deleteItem(
    TextAnalysisHistoryItem textAnalysisHistoryItem,
  ) async {
    await (db.delete(db.textAnalysisHistoryItems)
          ..where((item) => item.id.equals(textAnalysisHistoryItem.id)))
        .go();
  }

  Future<void> deleteAll() async {
    await db.textAnalysisHistoryItems.deleteAll();
  }
}
