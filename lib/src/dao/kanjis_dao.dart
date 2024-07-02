import 'package:drift/drift.dart';
import 'package:kana_kit/kana_kit.dart';
import 'package:sagase_dictionary/src/database.dart';
import 'package:sagase_dictionary/src/datamodels/kanjis.dart';
import 'package:sagase_dictionary/src/datamodels/spaced_repetition_datas.dart';
import 'package:sagase_dictionary/src/utils/enums.dart';
import 'package:sagase_dictionary/src/utils/string_utils.dart';

part 'kanjis_dao.g.dart';

@DriftAccessor(tables: [Kanjis, KanjiReadings, SpacedRepetitionDatas])
class KanjisDao extends DatabaseAccessor<AppDatabase> with _$KanjisDaoMixin {
  final _kanaKit = const KanaKit().copyWithConfig(passRomaji: true);

  KanjisDao(super.db);

  Future<Kanji> get(int id, {FrontType? frontType}) async {
    final baseQuery = db.select(db.kanjis)..where((row) => row.id.equals(id));

    late Kanji kanji;
    if (frontType == null) {
      // Get kanji only
      kanji = await baseQuery.getSingle();
    } else {
      // If front type is given get that spaced repetition data too
      kanji = await baseQuery
          .join([
            leftOuterJoin(
                db.spacedRepetitionDatas,
                Expression.and([
                  db.spacedRepetitionDatas.kanjiId.equals(id),
                  db.spacedRepetitionDatas.frontType.equals(frontType.index),
                ]))
          ])
          .map(
            (row) => row.readTable(db.kanjis)
              ..spacedRepetitionData =
                  row.readTableOrNull(db.spacedRepetitionDatas),
          )
          .getSingle();
    }

    List<KanjiReading> onReadings = [];
    List<KanjiReading> kunReadings = [];
    List<KanjiReading> nanori = [];

    final readings = await (db.select(db.kanjiReadings)
          ..where((reading) => reading.kanjiId.equals(kanji.id))
          ..orderBy([(reading) => OrderingTerm.asc(reading.id)]))
        .get();

    for (final reading in readings) {
      switch (reading.type) {
        case KanjiReadingType.on:
          onReadings.add(reading);
          break;
        case KanjiReadingType.kun:
          kunReadings.add(reading);
          break;
        case KanjiReadingType.nanori:
          nanori.add(reading);
          break;
      }
    }

    return kanji
      ..onReadings = onReadings.isEmpty ? null : onReadings
      ..kunReadings = kunReadings.isEmpty ? null : kunReadings
      ..nanori = nanori.isEmpty ? null : nanori;
  }

  Future<Kanji> getKanji(String kanji, {FrontType? frontType}) async {
    return get(kanji.kanjiCodePoint(), frontType: frontType);
  }

  Future<List<Kanji>> getAll(List<int> idList, {FrontType? frontType}) async {
    final baseQuery = db.select(db.kanjis)..where((row) => row.id.isIn(idList));

    late Map<int, Kanji> kanjiMap = {};
    if (frontType == null) {
      // Get kanji only
      kanjiMap = {for (var kanji in (await baseQuery.get())) kanji.id: kanji};
    } else {
      // If front type is given get that spaced repetition data too
      final query = baseQuery.join([
        leftOuterJoin(
            db.spacedRepetitionDatas,
            Expression.and([
              db.spacedRepetitionDatas.kanjiId.equalsExp(db.kanjis.id),
              db.spacedRepetitionDatas.frontType.equals(frontType.index),
            ]))
      ]).map(
        (row) => row.readTable(db.kanjis)
          ..spacedRepetitionData =
              row.readTableOrNull(db.spacedRepetitionDatas),
      );

      kanjiMap = {for (var kanji in (await query.get())) kanji.id: kanji};
    }

    final readings = await (db.select(db.kanjiReadings)
          ..where((row) => row.kanjiId.isIn(idList))
          ..orderBy([(reading) => OrderingTerm.asc(reading.id)]))
        .get();

    if (readings.isNotEmpty) {
      int currentKanjiId = readings[0].kanjiId;
      List<KanjiReading> onReadings = [];
      List<KanjiReading> kunReadings = [];
      List<KanjiReading> nanori = [];
      for (final reading in readings) {
        // If id does not match got to new kanji, add current readings and clear lists
        if (reading.kanjiId != currentKanjiId) {
          kanjiMap[currentKanjiId]!
            ..onReadings = onReadings.isEmpty ? null : onReadings
            ..kunReadings = kunReadings.isEmpty ? null : kunReadings
            ..nanori = nanori.isEmpty ? null : nanori;
          currentKanjiId = reading.kanjiId;
          onReadings = [];
          kunReadings = [];
          nanori = [];
        }
        switch (reading.type) {
          case KanjiReadingType.on:
            onReadings.add(reading);
            break;
          case KanjiReadingType.kun:
            kunReadings.add(reading);
            break;
          case KanjiReadingType.nanori:
            nanori.add(reading);
            break;
        }
      }
      // Add remaining readings
      kanjiMap[currentKanjiId]!
        ..onReadings = onReadings.isEmpty ? null : onReadings
        ..kunReadings = kunReadings.isEmpty ? null : kunReadings
        ..nanori = nanori.isEmpty ? null : nanori;
    }

    // Put the results in the same order as the input
    List<Kanji> kanjiList = [];
    for (final id in idList) {
      kanjiList.add(kanjiMap[id]!);
    }

    return kanjiList;
  }

