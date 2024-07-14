import 'package:drift/drift.dart';
import 'package:sagase_dictionary/src/database.dart';
import 'package:sagase_dictionary/src/datamodels/search_history_items.dart';

part 'search_history_items_dao.g.dart';

@DriftAccessor(tables: [SearchHistoryItems])
class SearchHistoryItemsDao extends DatabaseAccessor<AppDatabase>
    with _$SearchHistoryItemsDaoMixin {
  SearchHistoryItemsDao(super.db);

  Future<void> set(SearchHistoryItem searchHistoryItem) async {
    await db.into(db.searchHistoryItems).insert(
          searchHistoryItem.toCompanion(true),
          mode: InsertMode.insertOrReplace,
        );
  }

  Future<List<SearchHistoryItem>> getAll() async {
    // TODO maybe remove old items?

    return (db.select(db.searchHistoryItems)
          ..orderBy([(item) => OrderingTerm.desc(item.id)])
          ..limit(50))
        .get();
  }

  Future<void> deleteItem(SearchHistoryItem searchHistoryItem) async {
    await (db.delete(db.searchHistoryItems)
          ..where((item) => item.id.equals(searchHistoryItem.id)))
        .go();
  }

  Future<void> deleteAll() async {
    await db.searchHistoryItems.deleteAll();
  }
}
