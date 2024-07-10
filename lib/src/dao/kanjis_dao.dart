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
        return _searchByMeaning(cleanedText, splits);
      } else {
        // Search by meaning and romaji reading/writing

        // Search by meaning
        final meaningResults = await _searchByMeaning(cleanedText, splits);

        // Search by romaji reading
        final searchReading = Subquery(
          db.select(db.kanjiReadings)
            ..where(
              (reading) => Expression.or([
                reading.readingRomaji.like('$cleanedText%'),
                reading.readingRomajiSimplified.like('$cleanedText%'),
              ]),
            ),
          'search_reading',
        );

        final minReadingRomajiLength =
            searchReading.ref(db.kanjiReadings.readingRomaji).length.min();
        final query = db.select(db.kanjis).join([
          innerJoin(
            searchReading,
            searchReading.ref(db.kanjiReadings.kanjiId).equalsExp(db.kanjis.id),
            useColumns: false,
          ),
        ])
          ..addColumns([minReadingRomajiLength])
          ..orderBy([
            OrderingTerm.asc(minReadingRomajiLength),
            OrderingTerm.asc(db.kanjis.frequency, nulls: NullsOrder.last),
          ])
          ..groupBy([db.kanjis.id])
          ..limit(500);

        // Get kanji and sort by if the reading is an exact match or not
        // This solves some romaji simplification problems and
        // makes possible sorting later more convenient
        final rows = await query.get();
        List<Kanji> exactMatchKanji = [];
        List<Kanji> otherKanji = [];
        for (final row in rows) {
          if (row.read(minReadingRomajiLength) == cleanedText.length) {
            exactMatchKanji.add(row.readTable(db.kanjis));
          } else {
            otherKanji.add(row.readTable(db.kanjis));
          }
        }

        final readingResults =
            await _getAllFromBase(exactMatchKanji + otherKanji);

        // If one of the lists is empty, can simply return the non empty one
        if (meaningResults.isEmpty) return readingResults;
        if (readingResults.isEmpty) return meaningResults;

        // Simple merging order
        // - Exact match readings results
        // - All meaning results
        // - Remaining reading results
        return exactMatchKanji + meaningResults + otherKanji;
      }
    } else {
      // Japanese text, search by reading
      String queryText = _kanaKit.toHiragana('$cleanedText%');
      final searchReading = Subquery(
        db.select(db.kanjiReadings)
          ..where(
            (reading) => Expression.or([
              reading.reading.like(queryText),
              reading.readingSearchForm.like(queryText),
            ]),
          ),
        'search_reading',
      );

      final minReadingLength =
          searchReading.ref(db.kanjiReadings.reading).length.min();
      final query = db.select(db.kanjis).join([
        innerJoin(
          searchReading,
          searchReading.ref(db.kanjiReadings.kanjiId).equalsExp(db.kanjis.id),
          useColumns: false,
        ),
      ])
        ..addColumns([minReadingLength])
        ..orderBy([
          OrderingTerm.asc(minReadingLength),
          OrderingTerm.asc(db.kanjis.frequency, nulls: NullsOrder.last),
        ])
        ..groupBy([db.kanjis.id])
        ..limit(500);

      final kanjiList =
          await query.map((row) => row.readTable(db.kanjis)).get();

      return _getAllFromBase(kanjiList);
    }
  }

  Future<List<Kanji>> _searchByMeaning(
    String cleanedText,
    List<String> splits,
  ) async {
    final uniqueWords = splits.toSet().toList();

    late final List<Kanji> kanjiList;
    if (uniqueWords.length == 1) {
      // Create a subquery that finds words that start with the last word
      final searchMeaning = Subquery(
        db.select(db.kanjiMeaningWords)
          ..where((word) => word.word.like('${uniqueWords.last}%')),
        'search_meaning',
      );

      final minWordLength =
          searchMeaning.ref(db.kanjiMeaningWords.word).length.min();
      kanjiList = await (db.select(db.kanjis).join(
        [
          innerJoin(
            searchMeaning,
            searchMeaning
                .ref(db.kanjiMeaningWords.kanjiId)
                .equalsExp(db.kanjis.id),
            useColumns: false,
          ),
        ],
      )
            ..addColumns([minWordLength])
            ..orderBy([
              OrderingTerm.asc(minWordLength),
              OrderingTerm.asc(db.kanjis.frequency, nulls: NullsOrder.last),
            ])
            ..groupBy([db.kanjis.id])
            ..limit(500))
          .map((row) => row.readTable(db.kanjis))
          .get();
    } else {
      // Create a join that matches all but the last word and starts with for the last word
      // Then use having to exclude results that don't contain all words
      final wordsExceptLast = uniqueWords.sublist(0, uniqueWords.length - 1);
      final startsWithLastWord = '${uniqueWords.last}%';
      final minStartsWithLastWordLength = db.kanjiMeaningWords.word.length
          .min(filter: db.kanjiMeaningWords.word.like(startsWithLastWord));

      final unsortedKanjiList = await (db.select(db.kanjis).join([
        innerJoin(
          db.kanjiMeaningWords,
          db.kanjiMeaningWords.kanjiId.equalsExp(db.kanjis.id),
        ),
      ])
            ..addColumns([minStartsWithLastWordLength])
            ..orderBy([
              OrderingTerm.asc(
                minStartsWithLastWordLength,
                nulls: NullsOrder.last,
              ),
              OrderingTerm.asc(db.kanjis.frequency, nulls: NullsOrder.last),
            ])
            ..where(Expression.or([
              db.kanjiMeaningWords.word.isIn(wordsExceptLast),
              db.kanjiMeaningWords.word.like(startsWithLastWord),
            ]))
            ..groupBy(
              [db.kanjis.id],
              having: Expression.and([
                db.kanjiMeaningWords.word
                    .caseMatch(when: {
                      for (var w in wordsExceptLast) Variable(w): Variable(w)
                    })
                    .count(distinct: true)
                    .equals(wordsExceptLast.length),
                CaseWhenExpression(cases: [
                  CaseWhen(
                    db.kanjiMeaningWords.word.like(startsWithLastWord),
                    then: const Constant(0),
                  ),
                ]).count().isBiggerOrEqualValue(1),
              ]),
            )
            ..limit(500))
          .map((row) => row.readTable(db.kanjis))
          .get();

      // Sort exact matches of the search string to the top
      final regExp = RegExp(r'\b' + cleanedText, caseSensitive: false);

      final List<Kanji> exactMatchKanjiList = [];
      for (int i = 0; i < unsortedKanjiList.length; i++) {
        if (regExp.hasMatch(unsortedKanjiList[i].meaning!)) {
          exactMatchKanjiList.add(unsortedKanjiList.removeAt(i--));
        }
      }

      kanjiList = exactMatchKanjiList + unsortedKanjiList;
    }

    return _getAllFromBase(kanjiList);
  }
}
