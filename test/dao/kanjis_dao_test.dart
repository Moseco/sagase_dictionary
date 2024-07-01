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

    group('get', () {
      test('No front type', () async {
        final kanji = await database.kanjisDao.get('亜'.kanjiCodePoint());
        expect(kanji.kanji, '亜');
      });

      group('With front type', () {
        test('Spaced repetition does not exist', () async {
          final kanji = await database.kanjisDao.get(
            '亜'.kanjiCodePoint(),
            frontType: FrontType.japanese,
          );
          expect(kanji.kanji, '亜');
          expect(kanji.spacedRepetitionData, null);
        });

        test('Spaced repetition does exist', () async {
          await database.spacedRepetitionDatasDao.set(
            SpacedRepetitionData.initial(
              dictionaryItem:
                  await database.kanjisDao.get('亜'.kanjiCodePoint()),
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

        test('Spaced repetition both exist', () async {
          await database.spacedRepetitionDatasDao.set(
            SpacedRepetitionData.initial(
              dictionaryItem:
                  await database.kanjisDao.get('亜'.kanjiCodePoint()),
              frontType: FrontType.japanese,
            ),
          );
          await database.spacedRepetitionDatasDao.set(
            SpacedRepetitionData.initial(
              dictionaryItem:
                  await database.kanjisDao.get('亜'.kanjiCodePoint()),
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
      });
    });

    test('getKanji', () async {
      final kanji = await database.kanjisDao.getKanji('悪');
      expect(kanji.kanji, '悪');
    });

    group('getAll', () {
      test('No front type', () async {
        final kanjiList = await database.kanjisDao.getAll(
          ['亜'.kanjiCodePoint(), '悪'.kanjiCodePoint()],
        );
        expect(kanjiList.length, 2);
        expect(kanjiList[0].kanji, '亜');
        expect(kanjiList[0].onReadings!.length, 1);
        expect(kanjiList[0].onReadings![0].reading, 'ア');
        expect(kanjiList[0].kunReadings!.length, 1);
        expect(kanjiList[0].kunReadings![0].reading, 'つ.ぐ');
        expect(kanjiList[0].nanori!.length, 3);
        expect(kanjiList[0].nanori![0].reading, 'や');
        expect(kanjiList[1].kanji, '悪');
        expect(kanjiList[1].onReadings!.length, 2);
        expect(kanjiList[1].onReadings![0].reading, 'アク');
        expect(kanjiList[1].kunReadings!.length, 9);
        expect(kanjiList[1].kunReadings![0].reading, 'わる.い');
        expect(kanjiList[1].nanori, null);
      });

      group('With front type', () {
        test('Spaced repetition does not exist', () async {
          final kanjiList = await database.kanjisDao.getAll(
            ['亜'.kanjiCodePoint(), '悪'.kanjiCodePoint()],
            frontType: FrontType.japanese,
          );
          expect(kanjiList[0].kanji, '亜');
          expect(kanjiList[0].spacedRepetitionData, null);
          expect(kanjiList[1].kanji, '悪');
          expect(kanjiList[1].spacedRepetitionData, null);
        });

        test('Spaced repetition some exist', () async {
          await database.spacedRepetitionDatasDao.set(
            SpacedRepetitionData.initial(
              dictionaryItem:
                  await database.kanjisDao.get('亜'.kanjiCodePoint()),
              frontType: FrontType.japanese,
            ),
          );

          final kanjiList = await database.kanjisDao.getAll(
            ['亜'.kanjiCodePoint(), '悪'.kanjiCodePoint()],
            frontType: FrontType.japanese,
          );
          expect(kanjiList[0].kanji, '亜');
          expect(
            kanjiList[0].spacedRepetitionData!.kanjiId,
            '亜'.kanjiCodePoint(),
          );
          expect(
            kanjiList[0].spacedRepetitionData!.frontType,
            FrontType.japanese,
          );
          expect(kanjiList[1].kanji, '悪');
          expect(kanjiList[1].spacedRepetitionData, null);
        });

        test('Spaced repetition all exist', () async {
          await database.spacedRepetitionDatasDao.set(
            SpacedRepetitionData.initial(
              dictionaryItem:
                  await database.kanjisDao.get('亜'.kanjiCodePoint()),
              frontType: FrontType.japanese,
            ),
          );
          await database.spacedRepetitionDatasDao.set(
            SpacedRepetitionData.initial(
              dictionaryItem:
                  await database.kanjisDao.get('悪'.kanjiCodePoint()),
              frontType: FrontType.japanese,
            ),
          );

          final kanjiList = await database.kanjisDao.getAll(
            ['亜'.kanjiCodePoint(), '悪'.kanjiCodePoint()],
            frontType: FrontType.japanese,
          );
          expect(kanjiList[0].kanji, '亜');
          expect(
            kanjiList[0].spacedRepetitionData!.kanjiId,
            '亜'.kanjiCodePoint(),
          );
          expect(
            kanjiList[0].spacedRepetitionData!.frontType,
            FrontType.japanese,
          );
          expect(kanjiList[1].kanji, '悪');
          expect(
            kanjiList[1].spacedRepetitionData!.kanjiId,
            '悪'.kanjiCodePoint(),
          );
          expect(
            kanjiList[1].spacedRepetitionData!.frontType,
            FrontType.japanese,
          );
        });

        test('Spaced repetition both exist for all', () async {
          await database.spacedRepetitionDatasDao.set(
            SpacedRepetitionData.initial(
              dictionaryItem:
                  await database.kanjisDao.get('亜'.kanjiCodePoint()),
              frontType: FrontType.japanese,
            ),
          );
          await database.spacedRepetitionDatasDao.set(
            SpacedRepetitionData.initial(
              dictionaryItem:
                  await database.kanjisDao.get('亜'.kanjiCodePoint()),
              frontType: FrontType.english,
            ),
          );
          await database.spacedRepetitionDatasDao.set(
            SpacedRepetitionData.initial(
              dictionaryItem:
                  await database.kanjisDao.get('悪'.kanjiCodePoint()),
              frontType: FrontType.japanese,
            ),
          );
          await database.spacedRepetitionDatasDao.set(
            SpacedRepetitionData.initial(
              dictionaryItem:
                  await database.kanjisDao.get('悪'.kanjiCodePoint()),
              frontType: FrontType.english,
            ),
          );

          final kanji = await database.kanjisDao.getAll(
            ['亜'.kanjiCodePoint(), '悪'.kanjiCodePoint()],
            frontType: FrontType.english,
          );
          expect(kanji[0].kanji, '亜');
          expect(kanji[0].spacedRepetitionData!.kanjiId, '亜'.kanjiCodePoint());
          expect(kanji[0].spacedRepetitionData!.frontType, FrontType.english);
          expect(kanji[1].kanji, '悪');
          expect(kanji[1].spacedRepetitionData!.kanjiId, '悪'.kanjiCodePoint());
          expect(kanji[1].spacedRepetitionData!.frontType, FrontType.english);
        });
      });
    });

    test('validateAll', () async {
      final kanjiList = await database.kanjisDao.validateAll(
        ['亜'.kanjiCodePoint(), 'a'.kanjiCodePoint()],
      );
      expect(kanjiList.length, 1);
      expect(kanjiList[0].kanji, '亜');
    });

    test('getWithRadical', () async {
      final kanjiList = await database.kanjisDao.getWithRadical('二');
      expect(kanjiList.length, 3);
      expect(kanjiList[0].kanji, '二');
      expect(kanjiList[1].kanji, '亜');
      expect(kanjiList[2].kanji, '亞');
    });

    group('search', () {
      test('Single kanji', () async {
        final results = await database.kanjisDao.search('悪');
        expect(results.length, 1);
        expect(results[0].kanji, '悪');
      });

      test('Meaning single word', () async {
        final results = await database.kanjisDao.search('asia');
        expect(results.length, 1);
        expect(results[0].kanji, '亜');
      });

      test('Meaning partial word', () async {
        final results = await database.kanjisDao.search('asi');
        expect(results.length, 1);
        expect(results[0].kanji, '亜');
      });

      test('Meaning multiple words', () async {
        final results = await database.kanjisDao.search('two radical');
        expect(results.length, 1);
        expect(results[0].kanji, '二');
      });

      test('Meaning single and partial word', () async {
        final results = await database.kanjisDao.search('two radi');
        expect(results.length, 1);
        expect(results[0].kanji, '二');
      });

      test('Meaning with separators', () async {
        // Following is saved as '(kokuji)'
        var results = await database.kanjisDao.search('kokuji');
        expect(results.length, 1);
        expect(results[0].kanji, '働');

        // Following is saved as '-ous'
        results = await database.kanjisDao.search('ous');
        expect(results.length, 1);
        expect(results[0].kanji, '亜');
      });

      test('Meaning with capitalization', () async {
        // Following is saved as 'Asia'
        var results = await database.kanjisDao.search('asia');
        expect(results.length, 1);
        expect(results[0].kanji, '亜');
      });

      test('Reading complete', () async {
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

      test('Reading partial', () async {
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
        expect(results[0].onReadings!.length, 2);
        expect(results[0].onReadings![0].reading, 'アク');
        expect(results[0].kunReadings!.length, 9);
        expect(results[0].kunReadings![0].reading, 'わる.い');
        expect(results[0].nanori, null);
        expect(results[1].kanji, '二');
        expect(results[1].onReadings!.length, 2);
        expect(results[1].onReadings![0].reading, 'ニ');
        expect(results[1].kunReadings!.length, 3);
        expect(results[1].kunReadings![0].reading, 'ふた');
        expect(results[1].nanori!.length, 9);
        expect(results[1].nanori![0].reading, 'おと');
        expect(results[2].kanji, '行');
        expect(results[2].onReadings!.length, 3);
        expect(results[2].onReadings![0].reading, 'コウ');
        expect(results[2].kunReadings!.length, 8);
        expect(results[2].kunReadings![0].reading, 'い.く');
        expect(results[2].nanori!.length, 6);
        expect(results[2].nanori![0].reading, 'いく');
      });

      test('Reading romaji complete', () async {
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

      test('Reading romaji partial', () async {
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

      test('Reading romaji complete simplified', () async {
        var results = await database.kanjisDao.search('mote');
        expect(results.length, 1);
        expect(results[0].kanji, '以');
      });
    });
  });
}
