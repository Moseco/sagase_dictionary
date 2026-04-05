import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:sagase_dictionary/src/database.dart';
import 'package:sagase_dictionary/src/datamodels/dictionary_item.dart';
import 'package:sagase_dictionary/src/utils/constants.dart';
import 'package:sagase_dictionary/src/utils/enums.dart';

@UseRowClass(SpacedRepetitionData)
class SpacedRepetitionDatas extends Table {
  IntColumn get itemId => integer()();
  IntColumn get itemType => intEnum<DictionaryItemType>()();
  IntColumn get frontType => intEnum<FrontType>()();

  IntColumn get interval => integer()();
  IntColumn get repetitions => integer()();
  RealColumn get easeFactor => real()();
  IntColumn get dueDate => integer().nullable()();

  IntColumn get totalAnswers => integer()();
  IntColumn get totalWrongAnswers => integer()();

  @override
  Set<Column> get primaryKey => {itemId, itemType, frontType};

  @override
  bool get withoutRowId => true;
}

class SpacedRepetitionData implements Insertable<SpacedRepetitionData> {
  final int itemId;
  final DictionaryItemType itemType;
  final FrontType frontType;

  final int interval;
  final int repetitions;
  final double easeFactor;
  final int? dueDate;

  final int totalAnswers;
  final int totalWrongAnswers;
  double get wrongAnswerRate => totalWrongAnswers / totalAnswers;

  final int initialCorrectCount;

  SpacedRepetitionData({
    required this.itemId,
    required this.itemType,
    required this.frontType,
    required this.interval,
    required this.repetitions,
    required this.easeFactor,
    required this.dueDate,
    required this.totalAnswers,
    required this.totalWrongAnswers,
    this.initialCorrectCount = 0,
  });

  SpacedRepetitionData.initial({
    required DictionaryItem dictionaryItem,
    required this.frontType,
  })  : itemId = dictionaryItem.id,
        itemType = dictionaryItem.type,
        interval = 0,
        repetitions = 0,
        easeFactor = 2.5,
        dueDate = null,
        totalAnswers = 0,
        totalWrongAnswers = 0,
        initialCorrectCount = 0;

  SpacedRepetitionData copyWith({
    int? itemId,
    DictionaryItemType? itemType,
    FrontType? frontType,
    int? interval,
    int? repetitions,
    double? easeFactor,
    int? dueDate,
    int? totalAnswers,
    int? totalWrongAnswers,
    int? initialCorrectCount,
  }) {
    return SpacedRepetitionData(
      itemId: itemId ?? this.itemId,
      itemType: itemType ?? this.itemType,
      frontType: frontType ?? this.frontType,
      interval: interval ?? this.interval,
      repetitions: repetitions ?? this.repetitions,
      easeFactor: easeFactor ?? this.easeFactor,
      dueDate: dueDate ?? this.dueDate,
      totalAnswers: totalAnswers ?? this.totalAnswers,
      totalWrongAnswers: totalWrongAnswers ?? this.totalWrongAnswers,
      initialCorrectCount: initialCorrectCount ?? this.initialCorrectCount,
    );
  }

  String toBackupJson() {
    return jsonEncode(
      {
        SagaseDictionaryConstants.backupSpacedRepetitionDataItemId: itemId,
        SagaseDictionaryConstants.backupSpacedRepetitionDataItemType:
            itemType.index,
        SagaseDictionaryConstants.backupSpacedRepetitionDataFrontType:
            frontType.index,
        SagaseDictionaryConstants.backupSpacedRepetitionDataInterval: interval,
        SagaseDictionaryConstants.backupSpacedRepetitionDataRepetitions:
            repetitions,
        SagaseDictionaryConstants.backupSpacedRepetitionDataEaseFactor:
            easeFactor,
        SagaseDictionaryConstants.backupSpacedRepetitionDataDueDate: dueDate,
        SagaseDictionaryConstants.backupSpacedRepetitionDataTotalAnswers:
            totalAnswers,
        SagaseDictionaryConstants.backupSpacedRepetitionDataTotalWrongAnswers:
            totalWrongAnswers
      },
    );
  }

  static SpacedRepetitionData fromBackupJson(Map<String, dynamic> map) {
    return SpacedRepetitionData(
      itemId: map[SagaseDictionaryConstants.backupSpacedRepetitionDataItemId],
      itemType: DictionaryItemType.values[
          map[SagaseDictionaryConstants.backupSpacedRepetitionDataItemType]],
      frontType: FrontType.values[
          map[SagaseDictionaryConstants.backupSpacedRepetitionDataFrontType]],
      interval:
          map[SagaseDictionaryConstants.backupSpacedRepetitionDataInterval],
      repetitions:
          map[SagaseDictionaryConstants.backupSpacedRepetitionDataRepetitions],
      easeFactor:
          map[SagaseDictionaryConstants.backupSpacedRepetitionDataEaseFactor],
      dueDate: map[SagaseDictionaryConstants.backupSpacedRepetitionDataDueDate],
      totalAnswers:
          map[SagaseDictionaryConstants.backupSpacedRepetitionDataTotalAnswers],
      totalWrongAnswers: map[SagaseDictionaryConstants
          .backupSpacedRepetitionDataTotalWrongAnswers],
    );
  }

  static SpacedRepetitionData fromBackupJsonOld(
    Map<String, dynamic> map,
    int itemId,
    DictionaryItemType itemType,
    FrontType frontType,
  ) {
    return SpacedRepetitionData(
      itemId: itemId,
      itemType: itemType,
      frontType: frontType,
      interval:
          map[SagaseDictionaryConstants.backupSpacedRepetitionDataInterval],
      repetitions:
          map[SagaseDictionaryConstants.backupSpacedRepetitionDataRepetitions],
      easeFactor:
          map[SagaseDictionaryConstants.backupSpacedRepetitionDataEaseFactor],
      dueDate: map[SagaseDictionaryConstants.backupSpacedRepetitionDataDueDate],
      totalAnswers:
          map[SagaseDictionaryConstants.backupSpacedRepetitionDataTotalAnswers],
      totalWrongAnswers: map[SagaseDictionaryConstants
          .backupSpacedRepetitionDataTotalWrongAnswers],
    );
  }

  @override
  Map<String, Expression<Object>> toColumns(bool nullToAbsent) {
    return SpacedRepetitionDatasCompanion(
      itemId: Value(itemId),
      itemType: Value(itemType),
      frontType: Value(frontType),
      interval: Value(interval),
      repetitions: Value(repetitions),
      easeFactor: Value(easeFactor),
      dueDate: Value.absentIfNull(dueDate),
      totalAnswers: Value(totalAnswers),
      totalWrongAnswers: Value(totalWrongAnswers),
    ).toColumns(nullToAbsent);
  }
}
