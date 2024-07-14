abstract class DictionaryList {
  final int id;
  final String name;
  final List<int> vocab;
  final List<int> kanji;

  const DictionaryList({
    required this.id,
    required this.name,
    required this.vocab,
    required this.kanji,
  });
}
