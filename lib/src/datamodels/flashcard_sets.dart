import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:sagase_dictionary/src/database.dart';
import 'package:sagase_dictionary/src/utils/constants.dart';
import 'package:sagase_dictionary/src/utils/converters.dart';
import 'package:sagase_dictionary/src/utils/enums.dart';

@UseRowClass(FlashcardSet)
class FlashcardSets extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text()();
  BoolColumn get usingSpacedRepetition =>
      boolean().withDefault(const Constant(true))();
  IntColumn get frontType =>
      intEnum<FrontType>().withDefault(Variable(FrontType.japanese.index))();
  BoolColumn get vocabShowReading =>
      boolean().withDefault(const Constant(false))();
  BoolColumn get vocabShowReadingIfRareKanji =>
      boolean().withDefault(const Constant(true))();
  BoolColumn get vocabShowAlternatives =>
      boolean().withDefault(const Constant(false))();
  BoolColumn get vocabShowPitchAccent =>
      boolean().withDefault(const Constant(false))();
  BoolColumn get kanjiShowReading =>
      boolean().withDefault(const Constant(false))();
  BoolColumn get vocabShowPartsOfSpeech =>
      boolean().withDefault(const Constant(false))();
  DateTimeColumn get timestamp => dateTime().withDefault(currentDateAndTime)();

  TextColumn get predefinedDictionaryLists =>
      text().map(const IntListConverter()).withDefault(const Constant('[]'))();
  TextColumn get myDictionaryLists =>
      text().map(const IntListConverter()).withDefault(const Constant('[]'))();

  IntColumn get streak => integer().withDefault(const Constant(0))();
}

class FlashcardSet implements Insertable<FlashcardSet> {
  final int id;
  String name;
  bool usingSpacedRepetition;
  FrontType frontType;
  bool vocabShowReading;
  bool vocabShowReadingIfRareKanji;
  bool vocabShowAlternatives;
  bool vocabShowPitchAccent;
  bool kanjiShowReading;
  bool vocabShowPartsOfSpeech;
  DateTime timestamp;

  List<int> predefinedDictionaryLists;
  List<int> myDictionaryLists;

  int streak;

  FlashcardSet({
    required this.id,
    required this.name,
    required this.usingSpacedRepetition,
    required this.frontType,
    required this.vocabShowReading,
    required this.vocabShowReadingIfRareKanji,
    required this.vocabShowAlternatives,
    required this.vocabShowPitchAccent,
    required this.kanjiShowReading,
    required this.vocabShowPartsOfSpeech,
    required this.timestamp,
    required this.predefinedDictionaryLists,
    required this.myDictionaryLists,
    required this.streak,
  });

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    return FlashcardSetsCompanion(
      id: Value(id),
      name: Value.absentIfNull(name),
      usingSpacedRepetition: Value.absentIfNull(usingSpacedRepetition),
      frontType: Value.absentIfNull(frontType),
      vocabShowReading: Value.absentIfNull(vocabShowReading),
      vocabShowReadingIfRareKanji:
          Value.absentIfNull(vocabShowReadingIfRareKanji),
      vocabShowAlternatives: Value.absentIfNull(vocabShowAlternatives),
      vocabShowPitchAccent: Value.absentIfNull(vocabShowPitchAccent),
      kanjiShowReading: Value.absentIfNull(kanjiShowReading),
      vocabShowPartsOfSpeech: Value.absentIfNull(vocabShowPartsOfSpeech),
      timestamp: Value.absentIfNull(timestamp),
      predefinedDictionaryLists: Value.absentIfNull(predefinedDictionaryLists),
      myDictionaryLists: Value.absentIfNull(myDictionaryLists),
      streak: Value(streak),
    ).toColumns(nullToAbsent);
  }

  String toBackupJson() {
    return jsonEncode(
      {
        SagaseDictionaryConstants.backupFlashcardSetId: id,
        SagaseDictionaryConstants.backupFlashcardSetName: name,
        SagaseDictionaryConstants.backupFlashcardSetUsingSpacedRepetition:
            usingSpacedRepetition,
        SagaseDictionaryConstants.backupFlashcardSetFrontType: frontType.index,
        SagaseDictionaryConstants.backupFlashcardSetVocabShowReading:
            vocabShowReading,
        SagaseDictionaryConstants.backupFlashcardSetVocabShowReadingIfRareKanji:
            vocabShowReadingIfRareKanji,
        SagaseDictionaryConstants.backupFlashcardSetVocabShowAlternatives:
            vocabShowAlternatives,
        SagaseDictionaryConstants.backupFlashcardSetVocabShowPitchAccent:
            vocabShowPitchAccent,
        SagaseDictionaryConstants.backupFlashcardSetKanjiShowReading:
            kanjiShowReading,
        SagaseDictionaryConstants.backupFlashcardSetVocabShowPartsOfSpeech:
            vocabShowPartsOfSpeech,
        SagaseDictionaryConstants.backupFlashcardSetTimestamp:
            timestamp.millisecondsSinceEpoch,
        SagaseDictionaryConstants.backupFlashcardSetPredefinedDictionaryLists:
            predefinedDictionaryLists,
        SagaseDictionaryConstants.backupFlashcardSetMyDictionaryLists:
            myDictionaryLists,
        SagaseDictionaryConstants.backupFlashcardSetStreak: streak,
      },
    );
  }

  static FlashcardSet fromBackupJson(String json) {
    final map = jsonDecode(json);
    return FlashcardSet(
      id: map[SagaseDictionaryConstants.backupFlashcardSetId],
      name: map[SagaseDictionaryConstants.backupFlashcardSetName],
      usingSpacedRepetition: map[
          SagaseDictionaryConstants.backupFlashcardSetUsingSpacedRepetition],
      frontType: FrontType
          .values[map[SagaseDictionaryConstants.backupFlashcardSetFrontType]],
      vocabShowReading:
          map[SagaseDictionaryConstants.backupFlashcardSetVocabShowReading],
      vocabShowReadingIfRareKanji: map[SagaseDictionaryConstants
          .backupFlashcardSetVocabShowReadingIfRareKanji],
      vocabShowAlternatives: map[
          SagaseDictionaryConstants.backupFlashcardSetVocabShowAlternatives],
      vocabShowPitchAccent:
          map[SagaseDictionaryConstants.backupFlashcardSetVocabShowPitchAccent],
      kanjiShowReading:
          map[SagaseDictionaryConstants.backupFlashcardSetKanjiShowReading],
      vocabShowPartsOfSpeech: map[
          SagaseDictionaryConstants.backupFlashcardSetVocabShowPartsOfSpeech],
      timestamp: DateTime.fromMillisecondsSinceEpoch(
          map[SagaseDictionaryConstants.backupFlashcardSetTimestamp]),
      predefinedDictionaryLists: map[SagaseDictionaryConstants
              .backupFlashcardSetPredefinedDictionaryLists]
          .cast<int>(),
      myDictionaryLists:
          map[SagaseDictionaryConstants.backupFlashcardSetMyDictionaryLists]
              .cast<int>(),
      streak:
          map[SagaseDictionaryConstants.backupFlashcardSetStreak] as int? ?? 0,
    );
  }
}

