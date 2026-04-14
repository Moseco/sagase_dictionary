abstract class DictionaryList {
  final int id;
  final String name;
  final List<int> vocab;
  final List<int> kanji;
  final List<int> grammar;

  const DictionaryList({
    required this.id,
    required this.name,
    required this.vocab,
    required this.kanji,
    required this.grammar,
  });
}
