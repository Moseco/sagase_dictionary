import 'package:sagase_dictionary/src/database.dart';
import 'package:test/test.dart';

void main() {
  group('SearchHistoryItemsDaoTest', () {
    late AppDatabase database;

    setUp(() {
      database = AppDatabase();
    });

    tearDown(() async {
      await database.close();
    });

    test('set', () async {
      final item = SearchHistoryItem(id: 0, searchText: 'text');

      await database.searchHistoryItemsDao.set(item);
    });

    test('getAll', () async {
      // Create search history items
      final item1 = SearchHistoryItem(id: 0, searchText: 'text');
      final item2 = SearchHistoryItem(id: 1, searchText: 'other');

      await database.searchHistoryItemsDao.set(item1);
      await database.searchHistoryItemsDao.set(item2);

      // Get all search history items
      final items = await database.searchHistoryItemsDao.getAll();

      expect(items.length, 2);
      expect(items[0].searchText, 'other');
      expect(items[1].searchText, 'text');

      // Update the recent search history item
      await database.searchHistoryItemsDao
          .set(item2.copyWith(searchText: 'other text'));

      // Get updated search history items
      final newItems = await database.searchHistoryItemsDao.getAll();

      expect(newItems.length, 2);
      expect(newItems[0].searchText, 'other text');
      expect(newItems[1].searchText, 'text');
    });

    test('deleteItem', () async {
      // Create search history items
      final item1 = SearchHistoryItem(id: 0, searchText: 'text');
      final item2 = SearchHistoryItem(id: 1, searchText: 'other');

      await database.searchHistoryItemsDao.set(item1);
      await database.searchHistoryItemsDao.set(item2);

      // Get all search history items
      final items = await database.searchHistoryItemsDao.getAll();

      expect(items.length, 2);
      expect(items[0].searchText, 'other');
      expect(items[1].searchText, 'text');

      // Delete the recent search history item
      await database.searchHistoryItemsDao.deleteItem(item2);

      // Get updated search history items
      final newItems = await database.searchHistoryItemsDao.getAll();

      expect(newItems.length, 1);
      expect(newItems[0].searchText, 'text');
    });

    test('deleteAll', () async {
      // Create search history items
      final item1 = SearchHistoryItem(id: 0, searchText: 'text');
      final item2 = SearchHistoryItem(id: 1, searchText: 'other');

      await database.searchHistoryItemsDao.set(item1);
      await database.searchHistoryItemsDao.set(item2);

      // Get all search history items
      final items = await database.searchHistoryItemsDao.getAll();

      expect(items.length, 2);
      expect(items[0].searchText, 'other');
      expect(items[1].searchText, 'text');

      // Delete all search history item
      await database.searchHistoryItemsDao.deleteAll();

      // Get updated search history items
      final newItems = await database.searchHistoryItemsDao.getAll();

      expect(newItems.length, 0);
    });
  });
}
