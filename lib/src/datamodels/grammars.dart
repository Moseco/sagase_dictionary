import 'package:drift/drift.dart';
import 'package:sagase_dictionary/sagase_dictionary.dart';

@UseRowClass(Grammar)
class Grammars extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get form => text()();
  TextColumn get meaning => text()();
  IntColumn get jlptLevel => integer()();
}

class Grammar extends DictionaryItem {
  final String form;
  final String meaning;
  final int jlptLevel;

  Grammar({
    required super.id,
    required this.form,
    required this.meaning,
    required this.jlptLevel,
  });

  @override
  DictionaryItemType get type => DictionaryItemType.grammar;
}
