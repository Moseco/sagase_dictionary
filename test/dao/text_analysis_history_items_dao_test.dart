import 'package:sagase_dictionary/src/database.dart';
import 'package:test/test.dart';

void main() {
  group('textAnalysisHistoryItemsDaoTest', () {
    late AppDatabase database;

    setUp(() {
      database = AppDatabase();
    });

    tearDown(() async {
      await database.close();
    });

    test('create', () async {
      final item = await database.textAnalysisHistoryItemsDao.create(
        'Original text',
      );
      expect(item.analysisText, 'Original text');
    });

    test('set', () async {
      final item = TextAnalysisHistoryItem(id: 0, analysisText: 'text');

      await database.textAnalysisHistoryItemsDao.set(item);
    });

    test('getAll', () async {
      // Create history items
      final item1 = TextAnalysisHistoryItem(id: 0, analysisText: 'text');
      final item2 = TextAnalysisHistoryItem(id: 1, analysisText: 'other');

      await database.textAnalysisHistoryItemsDao.set(item1);
      await database.textAnalysisHistoryItemsDao.set(item2);

      // Get all history items
      final items = await database.textAnalysisHistoryItemsDao.getAll();

      expect(items.length, 2);
      expect(items[0].analysisText, 'other');
      expect(items[1].analysisText, 'text');

      // Update the recent history item
      await database.textAnalysisHistoryItemsDao
          .set(item2.copyWith(analysisText: 'other text'));

      // Get updated history items
      final newItems = await database.textAnalysisHistoryItemsDao.getAll();

      expect(newItems.length, 2);
      expect(newItems[0].analysisText, 'other text');
      expect(newItems[1].analysisText, 'text');
    });

    test('deleteItem', () async {
      // Create history items
      final item1 = TextAnalysisHistoryItem(id: 0, analysisText: 'text');
      final item2 = TextAnalysisHistoryItem(id: 1, analysisText: 'other');

      await database.textAnalysisHistoryItemsDao.set(item1);
      await database.textAnalysisHistoryItemsDao.set(item2);

      // Get all history items
      final items = await database.textAnalysisHistoryItemsDao.getAll();

      expect(items.length, 2);
      expect(items[0].analysisText, 'other');
      expect(items[1].analysisText, 'text');

      // Delete the recent history item
      await database.textAnalysisHistoryItemsDao.deleteItem(item2);

      // Get updated history items
      final newItems = await database.textAnalysisHistoryItemsDao.getAll();

      expect(newItems.length, 1);
      expect(newItems[0].analysisText, 'text');
    });

    test('deleteAll', () async {
      // Create history items
      final item1 = TextAnalysisHistoryItem(id: 0, analysisText: 'text');
      final item2 = TextAnalysisHistoryItem(id: 1, analysisText: 'other');

      await database.textAnalysisHistoryItemsDao.set(item1);
      await database.textAnalysisHistoryItemsDao.set(item2);

      // Get all history items
      final items = await database.textAnalysisHistoryItemsDao.getAll();

      expect(items.length, 2);
      expect(items[0].analysisText, 'other');
      expect(items[1].analysisText, 'text');

      // Delete all history item
      await database.textAnalysisHistoryItemsDao.deleteAll();

      // Get updated history items
      final newItems = await database.textAnalysisHistoryItemsDao.getAll();

      expect(newItems.length, 0);
    });
  });
}
