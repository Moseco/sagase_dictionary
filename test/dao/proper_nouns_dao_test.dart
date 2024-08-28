import 'dart:io';

import 'package:drift/drift.dart' as drift;
import 'package:path/path.dart' as path;
import 'package:sagase_dictionary/src/database.dart';
import 'package:sagase_dictionary/src/dictionary_builder.dart';
import 'package:test/test.dart';

import '../common.dart';

void main() {
  group('ProperNounsDaoTest', () {
    late AppDatabase database;

    setUp(() async {
      // Create basic database with data
      database = AppDatabase();

      // Add proper nouns
      await DictionaryBuilder.createProperNounDictionary(
        database,
        shortEnamdict,
      );
    });

    tearDown(() async {
      await database.close();
    });

    test('importProperNouns', () async {
      // Create temp directory and database file
      final tempDirectory =
          Directory.systemTemp.createTempSync('proper_nouns_test.');
      final properNounDatabaseFile =
          File(path.join(tempDirectory.path, 'proper_noun_database.sqlite'));

      // Export the database
      await database
          .customStatement('VACUUM INTO ?', [properNounDatabaseFile.path]);
      await database.close();

      // Open a new database
      final db = AppDatabase();

      expect(await db.properNouns.count().getSingle(), 0);

      // Import proper noun database
      await db.properNounsDao.importProperNouns(properNounDatabaseFile.path);

      expect(await db.properNouns.count().getSingle(), 6);

      // Cleanup
      await db.close();
      tempDirectory.deleteSync(recursive: true);
    });

    group('getByWriting', () {
      test('Matching writing', () async {
        final results = await database.properNounsDao.getByWriting('東京');
        expect(results.length, 1);
        expect(results[0].writing, '東京');
      });

      test('Missing writing', () async {
        final results = await database.properNounsDao.getByWriting('大阪');
        expect(results.length, 0);
      });
    });

    group('getByReading', () {
      test('Matching reading', () async {
        final results = await database.properNounsDao.getByReading('とうきょう');
        expect(results.length, 1);
        expect(results[0].writing, '東京');
      });

      test('Missing reading', () async {
        final results = await database.properNounsDao.getByReading('おおさか');
        expect(results.length, 0);
      });
    });

    group('getByWritingReading', () {
      test('Matching writing and reading', () async {
        final results = await database.properNounsDao.getByWritingAndReading(
          '東京',
          'とうきょう',
        );
        expect(results.length, 1);
        expect(results[0].writing, '東京');
      });

      test('Missing writing with matching reading', () async {
        final results = await database.properNounsDao.getByWritingAndReading(
          '東',
          'とうきょう',
        );
        expect(results.length, 0);
      });

      test('Matching writing with missing reading', () async {
        final results = await database.properNounsDao.getByWritingAndReading(
          '東京',
          'ときょ',
        );
        expect(results.length, 0);
      });

      test('Missing writing and reading', () async {
        final results = await database.properNounsDao.getByWritingAndReading(
          '大阪',
          'おおさか',
        );
        expect(results.length, 0);
      });
    });

    group('search', () {
      test('Writing complete', () async {
        final results = await database.properNounsDao.search('東京');
        expect(results.length, 1);
        expect(results[0].writing, '東京');
      });

      test('Writing partial', () async {
        final results = await database.properNounsDao.search('東');
        expect(results.length, 1);
        expect(results[0].writing, '東京');
      });

      test('Reading complete', () async {
        var results = await database.properNounsDao.search('さくら');
        expect(results.length, 1);
        expect(results[0].reading, 'さくら');

        results = await database.properNounsDao.search('ヴィナス');
        expect(results.length, 1);
        expect(results[0].reading, 'ヴィナス');
      });

      test('Reading partial', () async {
        final results = await database.properNounsDao.search('さく');
        expect(results.length, 1);
        expect(results[0].reading, 'さくら');
      });

      test('Reading romaji complete', () async {
        final results = await database.properNounsDao.search('toukyou');
        expect(results.length, 1);
        expect(results[0].writing, '東京');
      });

      test('Reading romaji partial', () async {
        final results = await database.properNounsDao.search('touky');
        expect(results.length, 1);
        expect(results[0].writing, '東京');
      });

      test('Romaji complete', () async {
        var results = await database.properNounsDao.search('Sakura');
        expect(results.length, 2);
        expect(results[0].reading, 'さくら');
        expect(results[1].reading, 'たなかさくら');

        results = await database.properNounsDao.search('sakura');
        expect(results.length, 2);
        expect(results[0].reading, 'さくら');
        expect(results[1].reading, 'たなかさくら');

        results = await database.properNounsDao.search('Venus');
        expect(results.length, 1);
        expect(results[0].reading, 'ヴィナス');

        results = await database.properNounsDao.search('venus');
        expect(results.length, 1);
        expect(results[0].reading, 'ヴィナス');

        results = await database.properNounsDao.search('jaxa');
        expect(results.length, 1);
        expect(results[0].reading, 'うちゅうきかん');
      });

      test('Romaji partial', () async {
        var results = await database.properNounsDao.search('Saku');
        expect(results.length, 2);
        expect(results[0].reading, 'さくら');
        expect(results[1].reading, 'たなかさくら');

        results = await database.properNounsDao.search('saku');
        expect(results.length, 2);
        expect(results[0].reading, 'さくら');
        expect(results[1].reading, 'たなかさくら');

        results = await database.properNounsDao.search('Ven');
        expect(results.length, 1);
        expect(results[0].reading, 'ヴィナス');

        results = await database.properNounsDao.search('ven');
        expect(results.length, 1);
        expect(results[0].reading, 'ヴィナス');

        results = await database.properNounsDao.search('jax');
        expect(results.length, 1);
        expect(results[0].reading, 'うちゅうきかん');
      });

      test('Romaji multiple words complete', () async {
        var results = await database.properNounsDao.search('Sakura Tanaka');
        expect(results.length, 1);
        expect(results[0].reading, 'たなかさくら');

        results = await database.properNounsDao.search('Tanaka Sakura');
        expect(results.length, 1);
        expect(results[0].reading, 'たなかさくら');

        results = await database.properNounsDao.search('Japanese Aerospace');
        expect(results.length, 1);
        expect(results[0].reading, 'うちゅうきかん');

        results = await database.properNounsDao.search('Shinzo Abe');
        expect(results.length, 1);
        expect(results[0].reading, 'あべしんぞう');

        results = await database.properNounsDao.search('Shinzō Abe');
        expect(results.length, 1);
        expect(results[0].reading, 'あべしんぞう');
      });

      test('Romaji multiple words partial', () async {
        var results = await database.properNounsDao.search('Sakura Tana');
        expect(results.length, 1);
        expect(results[0].reading, 'たなかさくら');

        results = await database.properNounsDao.search('Tanaka Saku');
        expect(results.length, 1);
        expect(results[0].reading, 'たなかさくら');

        results = await database.properNounsDao.search('Japanese Aerosp');
        expect(results.length, 1);
        expect(results[0].reading, 'うちゅうきかん');
      });
    });
  });
}
