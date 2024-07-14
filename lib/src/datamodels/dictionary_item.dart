import 'package:sagase_dictionary/src/datamodels/spaced_repetition_datas.dart';

abstract class DictionaryItem {
  final int id;
  List<DictionaryItem>? similarFlashcards;
  // We only need 1 type of spaced repetition data at a time
  // So we can have one variable instead of splitting it by type
  SpacedRepetitionData? spacedRepetitionData;

  DictionaryItem({required this.id});
}
