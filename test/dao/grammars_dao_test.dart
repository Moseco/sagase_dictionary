import 'package:sagase_dictionary/src/database.dart';
import 'package:sagase_dictionary/src/datamodels/spaced_repetition_datas.dart';
import 'package:sagase_dictionary/src/dictionary_builder.dart';
import 'package:sagase_dictionary/src/utils/enums.dart';
import 'package:test/test.dart';

import '../common.dart';

void main() {
  group('GrammarsDaoTest', () {
    late AppDatabase database;

    setUp(() async {
      database = AppDatabase();

      await DictionaryBuilder.createGrammarDictionary(
        database,
        shortGrammarInput,
      );
    });

    tearDown(() async {
      await database.close();
    });

    test('get', () async {
      final grammar = await database.grammarsDao.get(1);
      expect(grammar.id, 1);
      expect(grammar.form, 'です');
      expect(grammar.meaning, 'to be');
      expect(grammar.jlptLevel, 5);
    });

    group('getAll', () {
      test('Empty list', () async {
        final grammarList = await database.grammarsDao.getAll([]);
        expect(grammarList.length, 0);
      });

      test('No front type', () async {
        final grammarList = await database.grammarsDao.getAll([1, 2]);
        expect(grammarList.length, 2);
        expect(grammarList[0].form, 'です');
        expect(grammarList[1].form, 'ほうがいい');
      });

      test('One does not exist', () async {
        final grammarList = await database.grammarsDao.getAll([1, 99]);
        expect(grammarList.length, 1);
        expect(grammarList[0].form, 'です');
      });

      group('With front type', () {
        test('Spaced repetition does not exist', () async {
          final grammarList = await database.grammarsDao.getAll(
            [1, 2],
            frontType: FrontType.japanese,
          );
          expect(grammarList[0].id, 1);
          expect(grammarList[0].spacedRepetitionData, null);
          expect(grammarList[1].id, 2);
          expect(grammarList[1].spacedRepetitionData, null);
        });

        test('Spaced repetition some exist', () async {
          await database.spacedRepetitionDatasDao.set(
            SpacedRepetitionData.initial(
              dictionaryItem: await database.grammarsDao.get(1),
              frontType: FrontType.japanese,
            ),
          );

          final grammarList = await database.grammarsDao.getAll(
            [1, 2],
            frontType: FrontType.japanese,
          );
          expect(grammarList[0].id, 1);
          expect(grammarList[0].spacedRepetitionData!.itemId, 1);
          expect(
            grammarList[0].spacedRepetitionData!.itemType,
            DictionaryItemType.grammar,
          );
          expect(
            grammarList[0].spacedRepetitionData!.frontType,
            FrontType.japanese,
          );
          expect(grammarList[1].id, 2);
          expect(grammarList[1].spacedRepetitionData, null);
        });

        test('Spaced repetition all exist', () async {
          await database.spacedRepetitionDatasDao.set(
            SpacedRepetitionData.initial(
              dictionaryItem: await database.grammarsDao.get(1),
              frontType: FrontType.japanese,
            ),
          );
          await database.spacedRepetitionDatasDao.set(
            SpacedRepetitionData.initial(
              dictionaryItem: await database.grammarsDao.get(2),
              frontType: FrontType.japanese,
            ),
          );

          final grammarList = await database.grammarsDao.getAll(
            [1, 2],
            frontType: FrontType.japanese,
          );
          expect(grammarList[0].id, 1);
          expect(grammarList[0].spacedRepetitionData!.itemId, 1);
          expect(
            grammarList[0].spacedRepetitionData!.itemType,
            DictionaryItemType.grammar,
          );
          expect(
            grammarList[0].spacedRepetitionData!.frontType,
            FrontType.japanese,
          );
          expect(grammarList[1].id, 2);
          expect(grammarList[1].spacedRepetitionData!.itemId, 2);
          expect(
            grammarList[1].spacedRepetitionData!.itemType,
            DictionaryItemType.grammar,
          );
          expect(
            grammarList[1].spacedRepetitionData!.frontType,
            FrontType.japanese,
          );
        });

        test('Spaced repetition both exist for all', () async {
          await database.spacedRepetitionDatasDao.set(
            SpacedRepetitionData.initial(
              dictionaryItem: await database.grammarsDao.get(1),
              frontType: FrontType.japanese,
            ),
          );
          await database.spacedRepetitionDatasDao.set(
            SpacedRepetitionData.initial(
              dictionaryItem: await database.grammarsDao.get(1),
              frontType: FrontType.english,
            ),
          );
          await database.spacedRepetitionDatasDao.set(
            SpacedRepetitionData.initial(
              dictionaryItem: await database.grammarsDao.get(2),
              frontType: FrontType.japanese,
            ),
          );
          await database.spacedRepetitionDatasDao.set(
            SpacedRepetitionData.initial(
              dictionaryItem: await database.grammarsDao.get(2),
              frontType: FrontType.english,
            ),
          );

          final grammarList = await database.grammarsDao.getAll(
            [1, 2],
            frontType: FrontType.english,
          );
          expect(grammarList[0].id, 1);
          expect(grammarList[0].spacedRepetitionData!.itemId, 1);
          expect(
            grammarList[0].spacedRepetitionData!.itemType,
            DictionaryItemType.grammar,
          );
          expect(
            grammarList[0].spacedRepetitionData!.frontType,
            FrontType.english,
          );
          expect(grammarList[1].id, 2);
          expect(grammarList[1].spacedRepetitionData!.itemId, 2);
          expect(
            grammarList[1].spacedRepetitionData!.itemType,
            DictionaryItemType.grammar,
          );
          expect(
            grammarList[1].spacedRepetitionData!.frontType,
            FrontType.english,
          );
        });
      });
    });

    group('validateAll', () {
      test('All valid', () async {
        final grammarList = await database.grammarsDao.validateAll([1, 2]);
        expect(grammarList.length, 2);
        expect(grammarList[0].id, 1);
        expect(grammarList[1].id, 2);
      });

      test('Some invalid', () async {
        final grammarList = await database.grammarsDao.validateAll([1, 99]);
        expect(grammarList.length, 1);
        expect(grammarList[0].id, 1);
      });

      test('Preserves input order', () async {
        final grammarList = await database.grammarsDao.validateAll([2, 1]);
        expect(grammarList.length, 2);
        expect(grammarList[0].id, 2);
        expect(grammarList[1].id, 1);
      });

      test('Empty list', () async {
        final grammarList = await database.grammarsDao.validateAll([]);
        expect(grammarList.length, 0);
      });
    });
  });
}
