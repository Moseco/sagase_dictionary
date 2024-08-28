import 'package:drift/drift.dart';
import 'package:kana_kit/kana_kit.dart';
import 'package:sagase_dictionary/src/database.dart';
import 'package:sagase_dictionary/src/datamodels/proper_nouns.dart';
import 'package:sagase_dictionary/src/utils/string_utils.dart';

part 'proper_nouns_dao.g.dart';

@DriftAccessor(tables: [ProperNouns])
class ProperNounsDao extends DatabaseAccessor<AppDatabase>
    with _$ProperNounsDaoMixin {
  final _kanaKit = const KanaKit().copyWithConfig(passRomaji: true);

  ProperNounsDao(super.db);

  Future<void> importProperNouns(String path) async {
    await db.customStatement('ATTACH DATABASE ? AS proper_noun_db', [path]);
    await db.transaction(() async {
      await db.customStatement(
        'INSERT INTO ${db.properNouns.actualTableName} SELECT * FROM proper_noun_db.${db.properNouns.actualTableName}',
      );
      await db.customStatement(
        'INSERT INTO ${db.properNounRomajiWords.actualTableName} SELECT * FROM proper_noun_db.${db.properNounRomajiWords.actualTableName}',
      );
    });
    await db.customStatement('DETACH DATABASE proper_noun_db');
  }

  Future<void> deleteProperNouns() async {
    await db.delete(db.properNouns).go();
    await db.delete(db.properNounRomajiWords).go();
  }

  Future<List<ProperNoun>> getByWriting(String text) async {
    return (db.select(db.properNouns)
          ..where(
            (properNoun) => Expression.or([
              properNoun.writing.equals(text),
              properNoun.writingSearchForm.equals(
                  _kanaKit.toHiragana(text.toLowerCase().romajiToHalfWidth())),
            ]),
          ))
        .get();
  }

  Future<List<ProperNoun>> getByReading(String text) async {
    return (db.select(db.properNouns)
          ..where((properNoun) => Expression.or([
                properNoun.reading.equals(text),
                properNoun.readingSearchForm.equals(_kanaKit.toHiragana(text)),
              ])))
        .get();
  }

  Future<List<ProperNoun>> getByWritingAndReading(
    String writing,
    String reading,
  ) {
    return (db.select(db.properNouns)
          ..where((properNoun) => Expression.and([
                Expression.or([
                  properNoun.writing.equals(writing),
                  properNoun.writingSearchForm.equals(_kanaKit
                      .toHiragana(writing.toLowerCase().romajiToHalfWidth())),
                ]),
                Expression.or([
                  properNoun.reading.equals(reading),
                  properNoun.readingSearchForm
                      .equals(_kanaKit.toHiragana(reading)),
                ]),
              ])))
        .get();
  }

  Future<List<ProperNoun>> search(String text) async {
    final cleanedText = RegExp.escape(text).toLowerCase().removeDiacritics();

    if (_kanaKit.isRomaji(cleanedText)) {
      // Romaji
      final splits = cleanedText.splitWords();

      if (splits.length == 1) {
        final lengthColumn = db.properNouns.romaji.length.iif(
          db.properNouns.romaji.collate(Collate.noCase).like('$cleanedText%'),
          db.properNouns.readingRomaji.length,
        );

        return (db.select(db.properNouns).join([
          leftOuterJoin(
            db.properNounRomajiWords,
            db.properNounRomajiWords.properNounId.equalsExp(db.properNouns.id),
          )
        ])
              ..where(Expression.or([
                db.properNounRomajiWords.word.like('$cleanedText%'),
                db.properNouns.readingRomaji.like('$cleanedText%'),
                db.properNouns.readingRomajiSimplified.like('$cleanedText%'),
                db.properNouns.romaji
                    .collate(Collate.noCase)
                    .like('$cleanedText%'),
              ]))
              ..orderBy([OrderingTerm.asc(lengthColumn)])
              ..groupBy([db.properNouns.id])
              ..limit(500))
            .map((row) => row.readTable(db.properNouns))
            .get();
      } else {
        // Create a join that matches all but the last word and starts with for the last word
        // Then use having to exclude results that don't contain all words
        final uniqueWords = splits.toSet().toList();
        // Last word in splits might match another word so make sure to separate words correctly
        late final List<String> wordsExceptLast;
        if (splits.where((e) => e == splits.last).length > 1) {
          wordsExceptLast = uniqueWords;
        } else {
          wordsExceptLast = uniqueWords.sublist(0, uniqueWords.length - 1);
        }
        final startsWithLastWord = '${splits.last}%';
        final minStartsWithLastWordLength = db.properNounRomajiWords.word.length
            .min(
                filter: db.properNounRomajiWords.word.like(startsWithLastWord));

        return (db.select(db.properNouns).join([
          innerJoin(
            db.properNounRomajiWords,
            db.properNounRomajiWords.properNounId.equalsExp(db.properNouns.id),
          ),
        ])
              ..addColumns([minStartsWithLastWordLength])
              ..where(Expression.or([
                db.properNounRomajiWords.word.isIn(wordsExceptLast),
                db.properNounRomajiWords.word.like(startsWithLastWord),
              ]))
              ..orderBy([
                OrderingTerm.asc(
                  minStartsWithLastWordLength,
                  nulls: NullsOrder.last,
                ),
              ])
              ..groupBy(
                [db.properNouns.id],
                having: Expression.and([
                  db.properNounRomajiWords.word
                      .caseMatch(when: {
                        for (var w in wordsExceptLast) Variable(w): Variable(w)
                      })
                      .count(distinct: true)
                      .equals(wordsExceptLast.length),
                  CaseWhenExpression(cases: [
                    CaseWhen(
                      db.properNounRomajiWords.word.like(startsWithLastWord),
                      then: const Constant(0),
                    ),
                  ]).count().isBiggerOrEqualValue(1),
                ]),
              )
              ..limit(500))
            .map((row) => row.readTable(db.properNouns))
            .get();
      }
    } else {
      // Japanese text
      if (_kanaKit.isKana(cleanedText)) {
        // Search by reading
        return (db.select(db.properNouns)
              ..where((properNoun) => Expression.or([
                    properNoun.reading.like('$cleanedText%'),
                    properNoun.readingSearchForm
                        .like(_kanaKit.toHiragana('$cleanedText%')),
                  ]))
              ..orderBy([
                (properNoun) => OrderingTerm.asc(properNoun.reading.length),
              ])
              ..limit(500))
            .get();
      } else {
        // Search by writing
        return (db.select(db.properNouns)
              ..where((properNoun) => Expression.or([
                    properNoun.writing.like('$cleanedText%'),
                    properNoun.writingSearchForm.like(_kanaKit.toHiragana(
                        '$cleanedText%'.toLowerCase().romajiToHalfWidth())),
                  ]))
              ..orderBy([
                (properNoun) => OrderingTerm.asc(properNoun.writing.length),
                (properNoun) => OrderingTerm.asc(properNoun.reading.length),
              ])
              ..limit(500))
            .get();
      }
    }
  }
}
