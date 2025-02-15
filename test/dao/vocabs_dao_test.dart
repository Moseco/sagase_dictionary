import 'package:sagase_dictionary/src/database.dart';
import 'package:sagase_dictionary/src/datamodels/spaced_repetition_datas.dart';
import 'package:sagase_dictionary/src/dictionary_builder.dart';
import 'package:sagase_dictionary/src/utils/enums.dart';
import 'package:test/test.dart';

import '../common.dart';

void main() {
  group('DictionaryListsDaoTest', () {
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
    });

    tearDown(() async {
      await database.close();
    });

    group('get', () {
      test('No front type', () async {
        await database.vocabsDao.setNote(1000220, 'Hello');
        final vocab = await database.vocabsDao.get(1000220);
        expect(vocab.id, 1000220);
        expect(vocab.writings!.length, 1);
        expect(vocab.writings![0].writing, '明白');
        expect(vocab.readings.length, 1);
        expect(vocab.readings[0].reading, 'めいはく');
        expect(vocab.definitions.length, 1);
        expect(
          vocab.definitions[0].definition,
          'obvious; clear; plain; evident; apparent; explicit; overt',
        );
        expect(vocab.note, 'Hello');
      });

      group('With front type', () {
        test('Spaced repetition does not exist', () async {
          final vocab = await database.vocabsDao.get(
            1000220,
            frontType: FrontType.japanese,
          );
          expect(vocab.id, 1000220);
          expect(vocab.spacedRepetitionData, null);
        });

        test('Spaced repetition does exist', () async {
          await database.spacedRepetitionDatasDao.set(
            SpacedRepetitionData.initial(
              dictionaryItem: await database.vocabsDao.get(1000220),
              frontType: FrontType.japanese,
            ),
          );

          final vocab = await database.vocabsDao.get(
            1000220,
            frontType: FrontType.japanese,
          );
          expect(vocab.id, 1000220);
          expect(vocab.spacedRepetitionData!.frontType, FrontType.japanese);
        });

        test('Spaced repetition both exist', () async {
          await database.spacedRepetitionDatasDao.set(
            SpacedRepetitionData.initial(
              dictionaryItem: await database.vocabsDao.get(1000220),
              frontType: FrontType.japanese,
            ),
          );
          await database.spacedRepetitionDatasDao.set(
            SpacedRepetitionData.initial(
              dictionaryItem: await database.vocabsDao.get(1000220),
              frontType: FrontType.english,
            ),
          );

          final vocab = await database.vocabsDao.get(
            1000220,
            frontType: FrontType.english,
          );
          expect(vocab.id, 1000220);
          expect(vocab.spacedRepetitionData!.frontType, FrontType.english);
        });
      });
    });

    group('getAll', () {
      test('No front type', () async {
        await database.vocabsDao.setNote(1000220, 'Hello');
        final vocabList = await database.vocabsDao.getAll([1000220, 1000160]);
        expect(vocabList.length, 2);
        expect(vocabList[0].id, 1000220);
        expect(vocabList[0].writings!.length, 1);
        expect(vocabList[0].writings![0].writing, '明白');
        expect(vocabList[0].readings.length, 1);
        expect(vocabList[0].readings[0].reading, 'めいはく');
        expect(vocabList[0].definitions.length, 1);
        expect(
          vocabList[0].definitions[0].definition,
          'obvious; clear; plain; evident; apparent; explicit; overt',
        );
        expect(vocabList[0].note, 'Hello');
        expect(vocabList[1].id, 1000160);
        expect(vocabList[1].writings!.length, 1);
        expect(vocabList[1].writings![0].writing, 'Ｔシャツ');
        expect(vocabList[1].readings.length, 1);
        expect(vocabList[1].readings[0].reading, 'ティーシャツ');
        expect(vocabList[1].definitions.length, 1);
        expect(vocabList[1].definitions[0].definition, 'T-shirt; tee shirt');
        expect(vocabList[1].note, null);
      });

      group('With front type', () {
        test('Spaced repetition does not exist', () async {
          final vocabList = await database.vocabsDao.getAll(
            [1000220, 1000160],
            frontType: FrontType.japanese,
          );
          expect(vocabList[0].id, 1000220);
          expect(vocabList[0].spacedRepetitionData, null);
          expect(vocabList[1].id, 1000160);
          expect(vocabList[1].spacedRepetitionData, null);
        });

        test('Spaced repetition some exist', () async {
          await database.spacedRepetitionDatasDao.set(
            SpacedRepetitionData.initial(
              dictionaryItem: await database.vocabsDao.get(1000220),
              frontType: FrontType.japanese,
            ),
          );

          final vocabList = await database.vocabsDao.getAll(
            [1000220, 1000160],
            frontType: FrontType.japanese,
          );
          expect(vocabList[0].id, 1000220);
          expect(vocabList[0].spacedRepetitionData!.vocabId, 1000220);
          expect(
            vocabList[0].spacedRepetitionData!.frontType,
            FrontType.japanese,
          );
          expect(vocabList[1].id, 1000160);
          expect(vocabList[1].spacedRepetitionData, null);
        });

        test('Spaced repetition all exist', () async {
          await database.spacedRepetitionDatasDao.set(
            SpacedRepetitionData.initial(
              dictionaryItem: await database.vocabsDao.get(1000220),
              frontType: FrontType.japanese,
            ),
          );
          await database.spacedRepetitionDatasDao.set(
            SpacedRepetitionData.initial(
              dictionaryItem: await database.vocabsDao.get(1000160),
              frontType: FrontType.japanese,
            ),
          );

          final vocabList = await database.vocabsDao.getAll(
            [1000220, 1000160],
            frontType: FrontType.japanese,
          );
          expect(vocabList[0].id, 1000220);
          expect(vocabList[0].spacedRepetitionData!.vocabId, 1000220);
          expect(
            vocabList[0].spacedRepetitionData!.frontType,
            FrontType.japanese,
          );
          expect(vocabList[1].id, 1000160);
          expect(vocabList[1].spacedRepetitionData!.vocabId, 1000160);
          expect(
            vocabList[1].spacedRepetitionData!.frontType,
            FrontType.japanese,
          );
        });

        test('Spaced repetition both exist for all', () async {
          await database.spacedRepetitionDatasDao.set(
            SpacedRepetitionData.initial(
              dictionaryItem: await database.vocabsDao.get(1000220),
              frontType: FrontType.japanese,
            ),
          );
          await database.spacedRepetitionDatasDao.set(
            SpacedRepetitionData.initial(
              dictionaryItem: await database.vocabsDao.get(1000220),
              frontType: FrontType.english,
            ),
          );
          await database.spacedRepetitionDatasDao.set(
            SpacedRepetitionData.initial(
              dictionaryItem: await database.vocabsDao.get(1000160),
              frontType: FrontType.japanese,
            ),
          );
          await database.spacedRepetitionDatasDao.set(
            SpacedRepetitionData.initial(
              dictionaryItem: await database.vocabsDao.get(1000160),
              frontType: FrontType.english,
            ),
          );

          final vocabList = await database.vocabsDao.getAll(
            [1000220, 1000160],
            frontType: FrontType.english,
          );
          expect(vocabList[0].id, 1000220);
          expect(vocabList[0].spacedRepetitionData!.vocabId, 1000220);
          expect(
            vocabList[0].spacedRepetitionData!.frontType,
            FrontType.english,
          );
          expect(vocabList[1].id, 1000160);
          expect(vocabList[1].spacedRepetitionData!.vocabId, 1000160);
          expect(
            vocabList[1].spacedRepetitionData!.frontType,
            FrontType.english,
          );
        });
      });
    });

    test('validateAll', () async {
      final vocabList = await database.vocabsDao.validateAll([1000220, 7]);
      expect(vocabList.length, 1);
      expect(vocabList[0].id, 1000220);
    });

    test('getByWriting', () async {
      final vocabList = await database.vocabsDao.getByWriting('明白');
      expect(vocabList.length, 1);
      expect(vocabList[0].id, 1000220);
      expect(vocabList[0].writings!.length, 1);
      expect(vocabList[0].writings![0].writing, '明白');
      expect(vocabList[0].readings.length, 1);
      expect(vocabList[0].readings[0].reading, 'めいはく');
      expect(vocabList[0].definitions.length, 1);
      expect(
        vocabList[0].definitions[0].definition,
        'obvious; clear; plain; evident; apparent; explicit; overt',
      );
    });

    test('getByReading', () async {
      final vocabList = await database.vocabsDao.getByReading('めいはく');
      expect(vocabList.length, 1);
      expect(vocabList[0].id, 1000220);
      expect(vocabList[0].writings!.length, 1);
      expect(vocabList[0].writings![0].writing, '明白');
      expect(vocabList[0].readings.length, 1);
      expect(vocabList[0].readings[0].reading, 'めいはく');
      expect(vocabList[0].definitions.length, 1);
      expect(
        vocabList[0].definitions[0].definition,
        'obvious; clear; plain; evident; apparent; explicit; overt',
      );
    });

    group('getByWritingAndReading', () {
      test('Valid', () async {
        final vocabList = await database.vocabsDao.getByWritingAndReading(
          '明白',
          'めいはく',
        );
        expect(vocabList.length, 1);
        expect(vocabList[0].id, 1000220);
        expect(vocabList[0].writings!.length, 1);
        expect(vocabList[0].writings![0].writing, '明白');
        expect(vocabList[0].readings.length, 1);
        expect(vocabList[0].readings[0].reading, 'めいはく');
        expect(vocabList[0].definitions.length, 1);
        expect(
          vocabList[0].definitions[0].definition,
          'obvious; clear; plain; evident; apparent; explicit; overt',
        );
      });

      test('Empty result', () async {
        final vocabList = await database.vocabsDao.getByWritingAndReading(
          '明白',
          'ら',
        );
        expect(vocabList.length, 0);
      });
    });

    test('getUsingKanji', () async {
      final vocabList = await database.vocabsDao.getUsingKanji('行');
      expect(vocabList.length, 2);
      expect(vocabList[0].id, 1310500);
      expect(vocabList[0].writings!.length, 7);
      expect(vocabList[0].writings![0].writing, '上手く行く');
      expect(vocabList[0].readings.length, 1);
      expect(vocabList[0].readings[0].reading, 'うまくいく');
      expect(vocabList[0].definitions.length, 1);
      expect(
        vocabList[0].definitions[0].definition,
        'to go smoothly; to turn out well; to do the trick; to have peaceful relations',
      );
      expect(vocabList[1].id, 1578850);
      expect(vocabList[1].writings!.length, 3);
      expect(vocabList[1].writings![0].writing, '行く');
      expect(vocabList[1].readings.length, 2);
      expect(vocabList[1].readings[0].reading, 'いく');
      expect(vocabList[1].definitions.length, 10);
      expect(
        vocabList[1].definitions[0].definition,
        'to go; to move (in a direction or towards a specific location); to head (towards); to be transported (towards); to reach',
      );
    });

    group('search', () {
      group('Definition', () {
        test('Single word', () async {
          final results = await database.vocabsDao.search('shirt');
          expect(results.length, 1);
          expect(results[0].id, 1000160);
        });

        test('Partial word', () async {
          final results = await database.vocabsDao.search('shir');
          expect(results.length, 1);
          expect(results[0].id, 1000160);
        });

        test('Multiple words', () async {
          final results = await database.vocabsDao.search('in a flash');
          expect(results.length, 1);
          expect(results[0].id, 1000390);
        });

        test('Single and partial word', () async {
          final results = await database.vocabsDao.search('no ti');
          expect(results.length, 2);
          expect(results[0].id, 1000390);
          expect(results[1].id, 1003430);
        });
      });

      group('Writing', () {
        test('Complete', () async {
          final results = await database.vocabsDao.search('行く');
          expect(results.length, 1);
          expect(results[0].id, 1578850);
        });

        test('Partial', () async {
          final results = await database.vocabsDao.search('行');
          expect(results.length, 1);
          expect(results[0].id, 1578850);
        });
      });

      group('Reading', () {
        test('Complete', () async {
          final results = await database.vocabsDao.search('きっと');
          expect(results.length, 1);
          expect(results[0].id, 1003430);
        });

        test('Partial', () async {
          final results = await database.vocabsDao.search('きっ');
          expect(results.length, 1);
          expect(results[0].id, 1003430);
        });
      });

      group('Reading romaji', () {
        test('Complete', () async {
          final results = await database.vocabsDao.search('kitto');
          expect(results.length, 1);
          expect(results[0].id, 1003430);
        });

        test('Partial', () async {
          final results = await database.vocabsDao.search('kitt');
          expect(results.length, 1);
          expect(results[0].id, 1003430);
        });

        test('Simplified', () async {
          final results = await database.vocabsDao.search('kito');
          expect(results.length, 1);
          expect(results[0].id, 1003430);
        });
      });

      test('Searching only symbols', () async {
        final results = await database.vocabsDao.search('.');
        expect(results.length, 0);
      });
    });

    test('VocabNote', () async {
      final nullNote = await database.vocabsDao.getNote(1000220);
      expect(nullNote, null);

      final createdNote = await database.vocabsDao.setNote(
        1000220,
        'Important',
      );
      expect(createdNote.note, 'Important');

      await database.vocabsDao.setNote(1000220, 'Important again');
      final note = await database.vocabsDao.getNote(1000220);
      expect(note!.note, 'Important again');

      await database.vocabsDao.setNote(1000160, 'Other');
      final vocabNotes = await database.vocabsDao.getAllNotes();
      expect(vocabNotes.length, 2);

      await database.vocabsDao.deleteNote(1000220);
      final deletedNote = await database.vocabsDao.getNote(1000220);
      expect(deletedNote, null);
    });
  });
}
