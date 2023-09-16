import 'package:isar/isar.dart';
import 'package:sagase_dictionary/src/datamodels/spaced_repetition_data.dart';

abstract class DictionaryItem {
  late Id id;

  SpacedRepetitionData? spacedRepetitionData;
  SpacedRepetitionData? spacedRepetitionDataEnglish;

  @ignore
  List<DictionaryItem>? similarFlashcards;
}
