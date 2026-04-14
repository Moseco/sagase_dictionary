import 'package:drift/drift.dart';
import 'package:sagase_dictionary/sagase_dictionary.dart';

@UseRowClass(Grammar)
class Grammars extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get form => text()();
  TextColumn get meaning => text()();
  TextColumn get construction => text().nullable()();
  IntColumn get jlptLevel => integer()();
  TextColumn get content => text().nullable()();
  TextColumn get practice => text().nullable()();
}

class Grammar extends DictionaryItem {
  final String form;
  final String meaning;
  final String? construction;
  final int jlptLevel;
  final String? content;
  final String? practice;

  Grammar({
    required super.id,
    required this.form,
    required this.meaning,
    this.construction,
    required this.jlptLevel,
    this.content,
    this.practice,
  });

  @override
  DictionaryItemType get type => DictionaryItemType.grammar;
}
