import 'package:drift/drift.dart';
import 'package:sagase_dictionary/sagase_dictionary.dart';

@UseRowClass(Grammar)
class Grammars extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get form => text()();
  TextColumn get meaning => text()();
  IntColumn get jlptLevel => integer()();
  TextColumn get exampleJapanese => text()();
  TextColumn get exampleEnglish => text()();
}

class Grammar extends DictionaryItem {
  final String form;
  final String meaning;
  final int jlptLevel;
  final String exampleJapanese;
  final String exampleEnglish;

  Grammar({
    required super.id,
    required this.form,
    required this.meaning,
    required this.jlptLevel,
    required this.exampleJapanese,
    required this.exampleEnglish,
  });

  @override
  DictionaryItemType get type => DictionaryItemType.grammar;
}
