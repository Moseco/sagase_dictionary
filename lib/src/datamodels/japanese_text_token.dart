import 'package:sagase_dictionary/src/datamodels/dictionary_item.dart';
import 'package:sagase_dictionary/src/utils/enums.dart';

class JapaneseTextToken {
  final String original;
  final String base;
  final String baseReading;
  final List<RubyTextPair> rubyTextPairs;
  List<JapaneseTextToken>? trailing;
  PartOfSpeech? pos;
  List<DictionaryItem>? associatedDictionaryItems;

  JapaneseTextToken({
    required this.original,
    required this.base,
    required this.baseReading,
    required this.rubyTextPairs,
    this.trailing,
    this.pos,
    this.associatedDictionaryItems,
  });
}

class RubyTextPair {
  final String writing;
  final String? reading;

  const RubyTextPair({required this.writing, this.reading});
}
