import 'package:drift/drift.dart';
import 'package:kana_kit/kana_kit.dart';
import 'package:sagase_dictionary/src/database.dart';
import 'package:sagase_dictionary/src/datamodels/vocabs.dart';
import 'package:sagase_dictionary/src/utils/enums.dart';
import 'package:sagase_dictionary/src/utils/string_utils.dart';

part 'vocabs_dao.g.dart';

@DriftAccessor(tables: [Vocabs, VocabWritings, VocabReadings, VocabDefinitions])
class VocabsDao extends DatabaseAccessor<AppDatabase> with _$VocabsDaoMixin {
  final _kanaKit = const KanaKit().copyWithConfig(passRomaji: true);

  VocabsDao(super.db);

  Future<Vocab> get(int id, {FrontType? frontType}) async {
    final baseQuery = db.select(db.vocabs)
      ..where((vocab) => vocab.id.equals(id));

    late Vocab vocab;
    if (frontType == null) {
      // Get vocab only
      vocab = await baseQuery.getSingle();
    } else {
      // If front type is given get that spaced repetition data too
      vocab = await baseQuery
          .join([
            leftOuterJoin(
                db.spacedRepetitionDatas,
                Expression.and([
                  db.spacedRepetitionDatas.vocabId.equals(id),
                  db.spacedRepetitionDatas.frontType.equals(frontType.index),
                ]))
          ])
          .map(
            (row) => row.readTable(db.vocabs)
              ..spacedRepetitionData =
                  row.readTableOrNull(db.spacedRepetitionDatas),
          )
          .getSingle();
    }

    return _getFromBase(vocab);
  }

  Future<Vocab> _getFromBase(Vocab vocab) async {
    final writings = await (db.select(db.vocabWritings)
          ..where((writing) => writing.vocabId.equals(vocab.id))
          ..orderBy([(writing) => OrderingTerm.asc(writing.id)]))
        .get();

    final readings = await (db.select(db.vocabReadings)
          ..where((reading) => reading.vocabId.equals(vocab.id))
          ..orderBy([(reading) => OrderingTerm.asc(reading.id)]))
        .get();

    final definitions = await (db.select(db.vocabDefinitions)
          ..where((definition) => definition.vocabId.equals(vocab.id))
          ..orderBy([(definition) => OrderingTerm.asc(definition.id)]))
        .get();

    return vocab
      ..writings = writings.isEmpty ? null : writings
      ..readings = readings
      ..definitions = definitions;
  }

  Future<List<Vocab>> getAll(List<int> ids, {FrontType? frontType}) async {
    List<Vocab> vocabList = [];
    for (final id in ids) {
      vocabList.add(await get(id, frontType: frontType));
    }
    return vocabList;
  }

  Future<List<Vocab>> _getAllFromBase(List<Vocab> vocabList) async {
    for (final vocab in vocabList) {
      await _getFromBase(vocab);
    }
    return vocabList;
  }

  Future<List<Vocab>> validateAllVocab(List<int> idList) async {
    List<Vocab> vocabList = [];
    for (final id in idList) {
      final vocab = await (db.select(db.vocabs)
            ..where((row) => row.id.equals(id)))
          .getSingleOrNull();
      if (vocab != null) vocabList.add(vocab);
    }
    return vocabList;
  }

  Future<List<Vocab>> getVocabByWriting(String text) async {
    final matchingWriting = Subquery(
      db.select(db.vocabWritings)
        ..where((writing) => Expression.or([
              writing.writing.equals(text),
              writing.writingSearchForm.equals(
                  _kanaKit.toHiragana(text.toLowerCase().romajiToHalfWidth())),
            ])),
      'matching_writing',
    );

    final query = db.select(db.vocabs).join([
      innerJoin(
        matchingWriting,
        matchingWriting.ref(db.vocabWritings.vocabId).equalsExp(db.vocabs.id),
        useColumns: false,
      ),
    ])
      ..groupBy([db.vocabs.id]);

    final baseList = await query.map((row) => row.readTable(db.vocabs)).get();

    return _getAllFromBase(baseList);
  }

  Future<List<Vocab>> getVocabByReading(String text) async {
    final matchingReading = Subquery(
      db.select(db.vocabReadings)
        ..where((reading) => Expression.or([
              reading.reading.equals(text),
              reading.readingSearchForm.equals(_kanaKit.toHiragana(text)),
            ])),
      'matching_reading',
    );

    final query = db.select(db.vocabs).join([
      innerJoin(
        matchingReading,
        matchingReading.ref(db.vocabReadings.vocabId).equalsExp(db.vocabs.id),
        useColumns: false,
      ),
    ])
      ..groupBy([db.vocabs.id]);

    final baseList = await query.map((row) => row.readTable(db.vocabs)).get();

    return _getAllFromBase(baseList);
  }

  Future<List<Vocab>> getUsingKanji(String kanji) async {
    final searchWriting = Subquery(
      db.select(db.vocabWritings)
        ..where((writing) => writing.writing.contains(kanji)),
      'search_writing',
    );

    final query = db.select(db.vocabs).join([
      innerJoin(
        searchWriting,
        searchWriting.ref(db.vocabWritings.vocabId).equalsExp(db.vocabs.id),
        useColumns: false,
      ),
    ])
      ..orderBy([OrderingTerm.desc(db.vocabs.frequencyScore)])
      ..groupBy([db.vocabs.id]);

    final baseList = await query.map((row) => row.readTable(db.vocabs)).get();

    return _getAllFromBase(baseList);
  }

