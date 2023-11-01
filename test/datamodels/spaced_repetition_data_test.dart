import 'dart:convert';

import 'package:sagase_dictionary/src/datamodels/spaced_repetition_data.dart';
import 'package:test/test.dart';

void main() {
  group('SpacedRepetitionDataTest', () {
    test('copyWithInitialCorrectCount', () {
      var data = SpacedRepetitionData();
      expect(data.interval, 0);
      expect(data.repetitions, 0);
      expect(data.easeFactor, 2.5);
      expect(data.dueDate, null);
      expect(data.totalAnswers, 0);
      expect(data.totalWrongAnswers, 0);
      expect(data.initialCorrectCount, 0);

      data = data.copyWithInitialCorrectCount(1);
      expect(data.interval, 0);
      expect(data.repetitions, 0);
      expect(data.easeFactor, 2.5);
      expect(data.dueDate, null);
      expect(data.totalAnswers, 0);
      expect(data.totalWrongAnswers, 0);
      expect(data.initialCorrectCount, 1);

      data = data.copyWithInitialCorrectCount(-1);
      expect(data.initialCorrectCount, 0);
      data = data.copyWithInitialCorrectCount(-1);
      expect(data.initialCorrectCount, 0);
      data = data.copyWithInitialCorrectCount(1);
      data = data.copyWithInitialCorrectCount(1);
      expect(data.initialCorrectCount, 2);
    });

    test('Backup', () {
      var data = SpacedRepetitionData()
        ..interval = 1
        ..repetitions = 2
        ..easeFactor = 3
        ..dueDate = 2022
        ..totalAnswers = 5
        ..totalWrongAnswers = 4;

      String json = data.toBackupJson(vocabId: 10);
      expect(json, '''{
      "vocab_id": 10,
      "interval": 1,
      "repetitions": 2,
      "ease_factor": 3.0,
      "due_date": 2022,
      "total_answers": 5,
      "total_wrong_answers": 4
}''');
      String json2 = data.toBackupJson(kanjiId: 20);
      expect(json2, '''{
      "kanji_id": 20,
      "interval": 1,
      "repetitions": 2,
      "ease_factor": 3.0,
      "due_date": 2022,
      "total_answers": 5,
      "total_wrong_answers": 4
}''');

      data = SpacedRepetitionData.fromBackupJson(jsonDecode(json));
      expect(data.interval, 1);
      expect(data.repetitions, 2);
      expect(data.easeFactor, 3);
      expect(data.dueDate, 2022);
      expect(data.totalAnswers, 5);
      expect(data.totalWrongAnswers, 4);
    });
  });
}
