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
            myDictionaryLists
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
    );
  }
}

@UseRowClass(FlashcardSetLog)
@TableIndex(
  name: 'IX_flashcard_set_logs_flashcard_set_id',
  columns: {#flashcardSetId},
)
@TableIndex(name: 'IX_flashcard_set_logs_date', columns: {#date})
@TableIndex(
  name: 'UX_flashcard_set_logs_flashcard_set_id_and_date',
  columns: {#flashcardSetId, #date},
  unique: true,
)
class FlashcardSetLogs extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get flashcardSetId => integer()();
  IntColumn get date => integer()();

  IntColumn get flashcardsCompleted =>
      integer().withDefault(const Constant(0))();
  IntColumn get flashcardsGotWrong =>
      integer().withDefault(const Constant(0))();
  IntColumn get newFlashcardsCompleted =>
      integer().withDefault(const Constant(0))();
}

class FlashcardSetLog implements Insertable<FlashcardSetLog> {
  final int id;
  final int flashcardSetId;
  final int date;
  int flashcardsCompleted;
  int flashcardsGotWrong;
  int newFlashcardsCompleted;

  FlashcardSetLog({
    required this.id,
    required this.flashcardSetId,
    required this.date,
    required this.flashcardsCompleted,
    required this.flashcardsGotWrong,
    required this.newFlashcardsCompleted,
  });

  @override
  Map<String, Expression<Object>> toColumns(bool nullToAbsent) {
    return FlashcardSetLogsCompanion(
      id: Value(id),
      flashcardSetId: Value(flashcardSetId),
      date: Value(date),
      flashcardsCompleted: Value(flashcardsCompleted),
      flashcardsGotWrong: Value(flashcardsGotWrong),
      newFlashcardsCompleted: Value(newFlashcardsCompleted),
    ).toColumns(nullToAbsent);
  }

  String toBackupJson() {
    return jsonEncode(
      {
        SagaseDictionaryConstants.backupFlashcardSetLogId: id,
        SagaseDictionaryConstants.backupFlashcardSetLogFlashcardSetId:
            flashcardSetId,
        SagaseDictionaryConstants.backupFlashcardSetLogDate: date,
        SagaseDictionaryConstants.backupFlashcardSetLogFlashcardsCompleted:
            flashcardsCompleted,
        SagaseDictionaryConstants.backupFlashcardSetLogFlashcardsGotWrong:
            flashcardsGotWrong,
        SagaseDictionaryConstants.backupFlashcardSetLogNewFlashcardsCompleted:
            newFlashcardsCompleted,
      },
    );
  }

  static FlashcardSetLog fromBackupJson(String json) {
    final map = jsonDecode(json);
    return FlashcardSetLog(
      id: map[SagaseDictionaryConstants.backupFlashcardSetLogId],
      flashcardSetId:
          map[SagaseDictionaryConstants.backupFlashcardSetLogFlashcardSetId],
      date: map[SagaseDictionaryConstants.backupFlashcardSetLogDate],
      flashcardsCompleted: map[
          SagaseDictionaryConstants.backupFlashcardSetLogFlashcardsCompleted],
      flashcardsGotWrong: map[
          SagaseDictionaryConstants.backupFlashcardSetLogFlashcardsGotWrong],
      newFlashcardsCompleted: map[SagaseDictionaryConstants
          .backupFlashcardSetLogNewFlashcardsCompleted],
    );
  }
}
