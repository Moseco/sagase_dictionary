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

      // Grammar
      await DictionaryBuilder.createGrammarDictionary(
        database,
        shortGrammarInput,
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
              grammar: drift.Value([]),
            ),
            PredefinedDictionaryListsCompanion(
              id: drift.Value(1),
              name: drift.Value('Kanji'),
              vocab: drift.Value([]),
              kanji: drift.Value(['亜'.kanjiCodePoint(), '悪'.kanjiCodePoint()]),
              grammar: drift.Value([]),
            ),
            PredefinedDictionaryListsCompanion(
              id: drift.Value(2),
              name: drift.Value('Grammar'),
              vocab: drift.Value([]),
              kanji: drift.Value([]),
              grammar: drift.Value([1, 2]),
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
      expect(dictionaryList.grammar, []);

      final dictionaryList2 =
          await database.predefinedDictionaryListsDao.get(1);
      expect(dictionaryList2.name, 'Kanji');
      expect(dictionaryList2.vocab, []);
      expect(
        dictionaryList2.kanji,
        ['亜'.kanjiCodePoint(), '悪'.kanjiCodePoint()],
      );
      expect(dictionaryList2.grammar, []);

      final dictionaryList3 =
          await database.predefinedDictionaryListsDao.get(2);
      expect(dictionaryList3.name, 'Grammar');
      expect(dictionaryList3.vocab, []);
      expect(dictionaryList3.kanji, []);
      expect(dictionaryList3.grammar, [1, 2]);
    });

    test('getAll', () async {
      final dictionaryLists =
          await database.predefinedDictionaryListsDao.getAll([0, 1, 2]);

      expect(dictionaryLists.length, 3);

      expect(dictionaryLists[0].name, 'Vocab');
      expect(dictionaryLists[0].vocab, [1000160, 1000220]);
      expect(dictionaryLists[0].kanji, []);
      expect(dictionaryLists[0].grammar, []);

      expect(dictionaryLists[1].name, 'Kanji');
      expect(dictionaryLists[1].vocab, []);
      expect(
        dictionaryLists[1].kanji,
        ['亜'.kanjiCodePoint(), '悪'.kanjiCodePoint()],
      );
      expect(dictionaryLists[1].grammar, []);

      expect(dictionaryLists[2].name, 'Grammar');
      expect(dictionaryLists[2].vocab, []);
      expect(dictionaryLists[2].kanji, []);
      expect(dictionaryLists[2].grammar, [1, 2]);
    });

    test('getAllWithoutItems', () async {
      final dictionaryLists = await database.predefinedDictionaryListsDao
          .getAllWithoutItems([0, 1, 2]);

      expect(dictionaryLists.length, 3);
      expect(dictionaryLists[0].id, 0);
      expect(dictionaryLists[0].name, 'Vocab');
      expect(dictionaryLists[1].id, 1);
      expect(dictionaryLists[1].name, 'Kanji');
      expect(dictionaryLists[2].id, 2);
      expect(dictionaryLists[2].name, 'Grammar');
    });

    test('exists', () async {
      final doesNotExist =
          await database.predefinedDictionaryListsDao.exists(3);
      expect(doesNotExist, false);

      final doesExist = await database.predefinedDictionaryListsDao.exists(0);
      expect(doesExist, true);
    });
  });
}
