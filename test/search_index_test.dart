import 'package:drift/drift.dart' as drift;
import 'package:sagase_dictionary/src/database.dart';
import 'package:test/test.dart';

// The search DAOs filter these columns with a prefix LIKE, which SQLite can
// only satisfy with an index when the column (and so its index) uses the
// NOCASE collation. These tests check the query plans of the shapes used by
// the DAOs so a change to the columns or indexes can not silently turn the
// searches into full table scans.
void main() {
  group('Search indexes', () {
    late AppDatabase database;

    setUp(() async {
      database = AppDatabase();
    });

    tearDown(() async {
      await database.close();
    });

    Future<List<String>> queryPlan(String sql, int argCount) async {
      final rows = await database.customSelect(
        'EXPLAIN QUERY PLAN $sql',
        variables: [
          for (var i = 0; i < argCount; i++) drift.Variable<String>('a%'),
        ],
      ).get();
      return rows.map((row) => row.read<String>('detail')).toList();
    }

    // Checks that the table is never scanned and that every expected index
    // shows up in the plan
    Future<void> expectIndexed(
      String sql,
      int argCount,
      String table,
      List<String> indexes,
    ) async {
      final plan = await queryPlan(sql, argCount);
      expect(plan, isNot(contains(startsWith('SCAN $table'))), reason: sql);
      for (final index in indexes) {
        expect(plan, contains(contains('INDEX $index ')), reason: sql);
      }
    }

    // (table, column, index)
    const prefixSearchColumns = [
      ('vocab_writings', 'writing', 'IX_vocab_writings_writing'),
      (
        'vocab_writings',
        'writing_search_form',
        'IX_vocab_writings_writing_search_form',
      ),
      ('vocab_readings', 'reading', 'IX_vocab_readings_reading'),
      (
        'vocab_readings',
        'reading_search_form',
        'IX_vocab_readings_reading_search_form',
      ),
      ('vocab_readings', 'reading_romaji', 'IX_vocab_readings_reading_romaji'),
      (
        'vocab_readings',
        'reading_romaji_simplified',
        'IX_vocab_readings_reading_romaji_simplified',
      ),
      ('vocab_definition_words', 'word', 'IX_vocab_definition_words_word'),
      ('kanji_readings', 'reading', 'IX_kanji_readings_reading'),
      (
        'kanji_readings',
        'reading_search_form',
        'IX_kanji_readings_reading_search_form',
      ),
      ('kanji_readings', 'reading_romaji', 'IX_kanji_readings_reading_romaji'),
      (
        'kanji_readings',
        'reading_romaji_simplified',
        'IX_kanji_readings_reading_romaji_simplified',
      ),
      ('kanji_meaning_words', 'word', 'IX_kanji_meaning_words_word'),
      ('proper_nouns', 'writing', 'IX_proper_nouns_writing'),
      (
        'proper_nouns',
        'writing_search_form',
        'IX_proper_nouns_writing_search_form',
      ),
      ('proper_nouns', 'reading', 'IX_proper_nouns_reading'),
      (
        'proper_nouns',
        'reading_search_form',
        'IX_proper_nouns_reading_search_form',
      ),
      ('proper_nouns', 'reading_romaji', 'IX_proper_nouns_reading_romaji'),
      (
        'proper_nouns',
        'reading_romaji_simplified',
        'IX_proper_nouns_reading_romaji_simplified',
      ),
      ('proper_nouns', 'romaji', 'IX_proper_nouns_romaji'),
      (
        'proper_noun_romaji_words',
        'word',
        'IX_proper_noun_romaji_words_word',
      ),
    ];

    for (final (table, column, index) in prefixSearchColumns) {
      test('prefix LIKE on $table.$column uses $index', () async {
        await expectIndexed(
          'SELECT * FROM $table WHERE $column LIKE ?',
          1,
          table,
          [index],
        );
      });
    }

    // Shapes used by getByWriting, getByReading and getByWritingAndReading
    // (table, column, index of the column, index of the search form column)
    const lookupPairs = [
      (
        'vocab_writings',
        'writing',
        'IX_vocab_writings_writing',
        'IX_vocab_writings_writing_search_form',
      ),
      (
        'vocab_readings',
        'reading',
        'IX_vocab_readings_reading',
        'IX_vocab_readings_reading_search_form',
      ),
      (
        'proper_nouns',
        'writing',
        'IX_proper_nouns_writing',
        'IX_proper_nouns_writing_search_form',
      ),
      (
        'proper_nouns',
        'reading',
        'IX_proper_nouns_reading',
        'IX_proper_nouns_reading_search_form',
      ),
    ];

    for (final (table, column, index, searchFormIndex) in lookupPairs) {
      test('equality OR on $table.$column uses both indexes', () async {
        await expectIndexed(
          'SELECT * FROM $table WHERE $column = ? OR ${column}_search_form = ?',
          2,
          table,
          [index, searchFormIndex],
        );
      });

      test('prefix LIKE OR on $table.$column uses both indexes', () async {
        await expectIndexed(
          'SELECT * FROM $table WHERE $column LIKE ? OR ${column}_search_form LIKE ?',
          2,
          table,
          [index, searchFormIndex],
        );
      });
    }

    // Shape used by the multiple word searches
    // (table, index)
    const wordTables = [
      ('vocab_definition_words', 'IX_vocab_definition_words_word'),
      ('kanji_meaning_words', 'IX_kanji_meaning_words_word'),
      ('proper_noun_romaji_words', 'IX_proper_noun_romaji_words_word'),
    ];

    for (final (table, index) in wordTables) {
      test('IN list OR prefix LIKE on $table.word uses $index', () async {
        await expectIndexed(
          'SELECT * FROM $table WHERE word IN (?, ?) OR word LIKE ?',
          3,
          table,
          [index],
        );
      });
    }

    test('romaji reading OR on vocab_readings uses both indexes', () async {
      await expectIndexed(
        'SELECT * FROM vocab_readings WHERE reading_romaji LIKE ? OR reading_romaji_simplified LIKE ?',
        2,
        'vocab_readings',
        [
          'IX_vocab_readings_reading_romaji',
          'IX_vocab_readings_reading_romaji_simplified',
        ],
      );
    });

    test('romaji reading OR on kanji_readings uses both indexes', () async {
      await expectIndexed(
        'SELECT * FROM kanji_readings WHERE reading_romaji LIKE ? OR reading_romaji_simplified LIKE ?',
        2,
        'kanji_readings',
        [
          'IX_kanji_readings_reading_romaji',
          'IX_kanji_readings_reading_romaji_simplified',
        ],
      );
    });

    test('proper noun romaji search uses all indexes', () async {
      await expectIndexed(
        'SELECT * FROM proper_nouns WHERE '
            'id IN (SELECT proper_noun_id FROM proper_noun_romaji_words WHERE word LIKE ?) '
            'OR reading_romaji LIKE ? OR reading_romaji_simplified LIKE ? OR romaji LIKE ?',
        4,
        'proper_nouns',
        [
          'IX_proper_noun_romaji_words_word',
          'IX_proper_nouns_reading_romaji',
          'IX_proper_nouns_reading_romaji_simplified',
          'IX_proper_nouns_romaji',
        ],
      );
    });
  });
}