  Future<List<Kanji>> _getAllFromBase(List<Kanji> kanjiList) async {
    final kanjiMap = {for (var kanji in kanjiList) kanji.id: kanji};

    final readings = await (db.select(db.kanjiReadings)
          ..where((row) => row.kanjiId.isIn(kanjiMap.keys))
          ..orderBy([(reading) => OrderingTerm.asc(reading.id)]))
        .get();

    if (readings.isNotEmpty) {
      int currentKanjiId = readings[0].kanjiId;
      List<KanjiReading> onReadings = [];
      List<KanjiReading> kunReadings = [];
      List<KanjiReading> nanori = [];
      for (final reading in readings) {
        // If id does not match got to new kanji, add current readings and clear lists
        if (reading.kanjiId != currentKanjiId) {
          kanjiMap[currentKanjiId]!
            ..onReadings = onReadings.isEmpty ? null : onReadings
            ..kunReadings = kunReadings.isEmpty ? null : kunReadings
            ..nanori = nanori.isEmpty ? null : nanori;
          currentKanjiId = reading.kanjiId;
          onReadings = [];
          kunReadings = [];
          nanori = [];
        }
        switch (reading.type) {
          case KanjiReadingType.on:
            onReadings.add(reading);
            break;
          case KanjiReadingType.kun:
            kunReadings.add(reading);
            break;
          case KanjiReadingType.nanori:
            nanori.add(reading);
            break;
        }
      }
      // Add remaining readings
      kanjiMap[currentKanjiId]!
        ..onReadings = onReadings.isEmpty ? null : onReadings
        ..kunReadings = kunReadings.isEmpty ? null : kunReadings
        ..nanori = nanori.isEmpty ? null : nanori;
    }

    return kanjiList;
  }

  Future<List<Kanji>> validateAll(List<int> idList) async {
    final kanjiMap = {
      for (var kanji in (await (db.select(db.kanjis)
            ..where((row) => row.id.isIn(idList)))
          .get()))
        kanji.id: kanji
    };

    // Put the results in the same order as the input
    List<Kanji> kanjiList = [];
    for (final id in idList) {
      final kanji = kanjiMap[id];
      if (kanji != null) kanjiList.add(kanji);
    }
    return kanjiList;
  }

  Future<List<Kanji>> getAllWithRadical(String radical) async {
    final kanjiList = await (db.select(db.kanjis)
          ..where((kanji) => kanji.radical.equals(radical))
          ..orderBy([
            (kanji) => OrderingTerm.asc(kanji.strokeCount),
            (kanji) => OrderingTerm.asc(kanji.frequency),
          ]))
        .get();

    return _getAllFromBase(kanjiList);
  }

