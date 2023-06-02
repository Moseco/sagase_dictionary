import 'package:isar/isar.dart';
import 'package:sagase_dictionary/src/datamodels/kanji.dart';

part 'kanji_radical.g.dart';

@collection
class KanjiRadical {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  late String radical;

  int? kangxiId;

  late int strokeCount;
  late String meaning;
  late String reading;
  @enumerated
  late KanjiRadicalPosition position;
  @enumerated
  late KanjiRadicalImportance importance;
  List<String>? strokes;

  List<String>? variants;
  String? variantOf;

  @Backlink(to: 'radical')
  final kanjiWithRadical = IsarLinks<Kanji>();
}

enum KanjiRadicalImportance {
  top25,
  top50,
  top75,
  none,
}

enum KanjiRadicalPosition {
  top,
  left,
  right,
  bottom,
  enclose,
  topLeft,
  bottomLeft,
  none,
}