@UseRowClass(FlashcardSetReport)
@TableIndex(
  name: 'UX_flashcard_set_reports_flashcard_set_id_and_date',
  columns: {#flashcardSetId, #date},
  unique: true,
)
class FlashcardSetReports extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get flashcardSetId => integer()();
  IntColumn get date => integer()();

  IntColumn get dueFlashcardsCompleted =>
      integer().withDefault(const Constant(0))();
  IntColumn get dueFlashcardsGotWrong =>
      integer().withDefault(const Constant(0))();
  IntColumn get newFlashcardsCompleted =>
      integer().withDefault(const Constant(0))();
}

class FlashcardSetReport implements Insertable<FlashcardSetReport> {
  final int id;
  final int flashcardSetId;
  final int date;
  int dueFlashcardsCompleted;
  int dueFlashcardsGotWrong;
  int newFlashcardsCompleted;

  FlashcardSetReport({
    required this.id,
    required this.flashcardSetId,
    required this.date,
    required this.dueFlashcardsCompleted,
    required this.dueFlashcardsGotWrong,
    required this.newFlashcardsCompleted,
  });

  @override
  Map<String, Expression<Object>> toColumns(bool nullToAbsent) {
    return FlashcardSetReportsCompanion(
      id: Value(id),
      flashcardSetId: Value(flashcardSetId),
      date: Value(date),
      dueFlashcardsCompleted: Value(dueFlashcardsCompleted),
      dueFlashcardsGotWrong: Value(dueFlashcardsGotWrong),
      newFlashcardsCompleted: Value(newFlashcardsCompleted),
    ).toColumns(nullToAbsent);
  }

  String toBackupJson() {
    return jsonEncode(
      {
        SagaseDictionaryConstants.backupFlashcardSetReportId: id,
        SagaseDictionaryConstants.backupFlashcardSetReportFlashcardSetId:
            flashcardSetId,
        SagaseDictionaryConstants.backupFlashcardSetReportDate: date,
        SagaseDictionaryConstants
                .backupFlashcardSetReportDueFlashcardsCompleted:
            dueFlashcardsCompleted,
        SagaseDictionaryConstants.backupFlashcardSetReportDueFlashcardsGotWrong:
            dueFlashcardsGotWrong,
        SagaseDictionaryConstants
                .backupFlashcardSetReportNewFlashcardsCompleted:
            newFlashcardsCompleted,
      },
    );
  }

  static FlashcardSetReport fromBackupJson(String json) {
    final map = jsonDecode(json);
    return FlashcardSetReport(
      id: map[SagaseDictionaryConstants.backupFlashcardSetReportId],
      flashcardSetId:
          map[SagaseDictionaryConstants.backupFlashcardSetReportFlashcardSetId],
      date: map[SagaseDictionaryConstants.backupFlashcardSetReportDate],
      dueFlashcardsCompleted: map[SagaseDictionaryConstants
          .backupFlashcardSetReportDueFlashcardsCompleted],
      dueFlashcardsGotWrong: map[SagaseDictionaryConstants
          .backupFlashcardSetReportDueFlashcardsGotWrong],
      newFlashcardsCompleted: map[SagaseDictionaryConstants
          .backupFlashcardSetReportNewFlashcardsCompleted],
    );
  }
}
