import 'package:sagase_dictionary/src/utils/enums.dart';

extension PartOfSpeechExtension on PartOfSpeech {
  // Checks if pos is within the range of verbs
  bool isVerb() =>
      index >= PartOfSpeech.verb.index &&
      index <= PartOfSpeech.verbIchidanZuru.index;
}
