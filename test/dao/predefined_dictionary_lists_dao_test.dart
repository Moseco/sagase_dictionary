import 'package:drift/drift.dart' as drift;
import 'package:sagase_dictionary/src/database.dart';
import 'package:sagase_dictionary/src/dictionary_builder.dart';
import 'package:sagase_dictionary/src/utils/string_utils.dart';
import 'package:test/test.dart';

import '../common.dart';

void main() {
  group('PredefinedDictionaryListsDaoTest', () {
    late AppDatabase database;

    setUp(() async {
      // Create basic database with data
      database = AppDatabase();

      // Vocab
      await DictionaryBuilder.createVocabDictionary(
        database,
        shortJMdict,
        shortPitchAccentData,
        shortFrequencyListData,
      );

      // Radicals
      await DictionaryBuilder.createRadicalDictionary(
        database,
        shortRadicalData,
        shortKanjiStrokeData,
      );

      // Kanji
      await DictionaryBuilder.createKanjiDictionary(
        database,
        shortKanjidic2,
        shortKanjiComponentData,
        shortKanjiStrokeData,
      );

      // Predefined dictionary list
      await database.batch((batch) async {
        batch.insertAll(
          database.predefinedDictionaryLists,
          [
            PredefinedDictionaryListsCompanion(
              id: drift.Value(0),
              name: drift.Value('Vocab'),
              vocab: drift.Value([1000160, 1000220]),
              kanji: drift.Value([]),
            ),
            PredefinedDictionaryListsCompanion(
              id: drift.Value(1),
              name: drift.Value('Kanji'),
              vocab: drift.Value([]),
              kanji: drift.Value(['亜'.kanjiCodePoint(), '悪'.kanjiCodePoint()]),
            ),
          ],
        );
      });
    });

    tearDown(() async {
      await database.close();
    });

    test('get', () async {
      final dictionaryList = await database.predefinedDictionaryListsDao.get(0);
      expect(dictionaryList.name, 'Vocab');
      expect(dictionaryList.vocab, [1000160, 1000220]);
      expect(dictionaryList.kanji, []);

      final dictionaryList2 =
          await database.predefinedDictionaryListsDao.get(1);
      expect(dictionaryList2.name, 'Kanji');
      expect(dictionaryList2.vocab, []);
      expect(
        dictionaryList2.kanji,
        ['亜'.kanjiCodePoint(), '悪'.kanjiCodePoint()],
      );
    });

    test('getAll', () async {
      final dictionaryLists =
          await database.predefinedDictionaryListsDao.getAll([0, 1]);

      expect(dictionaryLists.length, 2);

      expect(dictionaryLists[0].name, 'Vocab');
      expect(dictionaryLists[0].vocab, [1000160, 1000220]);
      expect(dictionaryLists[0].kanji, []);

      expect(dictionaryLists[1].name, 'Kanji');
      expect(dictionaryLists[1].vocab, []);
      expect(
        dictionaryLists[1].kanji,
        ['亜'.kanjiCodePoint(), '悪'.kanjiCodePoint()],
      );
    });

    test('getAllWithoutItems', () async {
      final dictionaryLists = await database.predefinedDictionaryListsDao
          .getAllWithoutItems([0, 1]);

      expect(dictionaryLists.length, 2);
      expect(dictionaryLists[0].id, 0);
      expect(dictionaryLists[0].name, 'Vocab');
      expect(dictionaryLists[1].id, 1);
      expect(dictionaryLists[1].name, 'Kanji');
    });

    test('exists', () async {
      final doesNotExist =
          await database.predefinedDictionaryListsDao.exists(2);
      expect(doesNotExist, false);

      final doesExist = await database.predefinedDictionaryListsDao.exists(0);
      expect(doesExist, true);
    });
  });
}
