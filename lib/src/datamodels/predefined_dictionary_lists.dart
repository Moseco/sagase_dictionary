import 'package:drift/drift.dart';
import 'package:sagase_dictionary/src/datamodels/dictionary_list.dart';
import 'package:sagase_dictionary/src/utils/converters.dart';

@UseRowClass(PredefinedDictionaryList)
class PredefinedDictionaryLists extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text().check(name.length.isBiggerThan(Constant(0)))();

  TextColumn get vocab => text().map(const IntListConverter())();
  TextColumn get kanji => text().map(const IntListConverter())();
}

class PredefinedDictionaryList extends DictionaryList {
  PredefinedDictionaryList({
    required super.id,
    required super.name,
    required super.vocab,
    required super.kanji,
  });
}
