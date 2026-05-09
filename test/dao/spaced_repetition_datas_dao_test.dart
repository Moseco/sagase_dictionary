import 'package:sagase_dictionary/src/database.dart';
import 'package:sagase_dictionary/src/datamodels/spaced_repetition_datas.dart';
import 'package:sagase_dictionary/src/dictionary_builder.dart';
import 'package:sagase_dictionary/src/utils/enums.dart';
import 'package:sagase_dictionary/src/utils/string_utils.dart';
import 'package:test/test.dart';

import '../common.dart';

void main() {
  group('SpacedRepetitionDatasDaoTest', () {
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
        shortKradfile,
        shortKanjiStrokeData,
      );

      // Grammar
      await DictionaryBuilder.createGrammarDictionary(
        database,
        shortGrammarInput,
      );
    });

    tearDown(() async {
      await database.close();
    });

    test('set', () async {
      // Set initial
      final vocab = await database.vocabsDao.get(1000160);

      await database.spacedRepetitionDatasDao.set(
        SpacedRepetitionData.initial(
          dictionaryItem: vocab,
          frontType: FrontType.japanese,
        ),
      );

      expect(
        (await database.vocabsDao.get(1000160, frontType: FrontType.japanese))
            .spacedRepetitionData!
            .repetitions,
        0,
      );

      // Overwrite
      await database.spacedRepetitionDatasDao.set(
        SpacedRepetitionData.initial(
          dictionaryItem: vocab,
          frontType: FrontType.japanese,
        ).copyWith(repetitions: 1),
      );

      expect(
        (await database.vocabsDao.get(1000160, frontType: FrontType.japanese))
            .spacedRepetitionData!
            .repetitions,
        1,
      );
    });

    test('set kanji', () async {
      final kanji = (await database.kanjisDao.get('亜'.kanjiCodePoint()))!;

      await database.spacedRepetitionDatasDao.set(
        SpacedRepetitionData.initial(
          dictionaryItem: kanji,
          frontType: FrontType.japanese,
        ),
      );

      final kanjiList = await database.kanjisDao.getAll(
        [kanji.id],
        frontType: FrontType.japanese,
      );
      expect(kanjiList[0].spacedRepetitionData!.itemId, kanji.id);
      expect(
        kanjiList[0].spacedRepetitionData!.itemType,
        DictionaryItemType.kanji,
      );
      expect(kanjiList[0].spacedRepetitionData!.repetitions, 0);

      // Overwrite
      await database.spacedRepetitionDatasDao.set(
        SpacedRepetitionData.initial(
          dictionaryItem: kanji,
          frontType: FrontType.japanese,
        ).copyWith(repetitions: 2),
      );

      final updatedList = await database.kanjisDao.getAll(
        [kanji.id],
        frontType: FrontType.japanese,
      );
      expect(updatedList[0].spacedRepetitionData!.repetitions, 2);
    });

    test('set grammar', () async {
      final grammar = await database.grammarsDao.get(1);

      await database.spacedRepetitionDatasDao.set(
        SpacedRepetitionData.initial(
          dictionaryItem: grammar,
          frontType: FrontType.japanese,
        ),
      );

      final grammarList = await database.grammarsDao.getAll(
        [1],
        frontType: FrontType.japanese,
      );
      expect(grammarList[0].spacedRepetitionData!.itemId, 1);
      expect(
        grammarList[0].spacedRepetitionData!.itemType,
        DictionaryItemType.grammar,
      );
      expect(grammarList[0].spacedRepetitionData!.repetitions, 0);

      // Overwrite
      await database.spacedRepetitionDatasDao.set(
        SpacedRepetitionData.initial(
          dictionaryItem: grammar,
          frontType: FrontType.japanese,
        ).copyWith(repetitions: 3),
      );

      final updatedList = await database.grammarsDao.getAll(
        [1],
        frontType: FrontType.japanese,
      );
      expect(updatedList[0].spacedRepetitionData!.repetitions, 3);
    });

    test('deleteSpacedRepetitionData', () async {
      final vocab = await database.vocabsDao.get(1000160);

      await database.spacedRepetitionDatasDao.set(
        SpacedRepetitionData.initial(
          dictionaryItem: vocab,
          frontType: FrontType.japanese,
        ),
      );

      await database.spacedRepetitionDatasDao
          .deleteSpacedRepetitionData(vocab, FrontType.japanese);

      expect(
        (await database.vocabsDao.get(1000160, frontType: FrontType.japanese))
            .spacedRepetitionData,
        null,
      );
    });

    test('deleteSpacedRepetitionData kanji', () async {
      final kanji = (await database.kanjisDao.get('亜'.kanjiCodePoint()))!;

      await database.spacedRepetitionDatasDao.set(
        SpacedRepetitionData.initial(
          dictionaryItem: kanji,
          frontType: FrontType.japanese,
        ),
      );

      await database.spacedRepetitionDatasDao
          .deleteSpacedRepetitionData(kanji, FrontType.japanese);

      final kanjiList = await database.kanjisDao.getAll(
        [kanji.id],
        frontType: FrontType.japanese,
      );
      expect(kanjiList[0].spacedRepetitionData, null);
    });

    test('deleteSpacedRepetitionData grammar', () async {
      final grammar = await database.grammarsDao.get(1);

      await database.spacedRepetitionDatasDao.set(
        SpacedRepetitionData.initial(
          dictionaryItem: grammar,
          frontType: FrontType.japanese,
        ),
      );

      await database.spacedRepetitionDatasDao
          .deleteSpacedRepetitionData(grammar, FrontType.japanese);

      final grammarList = await database.grammarsDao.getAll(
        [1],
        frontType: FrontType.japanese,
      );
      expect(grammarList[0].spacedRepetitionData, null);
    });

    test('getAll', () async {
      final vocab = await database.vocabsDao.get(1000160);

      await database.spacedRepetitionDatasDao.set(
        SpacedRepetitionData.initial(
          dictionaryItem: vocab,
          frontType: FrontType.japanese,
        ),
      );

      await database.spacedRepetitionDatasDao.set(
        SpacedRepetitionData.initial(
          dictionaryItem: vocab,
          frontType: FrontType.english,
        ),
      );

      final results = await database.spacedRepetitionDatasDao.getAll();
      expect(results.length, 2);
    });

    test('getAll with mixed item types', () async {
      final vocab = await database.vocabsDao.get(1000160);
      final kanji = (await database.kanjisDao.get('亜'.kanjiCodePoint()))!;
      final grammar = await database.grammarsDao.get(1);

      await database.spacedRepetitionDatasDao.set(
        SpacedRepetitionData.initial(
          dictionaryItem: vocab,
          frontType: FrontType.japanese,
        ),
      );
      await database.spacedRepetitionDatasDao.set(
        SpacedRepetitionData.initial(
          dictionaryItem: kanji,
          frontType: FrontType.japanese,
        ),
      );
      await database.spacedRepetitionDatasDao.set(
        SpacedRepetitionData.initial(
          dictionaryItem: grammar,
          frontType: FrontType.japanese,
        ),
      );

      final results = await database.spacedRepetitionDatasDao.getAll();
      expect(results.length, 3);

      final vocabData =
          results.firstWhere((r) => r.itemType == DictionaryItemType.vocab);
      expect(vocabData.itemId, 1000160);

      final kanjiData =
          results.firstWhere((r) => r.itemType == DictionaryItemType.kanji);
      expect(kanjiData.itemId, kanji.id);

      final grammarData =
          results.firstWhere((r) => r.itemType == DictionaryItemType.grammar);
      expect(grammarData.itemId, 1);
    });

    test('deleteAll', () async {
      final vocab = await database.vocabsDao.get(1000160);

      await database.spacedRepetitionDatasDao.set(
        SpacedRepetitionData.initial(
          dictionaryItem: vocab,
          frontType: FrontType.japanese,
        ),
      );

      expect(
        (await database.spacedRepetitionDatasDao.getAll()).length,
        1,
      );

      await database.spacedRepetitionDatasDao.deleteAll();

      expect(
        (await database.spacedRepetitionDatasDao.getAll()).length,
        0,
      );
    });
  });
}
