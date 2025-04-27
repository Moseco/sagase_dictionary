import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:sagase_dictionary/src/database.dart';
import 'package:sagase_dictionary/src/datamodels/dictionary_item.dart';
import 'package:sagase_dictionary/src/datamodels/kanjis.dart';
import 'package:sagase_dictionary/src/datamodels/japanese_text_token.dart';
import 'package:sagase_dictionary/src/utils/converters.dart';
import 'package:sagase_dictionary/src/utils/enums.dart';

@UseRowClass(Vocab)
class Vocabs extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get pos => text().map(const PartOfSpeechConverter()).nullable()();

  BoolColumn get common => boolean().withDefault(const Constant(false))();

  IntColumn get frequencyScore => integer().withDefault(const Constant(0))();
}

class Vocab extends DictionaryItem {
  final List<PartOfSpeech>? pos;
  final bool common;
  final int frequencyScore;

  List<VocabWriting>? writings;
  late List<VocabReading> readings;
  late List<VocabDefinition> definitions;
  String? note;

  List<Kanji>? includedKanji;

  Vocab({
    required super.id,
    required this.pos,
    required this.common,
    required this.frequencyScore,
  });

  bool isUsuallyKanaAlone() {
    if (definitions[0].miscInfo == null) return false;
    return definitions[0]
        .miscInfo!
        .contains(MiscellaneousInfo.usuallyKanaAlone);
  }
}

