import 'package:sagase_dictionary/src/database.dart';
import 'package:sagase_dictionary/src/dictionary_builder.dart';
import 'package:test/test.dart';

import '../common.dart';

void main() {
  group('RadicalsDaoTest', () {
    late AppDatabase database;

    setUp(() async {
      // Create basic database with data
      database = AppDatabase();

      // Radicals
      await DictionaryBuilder.createRadicalDictionary(
        database,
        shortRadicalData,
        shortKanjiStrokeData,
      );
    });

    tearDown(() async {
      await database.close();
    });

    test('get', () async {
      final radical = await database.radicalsDao.get('心');
      expect(radical.radical, '心');
    });

    test('getAll', () async {
      final radicals = await database.radicalsDao.getAll();
      expect(radicals[0].radical, '一');
      expect(radicals[1].radical, '乙');
      expect(radicals[2].radical, '乚');
      expect(radicals[3].radical, '二');
      expect(radicals[4].radical, '人');
      expect(radicals[5].radical, '亻');
    });

    test('getClassic', () async {
      final radicals = await database.radicalsDao.getClassic();
      expect(radicals[0].radical, '一');
      expect(radicals[1].radical, '乙');
      expect(radicals[2].radical, '二');
      expect(radicals[3].radical, '人');
      expect(radicals[4].radical, '口');
    });

    test('getImportant', () async {
      final radicals = await database.radicalsDao.getImportant();
      expect(radicals[0].radical, '人');
      expect(radicals[1].radical, '口');
    });
  });
}
