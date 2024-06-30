import 'package:sagase_dictionary/src/database.dart';
import 'package:sagase_dictionary/src/datamodels/spaced_repetition_datas.dart';
import 'package:sagase_dictionary/src/dictionary_builder.dart';
import 'package:sagase_dictionary/src/utils/enums.dart';
import 'package:sagase_dictionary/src/utils/string_utils.dart';
import 'package:test/test.dart';

import '../common.dart';

void main() {
  group('KanjisDaoTest', () {
    late AppDatabase database;

    setUp(() async {
      // Create basic database with data
      database = AppDatabase();

      // Radicals
      await DictionaryBuilder.createRadicalDictionary(
        database,
        shortKanjiRadicalData,
        shortKanjiStrokeData,
      );

      // Kanji
      await DictionaryBuilder.createKanjiDictionary(
        database,
        shortKanjidic2,
        shortKanjiComponentData,
        shortKanjiStrokeData,
      );
    });

    tearDown(() async {
      await database.close();
    });

    test('get', () async {
      final kanji = await database.kanjisDao.get('亜'.kanjiCodePoint());
      expect(kanji.kanji, '亜');
    });

    test('get - with spaced repetition - does not exist', () async {
      final kanji = await database.kanjisDao.get(
        '亜'.kanjiCodePoint(),
        frontType: FrontType.japanese,
      );
      expect(kanji.kanji, '亜');
      expect(kanji.spacedRepetitionData, null);
    });

    test('get - with spaced repetition - does exists', () async {
      await database.spacedRepetitionDatasDao.set(
        SpacedRepetitionData.initial(
          dictionaryItem: await database.kanjisDao.get('亜'.kanjiCodePoint()),
          frontType: FrontType.japanese,
        ),
      );

      final kanji = await database.kanjisDao.get(
        '亜'.kanjiCodePoint(),
        frontType: FrontType.japanese,
      );
      expect(kanji.kanji, '亜');
      expect(kanji.spacedRepetitionData!.frontType, FrontType.japanese);
    });

    test('get - with spaced repetition - both exist', () async {
      await database.spacedRepetitionDatasDao.set(
        SpacedRepetitionData.initial(
          dictionaryItem: await database.kanjisDao.get('亜'.kanjiCodePoint()),
          frontType: FrontType.japanese,
        ),
      );
      await database.spacedRepetitionDatasDao.set(
        SpacedRepetitionData.initial(
          dictionaryItem: await database.kanjisDao.get('亜'.kanjiCodePoint()),
          frontType: FrontType.english,
        ),
      );

      final kanji = await database.kanjisDao.get(
        '亜'.kanjiCodePoint(),
        frontType: FrontType.english,
      );
      expect(kanji.kanji, '亜');
      expect(kanji.spacedRepetitionData!.frontType, FrontType.english);
    });

    test('getByString', () async {
      final kanji = await database.kanjisDao.getKanji('悪');
      expect(kanji.kanji, '悪');
    });

    test('getAll', () async {
      final kanjiList = await database.kanjisDao.getAll(
        ['亜'.kanjiCodePoint(), '悪'.kanjiCodePoint()],
      );
      expect(kanjiList.length, 2);
      expect(kanjiList[0].kanji, '亜');
      expect(kanjiList[1].kanji, '悪');
    });

    test('validateAllKanji', () async {
      final kanjiList = await database.kanjisDao.validateAllKanji(
        ['亜'.kanjiCodePoint(), 'a'.kanjiCodePoint()],
      );
      expect(kanjiList.length, 1);
      expect(kanjiList[0].kanji, '亜');
    });

    test('getKanjiWithRadical', () async {
      final kanjiList = await database.kanjisDao.getKanjiWithRadical('二');
      expect(kanjiList.length, 3);
      expect(kanjiList[0].kanji, '二');
      expect(kanjiList[1].kanji, '亜');
      expect(kanjiList[2].kanji, '亞');
    });

    test('search - single kanji', () async {
      final results = await database.kanjisDao.search('悪');
      expect(results.length, 1);
      expect(results[0].kanji, '悪');
    });

    test('search - meaning single word', () async {
      final results = await database.kanjisDao.search('asia');
      expect(results.length, 1);
      expect(results[0].kanji, '亜');
    });

    test('search - meaning partial word', () async {
      final results = await database.kanjisDao.search('asi');
      expect(results.length, 1);
      expect(results[0].kanji, '亜');
    });

    test('search - meaning multiple words', () async {
      final results = await database.kanjisDao.search('two radical');
      expect(results.length, 1);
      expect(results[0].kanji, '二');
    });

    test('search - meaning single and partial word', () async {
      final results = await database.kanjisDao.search('two radi');
      expect(results.length, 1);
      expect(results[0].kanji, '二');
    });

    test('search - meaning with separators', () async {
      // Following is saved as '(kokuji)'
      var results = await database.kanjisDao.search('kokuji');
      expect(results.length, 1);
      expect(results[0].kanji, '働');

      // Following is saved as '-ous'
      results = await database.kanjisDao.search('ous');
      expect(results.length, 1);
      expect(results[0].kanji, '亜');
    });

    test('search - meaning with capitalization', () async {
      // Following is saved as 'Asia'
      var results = await database.kanjisDao.search('asia');
      expect(results.length, 1);
      expect(results[0].kanji, '亜');
    });

    test('search - reading complete', () async {
      // On reading
      var results = await database.kanjisDao.search('しん');
      expect(results.length, 1);
      expect(results[0].kanji, '心');

      // On reading katakana
      results = await database.kanjisDao.search('シン');
      expect(results.length, 1);
      expect(results[0].kanji, '心');

      // Kun reading
      results = await database.kanjisDao.search('こころ');
      expect(results.length, 1);
      expect(results[0].kanji, '心');

      // Kun reading with '.' separator. Following originally 'もっ.て'
      results = await database.kanjisDao.search('もって');
      expect(results.length, 1);
      expect(results[0].kanji, '以');

      // Nanori
      results = await database.kanjisDao.search('おと');
      expect(results.length, 1);
      expect(results[0].kanji, '二');
    });

    test('search - reading partial', () async {
      // On reading
      var results = await database.kanjisDao.search('し');
      expect(results.length, 1);
      expect(results[0].kanji, '心');

      // On reading katakana
      results = await database.kanjisDao.search('シ');
      expect(results.length, 1);
      expect(results[0].kanji, '心');

      // Kun reading
      results = await database.kanjisDao.search('ここ');
      expect(results.length, 1);
      expect(results[0].kanji, '心');

      // Kun reading with '.' separator. Following originally 'もっ.て'
      results = await database.kanjisDao.search('もっ');
      expect(results.length, 1);
      expect(results[0].kanji, '以');

      // Nanori
      results = await database.kanjisDao.search('お');
      expect(results.length, 3);
      expect(results[0].kanji, '悪');
      expect(results[1].kanji, '二');
      expect(results[2].kanji, '行');
    });

    test('search - reading romaji complete', () async {
      // On reading
      var results = await database.kanjisDao.search('shin');
      expect(results.length, 1);
      expect(results[0].kanji, '心');

      // Kun reading
      results = await database.kanjisDao.search('kokoro');
      expect(results.length, 1);
      expect(results[0].kanji, '心');

      // Nanori
      results = await database.kanjisDao.search('oto');
      expect(results.length, 1);
      expect(results[0].kanji, '二');
    });

    test('search - reading romaji partial', () async {
      // On reading
      var results = await database.kanjisDao.search('sh');
      expect(results.length, 1);
      expect(results[0].kanji, '心');

      // Kun reading
      results = await database.kanjisDao.search('koko');
      expect(results.length, 1);
      expect(results[0].kanji, '心');

      // Nanori
      results = await database.kanjisDao.search('ot');
      expect(results.length, 1);
      expect(results[0].kanji, '二');
    });

    test('search - reading romaji complete simplified', () async {
      var results = await database.kanjisDao.search('mote');
      expect(results.length, 1);
      expect(results[0].kanji, '以');
    });
  });
}