  Future<List<Vocab>> search(String text) async {
    final cleanedText = RegExp.escape(text).toLowerCase();

    if (_kanaKit.isRomaji(cleanedText)) {
      // Romaji
      final splits = cleanedText.splitWords();
      if (splits.length > 1) {
        // Search by definition
        return _searchByDefinition(splits.toSet().toList());
      } else {
        // Search by romaji reading and definition

        // Search by definition
        final definitionResults =
            await _searchByDefinition(splits.toSet().toList());

        // Search by romaji reading
        final searchingReading = Subquery(
          db.select(db.vocabReadings)
            ..where((reading) => Expression.or([
                  reading.readingRomaji.like('$cleanedText%'),
                  reading.readingRomajiSimplified.like('$cleanedText%'),
                ])),
          'search_reading',
        );

        final query = db.select(db.vocabs).join([
          innerJoin(
            searchingReading,
            searchingReading
                .ref(db.vocabReadings.vocabId)
                .equalsExp(db.vocabs.id),
            useColumns: false,
          ),
        ])
          ..orderBy([
            OrderingTerm.asc(
                searchingReading.ref(db.vocabReadings.readingRomaji).length),
            OrderingTerm.desc(db.vocabs.frequencyScore),
          ])
          ..groupBy([db.vocabs.id]);

        final vocabList =
            await query.map((row) => row.readTable(db.vocabs)).get();

        final readingResults = await _getAllFromBase(vocabList);

        // If one of the lists is empty, can simply return the non empty one
        if (definitionResults.isEmpty) return readingResults;
        if (readingResults.isEmpty) return definitionResults;

        // Simple merging order
        // - Exact match readings results
        // - All definition results
        // - Remaining reading results
        List<Vocab> mergedResults = [];

        outer:
        for (int i = 0; i < readingResults.length; i++) {
          for (var reading in readingResults[i].readings) {
            if (cleanedText == reading.readingRomaji ||
                cleanedText == reading.readingRomajiSimplified) {
              mergedResults.add(readingResults.removeAt(i--));
              continue outer;
            }
          }
          break;
        }

        return mergedResults + definitionResults + readingResults;
      }
    } else {
      // Japanese text
      if (_kanaKit.isKana(cleanedText)) {
        // Search by reading
        final searchingReading = Subquery(
          db.select(db.vocabReadings)
            ..where((reading) => Expression.or([
                  reading.reading.like('$cleanedText%'),
                  reading.readingSearchForm
                      .like(_kanaKit.toHiragana('$cleanedText%')),
                ])),
          'search_reading',
        );

        final query = db.select(db.vocabs).join([
          innerJoin(
            searchingReading,
            searchingReading
                .ref(db.vocabReadings.vocabId)
                .equalsExp(db.vocabs.id),
            useColumns: false,
          ),
        ])
          ..orderBy([
            OrderingTerm.asc(
                searchingReading.ref(db.vocabReadings.reading).length),
            OrderingTerm.desc(db.vocabs.frequencyScore),
          ])
          ..groupBy([db.vocabs.id]);

        final baseList =
            await query.map((row) => row.readTable(db.vocabs)).get();

        return _getAllFromBase(baseList);
      } else {
        // Search by writing
        final searchingWriting = Subquery(
          db.select(db.vocabWritings)
            ..where((writing) => Expression.or([
                  writing.writing.like('$cleanedText%'),
                  writing.writingSearchForm.like(_kanaKit.toHiragana(
                      '$cleanedText%'.toLowerCase().romajiToHalfWidth())),
                ])),
          'search_writing',
        );

        final query = db.select(db.vocabs).join([
          innerJoin(
            searchingWriting,
            searchingWriting
                .ref(db.vocabWritings.vocabId)
                .equalsExp(db.vocabs.id),
            useColumns: false,
          ),
        ])
          ..orderBy([
            OrderingTerm.asc(
                searchingWriting.ref(db.vocabWritings.writing).length),
            OrderingTerm.desc(db.vocabs.frequencyScore),
          ])
          ..groupBy([db.vocabs.id]);

        final baseList =
            await query.map((row) => row.readTable(db.vocabs)).get();

        return _getAllFromBase(baseList);
      }
    }
  }

  Future<List<Vocab>> _searchByDefinition(List<String> splits) async {
    // Create sub queries that match all but the last split
    List<Subquery<VocabDefinitionWord>> subqueries = [];
    for (int i = 0; i < splits.length - 1; i++) {
      subqueries.add(Subquery(
        db.select(db.vocabDefinitionWords)
          ..where((word) => word.word.equals(splits[i])),
        'search_definition_$i',
      ));
    }

    // Create a sub query that uses like for the last split
    subqueries.add(Subquery(
      db.select(db.vocabDefinitionWords)
        ..where((word) => word.word.like('${splits.last}%')),
      'search_definition_${splits.length}',
    ));

    final vocabList = await (db.select(db.vocabs).join(subqueries
            .map(
              (e) => innerJoin(
                e,
                e.ref(db.vocabDefinitionWords.vocabId).equalsExp(db.vocabs.id),
                useColumns: false,
              ),
            )
            .toList())
          ..orderBy([
            OrderingTerm.asc(db.vocabs.frequencyScore, nulls: NullsOrder.last),
            OrderingTerm.desc(db.vocabs.common),
          ])
          ..groupBy([db.vocabs.id])
          ..limit(1000))
        .map((row) => row.readTable(db.vocabs))
        .get();

    return _getAllFromBase(vocabList);
  }
}