  Future<List<Kanji>> search(String text) async {
    final cleanedText = RegExp.escape(text).toLowerCase();

    // If given a single kanji character return only that
    if (cleanedText.length == 1 && _kanaKit.isKanji(cleanedText)) {
      return [await getKanji(cleanedText)];
    }

    if (_kanaKit.isRomaji(cleanedText)) {
      // Romaji
      final splits = cleanedText.splitWords();
      if (splits.length > 1) {
        // Search by meaning
        return _searchByMeaning(splits);
      } else {
        // Search by meaning and romaji reading/writing

        // Search by meaning
        final meaningResults = await _searchByMeaning(splits);

        // Search by romaji reading
        final searchingReading = Subquery(
          db.select(db.kanjiReadings)
            ..where(
              (reading) => Expression.or([
                reading.readingRomaji.like('$cleanedText%'),
                reading.readingRomajiSimplified.like('$cleanedText%'),
              ]),
            ),
          'search_reading',
        );

        final query = db.select(db.kanjis).join([
          innerJoin(
            searchingReading,
            searchingReading
                .ref(db.kanjiReadings.kanjiId)
                .equalsExp(db.kanjis.id),
            useColumns: false,
          ),
        ])
          ..orderBy([
            OrderingTerm.asc(
                searchingReading.ref(db.kanjiReadings.readingRomaji).length),
            OrderingTerm.asc(db.kanjis.frequency, nulls: NullsOrder.last),
          ])
          ..groupBy([db.kanjis.id])
          ..limit(500);

        final kanjiList =
            await query.map((row) => row.readTable(db.kanjis)).get();

        final readingResults = await _getAllFromBase(kanjiList);

        // If one of the lists is empty, can simply return the non empty one
        if (meaningResults.isEmpty) return readingResults;
        if (readingResults.isEmpty) return meaningResults;

        // Simple merging order
        // - Exact match readings results
        // - All meaning results
        // - Remaining reading results
        List<Kanji> mergedResults = [];

        outer:
        for (int i = 0; i < readingResults.length; i++) {
          if (readingResults[i].onReadings != null) {
            for (var reading in readingResults[i].onReadings!) {
              if (cleanedText == reading.readingRomaji ||
                  cleanedText == reading.readingRomajiSimplified) {
                mergedResults.add(readingResults.removeAt(i--));
                continue outer;
              }
            }
          }
          if (readingResults[i].kunReadings != null) {
            for (var reading in readingResults[i].kunReadings!) {
              if (cleanedText == reading.readingRomaji ||
                  cleanedText == reading.readingRomajiSimplified) {
                mergedResults.add(readingResults.removeAt(i--));
                continue outer;
              }
            }
          }
          if (readingResults[i].nanori != null) {
            for (var reading in readingResults[i].nanori!) {
              if (cleanedText == reading.readingRomaji ||
                  cleanedText == reading.readingRomajiSimplified) {
                mergedResults.add(readingResults.removeAt(i--));
                continue outer;
              }
            }
          }
          break;
        }

        return mergedResults + meaningResults + readingResults;
      }
    } else {
      // Japanese text, search by reading
      String queryText = _kanaKit.toHiragana('$cleanedText%');
      final searchingReading = Subquery(
        db.select(db.kanjiReadings)
          ..where(
            (reading) => Expression.or([
              reading.reading.like(queryText),
              reading.readingSearchForm.like(queryText),
            ]),
          ),
        'search_reading',
      );

      final query = db.select(db.kanjis).join([
        innerJoin(
          searchingReading,
          searchingReading
              .ref(db.kanjiReadings.kanjiId)
              .equalsExp(db.kanjis.id),
          useColumns: false,
        ),
      ])
        ..orderBy([
          OrderingTerm.asc(
              searchingReading.ref(db.kanjiReadings.reading).length),
          OrderingTerm.asc(db.kanjis.frequency, nulls: NullsOrder.last),
        ])
        ..groupBy([db.kanjis.id])
        ..limit(500);

      final kanjiList =
          await query.map((row) => row.readTable(db.kanjis)).get();

      return _getAllFromBase(kanjiList);
    }
  }

  Future<List<Kanji>> _searchByMeaning(List<String> splits) async {
    final uniqueWords = splits.toSet().toList();

    // Create sub queries that match all but the last word
    List<Subquery<KanjiMeaningWord>> subqueries = [];
    for (int i = 0; i < uniqueWords.length - 1; i++) {
      subqueries.add(Subquery(
        db.select(db.kanjiMeaningWords)
          ..where((word) => word.word.equals(uniqueWords[i])),
        'search_meaning_$i',
      ));
    }

    // Create a sub query that uses like for the last word
    subqueries.add(Subquery(
      db.select(db.kanjiMeaningWords)
        ..where((word) => word.word.like('${uniqueWords.last}%')),
      'search_meaning_${uniqueWords.length}',
    ));

    final kanjiList = await (db.select(db.kanjis).join(subqueries
            .map(
              (e) => innerJoin(
                e,
                e.ref(db.kanjiMeaningWords.kanjiId).equalsExp(db.kanjis.id),
                useColumns: false,
              ),
            )
            .toList())
          ..orderBy([
            OrderingTerm.asc(db.kanjis.frequency, nulls: NullsOrder.last),
          ])
          ..groupBy([db.kanjis.id])
          ..limit(500))
        .map((row) => row.readTable(db.kanjis))
        .get();

    return _getAllFromBase(kanjiList);
  }
}