@TableIndex(name: 'IX_vocab_writings_vocab_id', columns: {#vocabId})
@TableIndex(name: 'IX_vocab_writings_writing', columns: {#writing})
class VocabWritings extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get vocabId => integer()();

  TextColumn get writing => text()();
  TextColumn get writingSearchForm => text().nullable()();
  TextColumn get info => text().map(const WritingInfoConverter()).nullable()();

  BoolColumn get primaryPair => boolean().withDefault(const Constant(false))();
}

@TableIndex(name: 'IX_vocab_readings_vocab_id', columns: {#vocabId})
@TableIndex(name: 'IX_vocab_readings_reading', columns: {#reading})
@TableIndex(name: 'IX_vocab_readings_reading_romaji', columns: {#readingRomaji})
class VocabReadings extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get vocabId => integer()();

  TextColumn get reading => text()();
  TextColumn get readingSearchForm => text().nullable()();
  TextColumn get readingRomaji => text()();
  TextColumn get readingRomajiSimplified => text().nullable()();

  TextColumn get associatedWritings =>
      text().map(const StringListConverter()).nullable()();

  TextColumn get info => text().map(const ReadingInfoConverter()).nullable()();
  TextColumn get pitchAccents =>
      text().map(const IntListConverter()).nullable()();

  BoolColumn get primaryPair => boolean().withDefault(const Constant(false))();
}

@TableIndex(name: 'IX_vocab_definitions_vocab_id', columns: {#vocabId})
class VocabDefinitions extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get vocabId => integer()();

  TextColumn get definition => text()();
  TextColumn get additionalInfo => text().nullable()();
  TextColumn get pos => text().map(const PartOfSpeechConverter()).nullable()();
  TextColumn get appliesTo =>
      text().map(const StringListConverter()).nullable()();
  TextColumn get fields => text().map(const FieldConverter()).nullable()();
  TextColumn get miscInfo =>
      text().map(const MiscellaneousInfoConverter()).nullable()();
  TextColumn get dialects => text().map(const DialectConverter()).nullable()();
  TextColumn get examples =>
      text().map(const VocabExampleConverter()).nullable()();
  TextColumn get languageSource =>
      text().map(const LanguageSourceConverter()).nullable()();
  BoolColumn get waseieigo => boolean()();
  TextColumn get crossReferences =>
      text().map(const VocabReferenceConverter()).nullable()();
  TextColumn get antonyms =>
      text().map(const VocabReferenceConverter()).nullable()();
}

@TableIndex(name: 'IX_vocab_definition_words_word', columns: {#word})
class VocabDefinitionWords extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get word => text()();
  IntColumn get vocabId => integer()();
}

class VocabExample {
  final String japanese;
  final String english;
  late List<JapaneseTextToken> tokens;

  VocabExample({
    required this.japanese,
    required this.english,
  });

  String toJson() {
    return jsonEncode(
      {
        'japanese': japanese,
        'english': english,
      },
    );
  }

  static VocabExample fromJson(String json) {
    Map<String, dynamic> map = jsonDecode(json);
    return VocabExample(
      japanese: map['japanese'],
      english: map['english'],
    );
  }
}

class VocabReference {
  final List<int>? ids;
  final String text;

  const VocabReference({
    required this.ids,
    required this.text,
  });

  String toJson() {
    return jsonEncode(
      {
        'ids': ids,
        'text': text,
      },
    );
  }

  static VocabReference fromJson(String json) {
    Map<String, dynamic> map = jsonDecode(json);
    return VocabReference(
      ids: map['ids']?.cast<int>(),
      text: map['text'],
    );
  }
}

class PartOfSpeechConverter extends TypeConverter<List<PartOfSpeech>, String> {
  const PartOfSpeechConverter();

  @override
  List<PartOfSpeech> fromSql(String fromDb) {
    return (jsonDecode(fromDb).cast<int>() as List<int>)
        .map((e) => PartOfSpeech.values[e])
        .toList();
  }

  @override
  String toSql(List<PartOfSpeech> value) {
    return jsonEncode(value.map((e) => e.index).toList());
  }
}

class WritingInfoConverter extends TypeConverter<List<WritingInfo>, String> {
  const WritingInfoConverter();

  @override
  List<WritingInfo> fromSql(String fromDb) {
    return (jsonDecode(fromDb).cast<int>() as List<int>)
        .map((e) => WritingInfo.values[e])
        .toList();
  }

  @override
  String toSql(List<WritingInfo> value) {
    return jsonEncode(value.map((e) => e.index).toList());
  }
}

class ReadingInfoConverter extends TypeConverter<List<ReadingInfo>, String> {
  const ReadingInfoConverter();

  @override
  List<ReadingInfo> fromSql(String fromDb) {
    return (jsonDecode(fromDb).cast<int>() as List<int>)
        .map((e) => ReadingInfo.values[e])
        .toList();
  }

  @override
  String toSql(List<ReadingInfo> value) {
    return jsonEncode(value.map((e) => e.index).toList());
  }
}

class FieldConverter extends TypeConverter<List<Field>, String> {
  const FieldConverter();

  @override
  List<Field> fromSql(String fromDb) {
    return (jsonDecode(fromDb).cast<int>() as List<int>)
        .map((e) => Field.values[e])
        .toList();
  }

  @override
  String toSql(List<Field> value) {
    return jsonEncode(value.map((e) => e.index).toList());
  }
}

class MiscellaneousInfoConverter
    extends TypeConverter<List<MiscellaneousInfo>, String> {
  const MiscellaneousInfoConverter();

  @override
  List<MiscellaneousInfo> fromSql(String fromDb) {
    return (jsonDecode(fromDb).cast<int>() as List<int>)
        .map((e) => MiscellaneousInfo.values[e])
        .toList();
  }

  @override
  String toSql(List<MiscellaneousInfo> value) {
    return jsonEncode(value.map((e) => e.index).toList());
  }
}

class DialectConverter extends TypeConverter<List<Dialect>, String> {
  const DialectConverter();

  @override
  List<Dialect> fromSql(String fromDb) {
    return (jsonDecode(fromDb).cast<int>() as List<int>)
        .map((e) => Dialect.values[e])
        .toList();
  }

  @override
  String toSql(List<Dialect> value) {
    return jsonEncode(value.map((e) => e.index).toList());
  }
}

class LanguageSourceConverter
    extends TypeConverter<List<LanguageSource>, String> {
  const LanguageSourceConverter();

  @override
  List<LanguageSource> fromSql(String fromDb) {
    return (jsonDecode(fromDb).cast<int>() as List<int>)
        .map((e) => LanguageSource.values[e])
        .toList();
  }

  @override
  String toSql(List<LanguageSource> value) {
    return jsonEncode(value.map((e) => e.index).toList());
  }
}

class VocabExampleConverter extends TypeConverter<List<VocabExample>, String> {
  const VocabExampleConverter();

  @override
  List<VocabExample> fromSql(String fromDb) {
    return jsonDecode(fromDb)
        .cast<String>()
        .map((e) => VocabExample.fromJson(e))
        .toList()
        .cast<VocabExample>();
  }

  @override
  String toSql(List<VocabExample> value) {
    return jsonEncode(value.map((e) => e.toJson()).toList());
  }
}

class VocabReferenceConverter
    extends TypeConverter<List<VocabReference>, String> {
  const VocabReferenceConverter();

  @override
  List<VocabReference> fromSql(String fromDb) {
    return jsonDecode(fromDb)
        .cast<String>()
        .map((e) => VocabReference.fromJson(e))
        .toList()
        .cast<VocabReference>();
  }

  @override
  String toSql(List<VocabReference> value) {
    return jsonEncode(value.map((e) => e.toJson()).toList());
  }
}
