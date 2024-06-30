import 'dart:convert';

import 'package:sagase_dictionary/src/datamodels/spaced_repetition_datas.dart';
import 'package:sagase_dictionary/src/utils/enums.dart';
import 'package:test/test.dart';

void main() {
  group('SpacedRepetitionDataTest', () {
    test('toBackupJson and fromBackupJson', () {
      final data = SpacedRepetitionData(
        vocabId: 1,
        kanjiId: 0,
        frontType: FrontType.japanese,
        interval: 1,
        repetitions: 2,
        easeFactor: 3,
        dueDate: 2022,
        totalAnswers: 5,
        totalWrongAnswers: 4,
      );

      // Backup and import
      final newData = SpacedRepetitionData.fromBackupJson(
        jsonDecode(data.toBackupJson()),
        vocabId: data.vocabId,
        kanjiId: data.kanjiId,
        frontType: data.frontType,
      );

      expect(newData.vocabId, 1);
      expect(newData.kanjiId, 0);
      expect(newData.frontType, FrontType.japanese);
      expect(newData.interval, 1);
      expect(newData.repetitions, 2);
      expect(newData.easeFactor, 3);
      expect(newData.dueDate, 2022);
      expect(newData.totalAnswers, 5);
      expect(newData.totalWrongAnswers, 4);
    });
  });
}
