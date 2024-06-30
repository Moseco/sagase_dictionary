import 'package:drift/drift.dart' as drift;
import 'package:sagase_dictionary/src/database.dart';
import 'package:sagase_dictionary/src/utils/constants.dart';
import 'package:test/test.dart';

void main() {
  group('DictionaryInfosDaoTest', () {
    late AppDatabase database;

    setUp(() {
      database = AppDatabase();
    });

    tearDown(() async {
      await database.close();
    });

    test('Empty database', () async {
      final info = await database.dictionaryInfosDao.get();
      expect(info, null);
    });

    test('Dictionary info exists', () async {
      // Manually insert dictionary version into database
      await database.into(database.dictionaryInfos).insert(
            DictionaryInfosCompanion(
              version: drift.Value(SagaseDictionaryConstants.dictionaryVersion),
            ),
          );

      // Get dictionary version
      final info = await database.dictionaryInfosDao.get();
      expect(info, isNotNull);
      expect(info!.version, SagaseDictionaryConstants.dictionaryVersion);
    });
  });
}
