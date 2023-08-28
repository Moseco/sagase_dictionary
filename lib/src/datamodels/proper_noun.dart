import 'package:isar/isar.dart';

part 'proper_noun.g.dart';

@collection
class ProperNoun {
  Id id = Isar.autoIncrement;

  @Index(type: IndexType.value)
  late String writing;
  @Index(type: IndexType.value)
  String? reading;
  @Index(type: IndexType.value)
  late String romaji;
  @enumerated
  late List<ProperNounType> types;
}

enum ProperNounType {
  surname,
  placeName,
  personName,
  givenName,
  femaleName,
  maleName,
  fullName,
  product,
  company,
  organization,
  station,
  workOfArt,
  group,
  object,
  service,
  character,
  legend,
  creature,
  event,
  myth,
  fiction,
  deity,
  ship,
  document,
  religion,
  unknown,
}
