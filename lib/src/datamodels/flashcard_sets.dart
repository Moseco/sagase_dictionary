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

  IntColumn get flashcardsCompletedToday =>
      integer().withDefault(const Constant(0))();
  IntColumn get newFlashcardsCompletedToday =>
      integer().withDefault(const Constant(0))();

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

  int flashcardsCompletedToday;
  int newFlashcardsCompletedToday;

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
    required this.flashcardsCompletedToday,
    required this.newFlashcardsCompletedToday,
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
      flashcardsCompletedToday: Value.absentIfNull(flashcardsCompletedToday),
      newFlashcardsCompletedToday:
          Value.absentIfNull(newFlashcardsCompletedToday),
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
        SagaseDictionaryConstants.backupFlashcardSetFlashcardsCompletedToday:
            flashcardsCompletedToday,
        SagaseDictionaryConstants.backupFlashcardSetNewFlashcardsCompletedToday:
            newFlashcardsCompletedToday,
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
      flashcardsCompletedToday: map[
          SagaseDictionaryConstants.backupFlashcardSetFlashcardsCompletedToday],
      newFlashcardsCompletedToday: map[SagaseDictionaryConstants
          .backupFlashcardSetNewFlashcardsCompletedToday],
      predefinedDictionaryLists: map[SagaseDictionaryConstants
              .backupFlashcardSetPredefinedDictionaryLists]
          .cast<int>(),
      myDictionaryLists:
          map[SagaseDictionaryConstants.backupFlashcardSetMyDictionaryLists]
              .cast<int>(),
    );
  }
}
