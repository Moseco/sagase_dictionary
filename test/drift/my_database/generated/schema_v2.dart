// dart format width=80
// GENERATED CODE, DO NOT EDIT BY HAND.
// ignore_for_file: type=lint
import 'package:drift/drift.dart';

class VocabWritings extends Table
    with TableInfo<VocabWritings, VocabWritingsData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  VocabWritings(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  late final GeneratedColumn<int> vocabId = GeneratedColumn<int>(
      'vocab_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  late final GeneratedColumn<String> writing = GeneratedColumn<String>(
      'writing', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<String> writingSearchForm =
      GeneratedColumn<String>('writing_search_form', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  late final GeneratedColumn<String> info = GeneratedColumn<String>(
      'info', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, vocabId, writing, writingSearchForm, info];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'vocab_writings';
  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  VocabWritingsData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return VocabWritingsData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      vocabId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}vocab_id'])!,
      writing: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}writing'])!,
      writingSearchForm: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}writing_search_form']),
      info: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}info']),
    );
  }

  @override
  VocabWritings createAlias(String alias) {
    return VocabWritings(attachedDatabase, alias);
  }
}

class VocabWritingsData extends DataClass
    implements Insertable<VocabWritingsData> {
  final int id;
  final int vocabId;
  final String writing;
  final String? writingSearchForm;
  final String? info;
  const VocabWritingsData(
      {required this.id,
      required this.vocabId,
      required this.writing,
      this.writingSearchForm,
      this.info});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['vocab_id'] = Variable<int>(vocabId);
    map['writing'] = Variable<String>(writing);
    if (!nullToAbsent || writingSearchForm != null) {
      map['writing_search_form'] = Variable<String>(writingSearchForm);
    }
    if (!nullToAbsent || info != null) {
      map['info'] = Variable<String>(info);
    }
    return map;
  }

  VocabWritingsCompanion toCompanion(bool nullToAbsent) {
    return VocabWritingsCompanion(
      id: Value(id),
      vocabId: Value(vocabId),
      writing: Value(writing),
      writingSearchForm: writingSearchForm == null && nullToAbsent
          ? const Value.absent()
          : Value(writingSearchForm),
      info: info == null && nullToAbsent ? const Value.absent() : Value(info),
    );
  }

  factory VocabWritingsData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return VocabWritingsData(
      id: serializer.fromJson<int>(json['id']),
      vocabId: serializer.fromJson<int>(json['vocabId']),
      writing: serializer.fromJson<String>(json['writing']),
      writingSearchForm:
          serializer.fromJson<String?>(json['writingSearchForm']),
      info: serializer.fromJson<String?>(json['info']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'vocabId': serializer.toJson<int>(vocabId),
      'writing': serializer.toJson<String>(writing),
      'writingSearchForm': serializer.toJson<String?>(writingSearchForm),
      'info': serializer.toJson<String?>(info),
    };
  }

  VocabWritingsData copyWith(
          {int? id,
          int? vocabId,
          String? writing,
          Value<String?> writingSearchForm = const Value.absent(),
          Value<String?> info = const Value.absent()}) =>
      VocabWritingsData(
        id: id ?? this.id,
        vocabId: vocabId ?? this.vocabId,
        writing: writing ?? this.writing,
        writingSearchForm: writingSearchForm.present
            ? writingSearchForm.value
            : this.writingSearchForm,
        info: info.present ? info.value : this.info,
      );
  VocabWritingsData copyWithCompanion(VocabWritingsCompanion data) {
    return VocabWritingsData(
      id: data.id.present ? data.id.value : this.id,
      vocabId: data.vocabId.present ? data.vocabId.value : this.vocabId,
      writing: data.writing.present ? data.writing.value : this.writing,
      writingSearchForm: data.writingSearchForm.present
          ? data.writingSearchForm.value
          : this.writingSearchForm,
      info: data.info.present ? data.info.value : this.info,
    );
  }

  @override
  String toString() {
    return (StringBuffer('VocabWritingsData(')
          ..write('id: $id, ')
          ..write('vocabId: $vocabId, ')
          ..write('writing: $writing, ')
          ..write('writingSearchForm: $writingSearchForm, ')
          ..write('info: $info')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, vocabId, writing, writingSearchForm, info);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is VocabWritingsData &&
          other.id == this.id &&
          other.vocabId == this.vocabId &&
          other.writing == this.writing &&
          other.writingSearchForm == this.writingSearchForm &&
          other.info == this.info);
}

class VocabWritingsCompanion extends UpdateCompanion<VocabWritingsData> {
  final Value<int> id;
  final Value<int> vocabId;
  final Value<String> writing;
  final Value<String?> writingSearchForm;
  final Value<String?> info;
  const VocabWritingsCompanion({
    this.id = const Value.absent(),
    this.vocabId = const Value.absent(),
    this.writing = const Value.absent(),
    this.writingSearchForm = const Value.absent(),
    this.info = const Value.absent(),
  });
  VocabWritingsCompanion.insert({
    this.id = const Value.absent(),
    required int vocabId,
    required String writing,
    this.writingSearchForm = const Value.absent(),
    this.info = const Value.absent(),
  })  : vocabId = Value(vocabId),
        writing = Value(writing);
  static Insertable<VocabWritingsData> custom({
    Expression<int>? id,
    Expression<int>? vocabId,
    Expression<String>? writing,
    Expression<String>? writingSearchForm,
    Expression<String>? info,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (vocabId != null) 'vocab_id': vocabId,
      if (writing != null) 'writing': writing,
      if (writingSearchForm != null) 'writing_search_form': writingSearchForm,
      if (info != null) 'info': info,
    });
  }

  VocabWritingsCompanion copyWith(
      {Value<int>? id,
      Value<int>? vocabId,
      Value<String>? writing,
      Value<String?>? writingSearchForm,
      Value<String?>? info}) {
    return VocabWritingsCompanion(
      id: id ?? this.id,
      vocabId: vocabId ?? this.vocabId,
      writing: writing ?? this.writing,
      writingSearchForm: writingSearchForm ?? this.writingSearchForm,
      info: info ?? this.info,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (vocabId.present) {
      map['vocab_id'] = Variable<int>(vocabId.value);
    }
    if (writing.present) {
      map['writing'] = Variable<String>(writing.value);
    }
    if (writingSearchForm.present) {
      map['writing_search_form'] = Variable<String>(writingSearchForm.value);
    }
    if (info.present) {
      map['info'] = Variable<String>(info.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('VocabWritingsCompanion(')
          ..write('id: $id, ')
          ..write('vocabId: $vocabId, ')
          ..write('writing: $writing, ')
          ..write('writingSearchForm: $writingSearchForm, ')
          ..write('info: $info')
          ..write(')'))
        .toString();
  }
}

class VocabReadings extends Table
    with TableInfo<VocabReadings, VocabReadingsData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  VocabReadings(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  late final GeneratedColumn<int> vocabId = GeneratedColumn<int>(
      'vocab_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  late final GeneratedColumn<String> reading = GeneratedColumn<String>(
      'reading', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<String> readingSearchForm =
      GeneratedColumn<String>('reading_search_form', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  late final GeneratedColumn<String> readingRomaji = GeneratedColumn<String>(
      'reading_romaji', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<String> readingRomajiSimplified =
      GeneratedColumn<String>('reading_romaji_simplified', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  late final GeneratedColumn<String> associatedWritings =
      GeneratedColumn<String>('associated_writings', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  late final GeneratedColumn<String> info = GeneratedColumn<String>(
      'info', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  late final GeneratedColumn<String> pitchAccents = GeneratedColumn<String>(
      'pitch_accents', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        vocabId,
        reading,
        readingSearchForm,
        readingRomaji,
        readingRomajiSimplified,
        associatedWritings,
        info,
        pitchAccents
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'vocab_readings';
  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  VocabReadingsData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return VocabReadingsData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      vocabId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}vocab_id'])!,
      reading: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}reading'])!,
      readingSearchForm: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}reading_search_form']),
      readingRomaji: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}reading_romaji'])!,
      readingRomajiSimplified: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}reading_romaji_simplified']),
      associatedWritings: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}associated_writings']),
      info: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}info']),
      pitchAccents: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}pitch_accents']),
    );
  }

  @override
  VocabReadings createAlias(String alias) {
    return VocabReadings(attachedDatabase, alias);
  }
}

class VocabReadingsData extends DataClass
    implements Insertable<VocabReadingsData> {
  final int id;
  final int vocabId;
  final String reading;
  final String? readingSearchForm;
  final String readingRomaji;
  final String? readingRomajiSimplified;
  final String? associatedWritings;
  final String? info;
  final String? pitchAccents;
  const VocabReadingsData(
      {required this.id,
      required this.vocabId,
      required this.reading,
      this.readingSearchForm,
      required this.readingRomaji,
      this.readingRomajiSimplified,
      this.associatedWritings,
      this.info,
      this.pitchAccents});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['vocab_id'] = Variable<int>(vocabId);
    map['reading'] = Variable<String>(reading);
    if (!nullToAbsent || readingSearchForm != null) {
      map['reading_search_form'] = Variable<String>(readingSearchForm);
    }
    map['reading_romaji'] = Variable<String>(readingRomaji);
    if (!nullToAbsent || readingRomajiSimplified != null) {
      map['reading_romaji_simplified'] =
          Variable<String>(readingRomajiSimplified);
    }
    if (!nullToAbsent || associatedWritings != null) {
      map['associated_writings'] = Variable<String>(associatedWritings);
    }
    if (!nullToAbsent || info != null) {
      map['info'] = Variable<String>(info);
    }
    if (!nullToAbsent || pitchAccents != null) {
      map['pitch_accents'] = Variable<String>(pitchAccents);
    }
    return map;
  }

  VocabReadingsCompanion toCompanion(bool nullToAbsent) {
    return VocabReadingsCompanion(
      id: Value(id),
      vocabId: Value(vocabId),
      reading: Value(reading),
      readingSearchForm: readingSearchForm == null && nullToAbsent
          ? const Value.absent()
          : Value(readingSearchForm),
      readingRomaji: Value(readingRomaji),
      readingRomajiSimplified: readingRomajiSimplified == null && nullToAbsent
          ? const Value.absent()
          : Value(readingRomajiSimplified),
      associatedWritings: associatedWritings == null && nullToAbsent
          ? const Value.absent()
          : Value(associatedWritings),
      info: info == null && nullToAbsent ? const Value.absent() : Value(info),
      pitchAccents: pitchAccents == null && nullToAbsent
          ? const Value.absent()
          : Value(pitchAccents),
    );
  }

  factory VocabReadingsData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return VocabReadingsData(
      id: serializer.fromJson<int>(json['id']),
      vocabId: serializer.fromJson<int>(json['vocabId']),
      reading: serializer.fromJson<String>(json['reading']),
      readingSearchForm:
          serializer.fromJson<String?>(json['readingSearchForm']),
      readingRomaji: serializer.fromJson<String>(json['readingRomaji']),
      readingRomajiSimplified:
          serializer.fromJson<String?>(json['readingRomajiSimplified']),
      associatedWritings:
          serializer.fromJson<String?>(json['associatedWritings']),
      info: serializer.fromJson<String?>(json['info']),
      pitchAccents: serializer.fromJson<String?>(json['pitchAccents']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'vocabId': serializer.toJson<int>(vocabId),
      'reading': serializer.toJson<String>(reading),
      'readingSearchForm': serializer.toJson<String?>(readingSearchForm),
      'readingRomaji': serializer.toJson<String>(readingRomaji),
      'readingRomajiSimplified':
          serializer.toJson<String?>(readingRomajiSimplified),
      'associatedWritings': serializer.toJson<String?>(associatedWritings),
      'info': serializer.toJson<String?>(info),
      'pitchAccents': serializer.toJson<String?>(pitchAccents),
    };
  }

  VocabReadingsData copyWith(
          {int? id,
          int? vocabId,
          String? reading,
          Value<String?> readingSearchForm = const Value.absent(),
          String? readingRomaji,
          Value<String?> readingRomajiSimplified = const Value.absent(),
          Value<String?> associatedWritings = const Value.absent(),
          Value<String?> info = const Value.absent(),
          Value<String?> pitchAccents = const Value.absent()}) =>
      VocabReadingsData(
        id: id ?? this.id,
        vocabId: vocabId ?? this.vocabId,
        reading: reading ?? this.reading,
        readingSearchForm: readingSearchForm.present
            ? readingSearchForm.value
            : this.readingSearchForm,
        readingRomaji: readingRomaji ?? this.readingRomaji,
        readingRomajiSimplified: readingRomajiSimplified.present
            ? readingRomajiSimplified.value
            : this.readingRomajiSimplified,
        associatedWritings: associatedWritings.present
            ? associatedWritings.value
            : this.associatedWritings,
        info: info.present ? info.value : this.info,
        pitchAccents:
            pitchAccents.present ? pitchAccents.value : this.pitchAccents,
      );
  VocabReadingsData copyWithCompanion(VocabReadingsCompanion data) {
    return VocabReadingsData(
      id: data.id.present ? data.id.value : this.id,
      vocabId: data.vocabId.present ? data.vocabId.value : this.vocabId,
      reading: data.reading.present ? data.reading.value : this.reading,
      readingSearchForm: data.readingSearchForm.present
          ? data.readingSearchForm.value
          : this.readingSearchForm,
      readingRomaji: data.readingRomaji.present
          ? data.readingRomaji.value
          : this.readingRomaji,
      readingRomajiSimplified: data.readingRomajiSimplified.present
          ? data.readingRomajiSimplified.value
          : this.readingRomajiSimplified,
      associatedWritings: data.associatedWritings.present
          ? data.associatedWritings.value
          : this.associatedWritings,
      info: data.info.present ? data.info.value : this.info,
      pitchAccents: data.pitchAccents.present
          ? data.pitchAccents.value
          : this.pitchAccents,
    );
  }

  @override
  String toString() {
    return (StringBuffer('VocabReadingsData(')
          ..write('id: $id, ')
          ..write('vocabId: $vocabId, ')
          ..write('reading: $reading, ')
          ..write('readingSearchForm: $readingSearchForm, ')
          ..write('readingRomaji: $readingRomaji, ')
          ..write('readingRomajiSimplified: $readingRomajiSimplified, ')
          ..write('associatedWritings: $associatedWritings, ')
          ..write('info: $info, ')
          ..write('pitchAccents: $pitchAccents')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      vocabId,
      reading,
      readingSearchForm,
      readingRomaji,
      readingRomajiSimplified,
      associatedWritings,
      info,
      pitchAccents);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is VocabReadingsData &&
          other.id == this.id &&
          other.vocabId == this.vocabId &&
          other.reading == this.reading &&
          other.readingSearchForm == this.readingSearchForm &&
          other.readingRomaji == this.readingRomaji &&
          other.readingRomajiSimplified == this.readingRomajiSimplified &&
          other.associatedWritings == this.associatedWritings &&
          other.info == this.info &&
          other.pitchAccents == this.pitchAccents);
}

class VocabReadingsCompanion extends UpdateCompanion<VocabReadingsData> {
  final Value<int> id;
  final Value<int> vocabId;
  final Value<String> reading;
  final Value<String?> readingSearchForm;
  final Value<String> readingRomaji;
  final Value<String?> readingRomajiSimplified;
  final Value<String?> associatedWritings;
  final Value<String?> info;
  final Value<String?> pitchAccents;
  const VocabReadingsCompanion({
    this.id = const Value.absent(),
    this.vocabId = const Value.absent(),
    this.reading = const Value.absent(),
    this.readingSearchForm = const Value.absent(),
    this.readingRomaji = const Value.absent(),
    this.readingRomajiSimplified = const Value.absent(),
    this.associatedWritings = const Value.absent(),
    this.info = const Value.absent(),
    this.pitchAccents = const Value.absent(),
  });
  VocabReadingsCompanion.insert({
    this.id = const Value.absent(),
    required int vocabId,
    required String reading,
    this.readingSearchForm = const Value.absent(),
    required String readingRomaji,
    this.readingRomajiSimplified = const Value.absent(),
    this.associatedWritings = const Value.absent(),
    this.info = const Value.absent(),
    this.pitchAccents = const Value.absent(),
  })  : vocabId = Value(vocabId),
        reading = Value(reading),
        readingRomaji = Value(readingRomaji);
  static Insertable<VocabReadingsData> custom({
    Expression<int>? id,
    Expression<int>? vocabId,
    Expression<String>? reading,
    Expression<String>? readingSearchForm,
    Expression<String>? readingRomaji,
    Expression<String>? readingRomajiSimplified,
    Expression<String>? associatedWritings,
    Expression<String>? info,
    Expression<String>? pitchAccents,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (vocabId != null) 'vocab_id': vocabId,
      if (reading != null) 'reading': reading,
      if (readingSearchForm != null) 'reading_search_form': readingSearchForm,
      if (readingRomaji != null) 'reading_romaji': readingRomaji,
      if (readingRomajiSimplified != null)
        'reading_romaji_simplified': readingRomajiSimplified,
      if (associatedWritings != null) 'associated_writings': associatedWritings,
      if (info != null) 'info': info,
      if (pitchAccents != null) 'pitch_accents': pitchAccents,
    });
  }

  VocabReadingsCompanion copyWith(
      {Value<int>? id,
      Value<int>? vocabId,
      Value<String>? reading,
      Value<String?>? readingSearchForm,
      Value<String>? readingRomaji,
      Value<String?>? readingRomajiSimplified,
      Value<String?>? associatedWritings,
      Value<String?>? info,
      Value<String?>? pitchAccents}) {
    return VocabReadingsCompanion(
      id: id ?? this.id,
      vocabId: vocabId ?? this.vocabId,
      reading: reading ?? this.reading,
      readingSearchForm: readingSearchForm ?? this.readingSearchForm,
      readingRomaji: readingRomaji ?? this.readingRomaji,
      readingRomajiSimplified:
          readingRomajiSimplified ?? this.readingRomajiSimplified,
      associatedWritings: associatedWritings ?? this.associatedWritings,
      info: info ?? this.info,
      pitchAccents: pitchAccents ?? this.pitchAccents,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (vocabId.present) {
      map['vocab_id'] = Variable<int>(vocabId.value);
    }
    if (reading.present) {
      map['reading'] = Variable<String>(reading.value);
    }
    if (readingSearchForm.present) {
      map['reading_search_form'] = Variable<String>(readingSearchForm.value);
    }
    if (readingRomaji.present) {
      map['reading_romaji'] = Variable<String>(readingRomaji.value);
    }
    if (readingRomajiSimplified.present) {
      map['reading_romaji_simplified'] =
          Variable<String>(readingRomajiSimplified.value);
    }
    if (associatedWritings.present) {
      map['associated_writings'] = Variable<String>(associatedWritings.value);
    }
    if (info.present) {
      map['info'] = Variable<String>(info.value);
    }
    if (pitchAccents.present) {
      map['pitch_accents'] = Variable<String>(pitchAccents.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('VocabReadingsCompanion(')
          ..write('id: $id, ')
          ..write('vocabId: $vocabId, ')
          ..write('reading: $reading, ')
          ..write('readingSearchForm: $readingSearchForm, ')
          ..write('readingRomaji: $readingRomaji, ')
          ..write('readingRomajiSimplified: $readingRomajiSimplified, ')
          ..write('associatedWritings: $associatedWritings, ')
          ..write('info: $info, ')
          ..write('pitchAccents: $pitchAccents')
          ..write(')'))
        .toString();
  }
}

class Vocabs extends Table with TableInfo<Vocabs, VocabsData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Vocabs(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  late final GeneratedColumn<String> pos = GeneratedColumn<String>(
      'pos', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  late final GeneratedColumn<bool> common = GeneratedColumn<bool>(
      'common', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("common" IN (0, 1))'),
      defaultValue: const CustomExpression('0'));
  late final GeneratedColumn<int> frequencyScore = GeneratedColumn<int>(
      'frequency_score', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const CustomExpression('0'));
  @override
  List<GeneratedColumn> get $columns => [id, pos, common, frequencyScore];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'vocabs';
  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  VocabsData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return VocabsData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      pos: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}pos']),
      common: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}common'])!,
      frequencyScore: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}frequency_score'])!,
    );
  }

  @override
  Vocabs createAlias(String alias) {
    return Vocabs(attachedDatabase, alias);
  }
}

class VocabsData extends DataClass implements Insertable<VocabsData> {
  final int id;
  final String? pos;
  final bool common;
  final int frequencyScore;
  const VocabsData(
      {required this.id,
      this.pos,
      required this.common,
      required this.frequencyScore});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || pos != null) {
      map['pos'] = Variable<String>(pos);
    }
    map['common'] = Variable<bool>(common);
    map['frequency_score'] = Variable<int>(frequencyScore);
    return map;
  }

  VocabsCompanion toCompanion(bool nullToAbsent) {
    return VocabsCompanion(
      id: Value(id),
      pos: pos == null && nullToAbsent ? const Value.absent() : Value(pos),
      common: Value(common),
      frequencyScore: Value(frequencyScore),
    );
  }

  factory VocabsData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return VocabsData(
      id: serializer.fromJson<int>(json['id']),
      pos: serializer.fromJson<String?>(json['pos']),
      common: serializer.fromJson<bool>(json['common']),
      frequencyScore: serializer.fromJson<int>(json['frequencyScore']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'pos': serializer.toJson<String?>(pos),
      'common': serializer.toJson<bool>(common),
      'frequencyScore': serializer.toJson<int>(frequencyScore),
    };
  }

  VocabsData copyWith(
          {int? id,
          Value<String?> pos = const Value.absent(),
          bool? common,
          int? frequencyScore}) =>
      VocabsData(
        id: id ?? this.id,
        pos: pos.present ? pos.value : this.pos,
        common: common ?? this.common,
        frequencyScore: frequencyScore ?? this.frequencyScore,
      );
  VocabsData copyWithCompanion(VocabsCompanion data) {
    return VocabsData(
      id: data.id.present ? data.id.value : this.id,
      pos: data.pos.present ? data.pos.value : this.pos,
      common: data.common.present ? data.common.value : this.common,
      frequencyScore: data.frequencyScore.present
          ? data.frequencyScore.value
          : this.frequencyScore,
    );
  }

  @override
  String toString() {
    return (StringBuffer('VocabsData(')
          ..write('id: $id, ')
          ..write('pos: $pos, ')
          ..write('common: $common, ')
          ..write('frequencyScore: $frequencyScore')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, pos, common, frequencyScore);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is VocabsData &&
          other.id == this.id &&
          other.pos == this.pos &&
          other.common == this.common &&
          other.frequencyScore == this.frequencyScore);
}

class VocabsCompanion extends UpdateCompanion<VocabsData> {
  final Value<int> id;
  final Value<String?> pos;
  final Value<bool> common;
  final Value<int> frequencyScore;
  const VocabsCompanion({
    this.id = const Value.absent(),
    this.pos = const Value.absent(),
    this.common = const Value.absent(),
    this.frequencyScore = const Value.absent(),
  });
  VocabsCompanion.insert({
    this.id = const Value.absent(),
    this.pos = const Value.absent(),
    this.common = const Value.absent(),
    this.frequencyScore = const Value.absent(),
  });
  static Insertable<VocabsData> custom({
    Expression<int>? id,
    Expression<String>? pos,
    Expression<bool>? common,
    Expression<int>? frequencyScore,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (pos != null) 'pos': pos,
      if (common != null) 'common': common,
      if (frequencyScore != null) 'frequency_score': frequencyScore,
    });
  }

  VocabsCompanion copyWith(
      {Value<int>? id,
      Value<String?>? pos,
      Value<bool>? common,
      Value<int>? frequencyScore}) {
    return VocabsCompanion(
      id: id ?? this.id,
      pos: pos ?? this.pos,
      common: common ?? this.common,
      frequencyScore: frequencyScore ?? this.frequencyScore,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (pos.present) {
      map['pos'] = Variable<String>(pos.value);
    }
    if (common.present) {
      map['common'] = Variable<bool>(common.value);
    }
    if (frequencyScore.present) {
      map['frequency_score'] = Variable<int>(frequencyScore.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('VocabsCompanion(')
          ..write('id: $id, ')
          ..write('pos: $pos, ')
          ..write('common: $common, ')
          ..write('frequencyScore: $frequencyScore')
          ..write(')'))
        .toString();
  }
}

class VocabDefinitions extends Table
    with TableInfo<VocabDefinitions, VocabDefinitionsData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  VocabDefinitions(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  late final GeneratedColumn<int> vocabId = GeneratedColumn<int>(
      'vocab_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  late final GeneratedColumn<String> definition = GeneratedColumn<String>(
      'definition', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<String> additionalInfo = GeneratedColumn<String>(
      'additional_info', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  late final GeneratedColumn<String> pos = GeneratedColumn<String>(
      'pos', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  late final GeneratedColumn<String> appliesTo = GeneratedColumn<String>(
      'applies_to', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  late final GeneratedColumn<String> fields = GeneratedColumn<String>(
      'fields', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  late final GeneratedColumn<String> miscInfo = GeneratedColumn<String>(
      'misc_info', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  late final GeneratedColumn<String> dialects = GeneratedColumn<String>(
      'dialects', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  late final GeneratedColumn<String> examples = GeneratedColumn<String>(
      'examples', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  late final GeneratedColumn<String> languageSource = GeneratedColumn<String>(
      'language_source', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  late final GeneratedColumn<bool> waseieigo = GeneratedColumn<bool>(
      'waseieigo', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("waseieigo" IN (0, 1))'));
  late final GeneratedColumn<String> crossReferences = GeneratedColumn<String>(
      'cross_references', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  late final GeneratedColumn<String> antonyms = GeneratedColumn<String>(
      'antonyms', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        vocabId,
        definition,
        additionalInfo,
        pos,
        appliesTo,
        fields,
        miscInfo,
        dialects,
        examples,
        languageSource,
        waseieigo,
        crossReferences,
        antonyms
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'vocab_definitions';
  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  VocabDefinitionsData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return VocabDefinitionsData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      vocabId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}vocab_id'])!,
      definition: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}definition'])!,
      additionalInfo: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}additional_info']),
      pos: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}pos']),
      appliesTo: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}applies_to']),
      fields: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}fields']),
      miscInfo: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}misc_info']),
      dialects: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}dialects']),
      examples: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}examples']),
      languageSource: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}language_source']),
      waseieigo: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}waseieigo'])!,
      crossReferences: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}cross_references']),
      antonyms: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}antonyms']),
    );
  }

  @override
  VocabDefinitions createAlias(String alias) {
    return VocabDefinitions(attachedDatabase, alias);
  }
}

class VocabDefinitionsData extends DataClass
    implements Insertable<VocabDefinitionsData> {
  final int id;
  final int vocabId;
  final String definition;
  final String? additionalInfo;
  final String? pos;
  final String? appliesTo;
  final String? fields;
  final String? miscInfo;
  final String? dialects;
  final String? examples;
  final String? languageSource;
  final bool waseieigo;
  final String? crossReferences;
  final String? antonyms;
  const VocabDefinitionsData(
      {required this.id,
      required this.vocabId,
      required this.definition,
      this.additionalInfo,
      this.pos,
      this.appliesTo,
      this.fields,
      this.miscInfo,
      this.dialects,
      this.examples,
      this.languageSource,
      required this.waseieigo,
      this.crossReferences,
      this.antonyms});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['vocab_id'] = Variable<int>(vocabId);
    map['definition'] = Variable<String>(definition);
    if (!nullToAbsent || additionalInfo != null) {
      map['additional_info'] = Variable<String>(additionalInfo);
    }
    if (!nullToAbsent || pos != null) {
      map['pos'] = Variable<String>(pos);
    }
    if (!nullToAbsent || appliesTo != null) {
      map['applies_to'] = Variable<String>(appliesTo);
    }
    if (!nullToAbsent || fields != null) {
      map['fields'] = Variable<String>(fields);
    }
    if (!nullToAbsent || miscInfo != null) {
      map['misc_info'] = Variable<String>(miscInfo);
    }
    if (!nullToAbsent || dialects != null) {
      map['dialects'] = Variable<String>(dialects);
    }
    if (!nullToAbsent || examples != null) {
      map['examples'] = Variable<String>(examples);
    }
    if (!nullToAbsent || languageSource != null) {
      map['language_source'] = Variable<String>(languageSource);
    }
    map['waseieigo'] = Variable<bool>(waseieigo);
    if (!nullToAbsent || crossReferences != null) {
      map['cross_references'] = Variable<String>(crossReferences);
    }
    if (!nullToAbsent || antonyms != null) {
      map['antonyms'] = Variable<String>(antonyms);
    }
    return map;
  }

  VocabDefinitionsCompanion toCompanion(bool nullToAbsent) {
    return VocabDefinitionsCompanion(
      id: Value(id),
      vocabId: Value(vocabId),
      definition: Value(definition),
      additionalInfo: additionalInfo == null && nullToAbsent
          ? const Value.absent()
          : Value(additionalInfo),
      pos: pos == null && nullToAbsent ? const Value.absent() : Value(pos),
      appliesTo: appliesTo == null && nullToAbsent
          ? const Value.absent()
          : Value(appliesTo),
      fields:
          fields == null && nullToAbsent ? const Value.absent() : Value(fields),
      miscInfo: miscInfo == null && nullToAbsent
          ? const Value.absent()
          : Value(miscInfo),
      dialects: dialects == null && nullToAbsent
          ? const Value.absent()
          : Value(dialects),
      examples: examples == null && nullToAbsent
          ? const Value.absent()
          : Value(examples),
      languageSource: languageSource == null && nullToAbsent
          ? const Value.absent()
          : Value(languageSource),
      waseieigo: Value(waseieigo),
      crossReferences: crossReferences == null && nullToAbsent
          ? const Value.absent()
          : Value(crossReferences),
      antonyms: antonyms == null && nullToAbsent
          ? const Value.absent()
          : Value(antonyms),
    );
  }

  factory VocabDefinitionsData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return VocabDefinitionsData(
      id: serializer.fromJson<int>(json['id']),
      vocabId: serializer.fromJson<int>(json['vocabId']),
      definition: serializer.fromJson<String>(json['definition']),
      additionalInfo: serializer.fromJson<String?>(json['additionalInfo']),
      pos: serializer.fromJson<String?>(json['pos']),
      appliesTo: serializer.fromJson<String?>(json['appliesTo']),
      fields: serializer.fromJson<String?>(json['fields']),
      miscInfo: serializer.fromJson<String?>(json['miscInfo']),
      dialects: serializer.fromJson<String?>(json['dialects']),
      examples: serializer.fromJson<String?>(json['examples']),
      languageSource: serializer.fromJson<String?>(json['languageSource']),
      waseieigo: serializer.fromJson<bool>(json['waseieigo']),
      crossReferences: serializer.fromJson<String?>(json['crossReferences']),
      antonyms: serializer.fromJson<String?>(json['antonyms']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'vocabId': serializer.toJson<int>(vocabId),
      'definition': serializer.toJson<String>(definition),
      'additionalInfo': serializer.toJson<String?>(additionalInfo),
      'pos': serializer.toJson<String?>(pos),
      'appliesTo': serializer.toJson<String?>(appliesTo),
      'fields': serializer.toJson<String?>(fields),
      'miscInfo': serializer.toJson<String?>(miscInfo),
      'dialects': serializer.toJson<String?>(dialects),
      'examples': serializer.toJson<String?>(examples),
      'languageSource': serializer.toJson<String?>(languageSource),
      'waseieigo': serializer.toJson<bool>(waseieigo),
      'crossReferences': serializer.toJson<String?>(crossReferences),
      'antonyms': serializer.toJson<String?>(antonyms),
    };
  }

  VocabDefinitionsData copyWith(
          {int? id,
          int? vocabId,
          String? definition,
          Value<String?> additionalInfo = const Value.absent(),
          Value<String?> pos = const Value.absent(),
          Value<String?> appliesTo = const Value.absent(),
          Value<String?> fields = const Value.absent(),
          Value<String?> miscInfo = const Value.absent(),
          Value<String?> dialects = const Value.absent(),
          Value<String?> examples = const Value.absent(),
          Value<String?> languageSource = const Value.absent(),
          bool? waseieigo,
          Value<String?> crossReferences = const Value.absent(),
          Value<String?> antonyms = const Value.absent()}) =>
      VocabDefinitionsData(
        id: id ?? this.id,
        vocabId: vocabId ?? this.vocabId,
        definition: definition ?? this.definition,
        additionalInfo:
            additionalInfo.present ? additionalInfo.value : this.additionalInfo,
        pos: pos.present ? pos.value : this.pos,
        appliesTo: appliesTo.present ? appliesTo.value : this.appliesTo,
        fields: fields.present ? fields.value : this.fields,
        miscInfo: miscInfo.present ? miscInfo.value : this.miscInfo,
        dialects: dialects.present ? dialects.value : this.dialects,
        examples: examples.present ? examples.value : this.examples,
        languageSource:
            languageSource.present ? languageSource.value : this.languageSource,
        waseieigo: waseieigo ?? this.waseieigo,
        crossReferences: crossReferences.present
            ? crossReferences.value
            : this.crossReferences,
        antonyms: antonyms.present ? antonyms.value : this.antonyms,
      );
  VocabDefinitionsData copyWithCompanion(VocabDefinitionsCompanion data) {
    return VocabDefinitionsData(
      id: data.id.present ? data.id.value : this.id,
      vocabId: data.vocabId.present ? data.vocabId.value : this.vocabId,
      definition:
          data.definition.present ? data.definition.value : this.definition,
      additionalInfo: data.additionalInfo.present
          ? data.additionalInfo.value
          : this.additionalInfo,
      pos: data.pos.present ? data.pos.value : this.pos,
      appliesTo: data.appliesTo.present ? data.appliesTo.value : this.appliesTo,
      fields: data.fields.present ? data.fields.value : this.fields,
      miscInfo: data.miscInfo.present ? data.miscInfo.value : this.miscInfo,
      dialects: data.dialects.present ? data.dialects.value : this.dialects,
      examples: data.examples.present ? data.examples.value : this.examples,
      languageSource: data.languageSource.present
          ? data.languageSource.value
          : this.languageSource,
      waseieigo: data.waseieigo.present ? data.waseieigo.value : this.waseieigo,
      crossReferences: data.crossReferences.present
          ? data.crossReferences.value
          : this.crossReferences,
      antonyms: data.antonyms.present ? data.antonyms.value : this.antonyms,
    );
  }

  @override
  String toString() {
    return (StringBuffer('VocabDefinitionsData(')
          ..write('id: $id, ')
          ..write('vocabId: $vocabId, ')
          ..write('definition: $definition, ')
          ..write('additionalInfo: $additionalInfo, ')
          ..write('pos: $pos, ')
          ..write('appliesTo: $appliesTo, ')
          ..write('fields: $fields, ')
          ..write('miscInfo: $miscInfo, ')
          ..write('dialects: $dialects, ')
          ..write('examples: $examples, ')
          ..write('languageSource: $languageSource, ')
          ..write('waseieigo: $waseieigo, ')
          ..write('crossReferences: $crossReferences, ')
          ..write('antonyms: $antonyms')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      vocabId,
      definition,
      additionalInfo,
      pos,
      appliesTo,
      fields,
      miscInfo,
      dialects,
      examples,
      languageSource,
      waseieigo,
      crossReferences,
      antonyms);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is VocabDefinitionsData &&
          other.id == this.id &&
          other.vocabId == this.vocabId &&
          other.definition == this.definition &&
          other.additionalInfo == this.additionalInfo &&
          other.pos == this.pos &&
          other.appliesTo == this.appliesTo &&
          other.fields == this.fields &&
          other.miscInfo == this.miscInfo &&
          other.dialects == this.dialects &&
          other.examples == this.examples &&
          other.languageSource == this.languageSource &&
          other.waseieigo == this.waseieigo &&
          other.crossReferences == this.crossReferences &&
          other.antonyms == this.antonyms);
}

class VocabDefinitionsCompanion extends UpdateCompanion<VocabDefinitionsData> {
  final Value<int> id;
  final Value<int> vocabId;
  final Value<String> definition;
  final Value<String?> additionalInfo;
  final Value<String?> pos;
  final Value<String?> appliesTo;
  final Value<String?> fields;
  final Value<String?> miscInfo;
  final Value<String?> dialects;
  final Value<String?> examples;
  final Value<String?> languageSource;
  final Value<bool> waseieigo;
  final Value<String?> crossReferences;
  final Value<String?> antonyms;
  const VocabDefinitionsCompanion({
    this.id = const Value.absent(),
    this.vocabId = const Value.absent(),
    this.definition = const Value.absent(),
    this.additionalInfo = const Value.absent(),
    this.pos = const Value.absent(),
    this.appliesTo = const Value.absent(),
    this.fields = const Value.absent(),
    this.miscInfo = const Value.absent(),
    this.dialects = const Value.absent(),
    this.examples = const Value.absent(),
    this.languageSource = const Value.absent(),
    this.waseieigo = const Value.absent(),
    this.crossReferences = const Value.absent(),
    this.antonyms = const Value.absent(),
  });
  VocabDefinitionsCompanion.insert({
    this.id = const Value.absent(),
    required int vocabId,
    required String definition,
    this.additionalInfo = const Value.absent(),
    this.pos = const Value.absent(),
    this.appliesTo = const Value.absent(),
    this.fields = const Value.absent(),
    this.miscInfo = const Value.absent(),
    this.dialects = const Value.absent(),
    this.examples = const Value.absent(),
    this.languageSource = const Value.absent(),
    required bool waseieigo,
    this.crossReferences = const Value.absent(),
    this.antonyms = const Value.absent(),
  })  : vocabId = Value(vocabId),
        definition = Value(definition),
        waseieigo = Value(waseieigo);
  static Insertable<VocabDefinitionsData> custom({
    Expression<int>? id,
    Expression<int>? vocabId,
    Expression<String>? definition,
    Expression<String>? additionalInfo,
    Expression<String>? pos,
    Expression<String>? appliesTo,
    Expression<String>? fields,
    Expression<String>? miscInfo,
    Expression<String>? dialects,
    Expression<String>? examples,
    Expression<String>? languageSource,
    Expression<bool>? waseieigo,
    Expression<String>? crossReferences,
    Expression<String>? antonyms,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (vocabId != null) 'vocab_id': vocabId,
      if (definition != null) 'definition': definition,
      if (additionalInfo != null) 'additional_info': additionalInfo,
      if (pos != null) 'pos': pos,
      if (appliesTo != null) 'applies_to': appliesTo,
      if (fields != null) 'fields': fields,
      if (miscInfo != null) 'misc_info': miscInfo,
      if (dialects != null) 'dialects': dialects,
      if (examples != null) 'examples': examples,
      if (languageSource != null) 'language_source': languageSource,
      if (waseieigo != null) 'waseieigo': waseieigo,
      if (crossReferences != null) 'cross_references': crossReferences,
      if (antonyms != null) 'antonyms': antonyms,
    });
  }

  VocabDefinitionsCompanion copyWith(
      {Value<int>? id,
      Value<int>? vocabId,
      Value<String>? definition,
      Value<String?>? additionalInfo,
      Value<String?>? pos,
      Value<String?>? appliesTo,
      Value<String?>? fields,
      Value<String?>? miscInfo,
      Value<String?>? dialects,
      Value<String?>? examples,
      Value<String?>? languageSource,
      Value<bool>? waseieigo,
      Value<String?>? crossReferences,
      Value<String?>? antonyms}) {
    return VocabDefinitionsCompanion(
      id: id ?? this.id,
      vocabId: vocabId ?? this.vocabId,
      definition: definition ?? this.definition,
      additionalInfo: additionalInfo ?? this.additionalInfo,
      pos: pos ?? this.pos,
      appliesTo: appliesTo ?? this.appliesTo,
      fields: fields ?? this.fields,
      miscInfo: miscInfo ?? this.miscInfo,
      dialects: dialects ?? this.dialects,
      examples: examples ?? this.examples,
      languageSource: languageSource ?? this.languageSource,
      waseieigo: waseieigo ?? this.waseieigo,
      crossReferences: crossReferences ?? this.crossReferences,
      antonyms: antonyms ?? this.antonyms,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (vocabId.present) {
      map['vocab_id'] = Variable<int>(vocabId.value);
    }
    if (definition.present) {
      map['definition'] = Variable<String>(definition.value);
    }
    if (additionalInfo.present) {
      map['additional_info'] = Variable<String>(additionalInfo.value);
    }
    if (pos.present) {
      map['pos'] = Variable<String>(pos.value);
    }
    if (appliesTo.present) {
      map['applies_to'] = Variable<String>(appliesTo.value);
    }
    if (fields.present) {
      map['fields'] = Variable<String>(fields.value);
    }
    if (miscInfo.present) {
      map['misc_info'] = Variable<String>(miscInfo.value);
    }
    if (dialects.present) {
      map['dialects'] = Variable<String>(dialects.value);
    }
    if (examples.present) {
      map['examples'] = Variable<String>(examples.value);
    }
    if (languageSource.present) {
      map['language_source'] = Variable<String>(languageSource.value);
    }
    if (waseieigo.present) {
      map['waseieigo'] = Variable<bool>(waseieigo.value);
    }
    if (crossReferences.present) {
      map['cross_references'] = Variable<String>(crossReferences.value);
    }
    if (antonyms.present) {
      map['antonyms'] = Variable<String>(antonyms.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('VocabDefinitionsCompanion(')
          ..write('id: $id, ')
          ..write('vocabId: $vocabId, ')
          ..write('definition: $definition, ')
          ..write('additionalInfo: $additionalInfo, ')
          ..write('pos: $pos, ')
          ..write('appliesTo: $appliesTo, ')
          ..write('fields: $fields, ')
          ..write('miscInfo: $miscInfo, ')
          ..write('dialects: $dialects, ')
          ..write('examples: $examples, ')
          ..write('languageSource: $languageSource, ')
          ..write('waseieigo: $waseieigo, ')
          ..write('crossReferences: $crossReferences, ')
          ..write('antonyms: $antonyms')
          ..write(')'))
        .toString();
  }
}

class VocabDefinitionWords extends Table
    with TableInfo<VocabDefinitionWords, VocabDefinitionWordsData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  VocabDefinitionWords(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  late final GeneratedColumn<String> word = GeneratedColumn<String>(
      'word', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<int> vocabId = GeneratedColumn<int>(
      'vocab_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, word, vocabId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'vocab_definition_words';
  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  VocabDefinitionWordsData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return VocabDefinitionWordsData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      word: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}word'])!,
      vocabId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}vocab_id'])!,
    );
  }

  @override
  VocabDefinitionWords createAlias(String alias) {
    return VocabDefinitionWords(attachedDatabase, alias);
  }
}

class VocabDefinitionWordsData extends DataClass
    implements Insertable<VocabDefinitionWordsData> {
  final int id;
  final String word;
  final int vocabId;
  const VocabDefinitionWordsData(
      {required this.id, required this.word, required this.vocabId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['word'] = Variable<String>(word);
    map['vocab_id'] = Variable<int>(vocabId);
    return map;
  }

  VocabDefinitionWordsCompanion toCompanion(bool nullToAbsent) {
    return VocabDefinitionWordsCompanion(
      id: Value(id),
      word: Value(word),
      vocabId: Value(vocabId),
    );
  }

  factory VocabDefinitionWordsData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return VocabDefinitionWordsData(
      id: serializer.fromJson<int>(json['id']),
      word: serializer.fromJson<String>(json['word']),
      vocabId: serializer.fromJson<int>(json['vocabId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'word': serializer.toJson<String>(word),
      'vocabId': serializer.toJson<int>(vocabId),
    };
  }

  VocabDefinitionWordsData copyWith({int? id, String? word, int? vocabId}) =>
      VocabDefinitionWordsData(
        id: id ?? this.id,
        word: word ?? this.word,
        vocabId: vocabId ?? this.vocabId,
      );
  VocabDefinitionWordsData copyWithCompanion(
      VocabDefinitionWordsCompanion data) {
    return VocabDefinitionWordsData(
      id: data.id.present ? data.id.value : this.id,
      word: data.word.present ? data.word.value : this.word,
      vocabId: data.vocabId.present ? data.vocabId.value : this.vocabId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('VocabDefinitionWordsData(')
          ..write('id: $id, ')
          ..write('word: $word, ')
          ..write('vocabId: $vocabId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, word, vocabId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is VocabDefinitionWordsData &&
          other.id == this.id &&
          other.word == this.word &&
          other.vocabId == this.vocabId);
}

class VocabDefinitionWordsCompanion
    extends UpdateCompanion<VocabDefinitionWordsData> {
  final Value<int> id;
  final Value<String> word;
  final Value<int> vocabId;
  const VocabDefinitionWordsCompanion({
    this.id = const Value.absent(),
    this.word = const Value.absent(),
    this.vocabId = const Value.absent(),
  });
  VocabDefinitionWordsCompanion.insert({
    this.id = const Value.absent(),
    required String word,
    required int vocabId,
  })  : word = Value(word),
        vocabId = Value(vocabId);
  static Insertable<VocabDefinitionWordsData> custom({
    Expression<int>? id,
    Expression<String>? word,
    Expression<int>? vocabId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (word != null) 'word': word,
      if (vocabId != null) 'vocab_id': vocabId,
    });
  }

  VocabDefinitionWordsCompanion copyWith(
      {Value<int>? id, Value<String>? word, Value<int>? vocabId}) {
    return VocabDefinitionWordsCompanion(
      id: id ?? this.id,
      word: word ?? this.word,
      vocabId: vocabId ?? this.vocabId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (word.present) {
      map['word'] = Variable<String>(word.value);
    }
    if (vocabId.present) {
      map['vocab_id'] = Variable<int>(vocabId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('VocabDefinitionWordsCompanion(')
          ..write('id: $id, ')
          ..write('word: $word, ')
          ..write('vocabId: $vocabId')
          ..write(')'))
        .toString();
  }
}

class Kanjis extends Table with TableInfo<Kanjis, KanjisData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Kanjis(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  late final GeneratedColumn<String> kanji = GeneratedColumn<String>(
      'kanji', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<String> radical = GeneratedColumn<String>(
      'radical', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<String> components = GeneratedColumn<String>(
      'components', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  late final GeneratedColumn<int> grade = GeneratedColumn<int>(
      'grade', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  late final GeneratedColumn<int> strokeCount = GeneratedColumn<int>(
      'stroke_count', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  late final GeneratedColumn<int> frequency = GeneratedColumn<int>(
      'frequency', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  late final GeneratedColumn<int> jlpt = GeneratedColumn<int>(
      'jlpt', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  late final GeneratedColumn<String> meaning = GeneratedColumn<String>(
      'meaning', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  late final GeneratedColumn<String> strokes = GeneratedColumn<String>(
      'strokes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  late final GeneratedColumn<String> compounds = GeneratedColumn<String>(
      'compounds', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        kanji,
        radical,
        components,
        grade,
        strokeCount,
        frequency,
        jlpt,
        meaning,
        strokes,
        compounds
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'kanjis';
  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  KanjisData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return KanjisData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      kanji: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}kanji'])!,
      radical: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}radical'])!,
      components: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}components']),
      grade: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}grade']),
      strokeCount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}stroke_count'])!,
      frequency: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}frequency']),
      jlpt: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}jlpt']),
      meaning: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}meaning']),
      strokes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}strokes']),
      compounds: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}compounds']),
    );
  }

  @override
  Kanjis createAlias(String alias) {
    return Kanjis(attachedDatabase, alias);
  }
}

class KanjisData extends DataClass implements Insertable<KanjisData> {
  final int id;
  final String kanji;
  final String radical;
  final String? components;
  final int? grade;
  final int strokeCount;
  final int? frequency;
  final int? jlpt;
  final String? meaning;
  final String? strokes;
  final String? compounds;
  const KanjisData(
      {required this.id,
      required this.kanji,
      required this.radical,
      this.components,
      this.grade,
      required this.strokeCount,
      this.frequency,
      this.jlpt,
      this.meaning,
      this.strokes,
      this.compounds});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['kanji'] = Variable<String>(kanji);
    map['radical'] = Variable<String>(radical);
    if (!nullToAbsent || components != null) {
      map['components'] = Variable<String>(components);
    }
    if (!nullToAbsent || grade != null) {
      map['grade'] = Variable<int>(grade);
    }
    map['stroke_count'] = Variable<int>(strokeCount);
    if (!nullToAbsent || frequency != null) {
      map['frequency'] = Variable<int>(frequency);
    }
    if (!nullToAbsent || jlpt != null) {
      map['jlpt'] = Variable<int>(jlpt);
    }
    if (!nullToAbsent || meaning != null) {
      map['meaning'] = Variable<String>(meaning);
    }
    if (!nullToAbsent || strokes != null) {
      map['strokes'] = Variable<String>(strokes);
    }
    if (!nullToAbsent || compounds != null) {
      map['compounds'] = Variable<String>(compounds);
    }
    return map;
  }

  KanjisCompanion toCompanion(bool nullToAbsent) {
    return KanjisCompanion(
      id: Value(id),
      kanji: Value(kanji),
      radical: Value(radical),
      components: components == null && nullToAbsent
          ? const Value.absent()
          : Value(components),
      grade:
          grade == null && nullToAbsent ? const Value.absent() : Value(grade),
      strokeCount: Value(strokeCount),
      frequency: frequency == null && nullToAbsent
          ? const Value.absent()
          : Value(frequency),
      jlpt: jlpt == null && nullToAbsent ? const Value.absent() : Value(jlpt),
      meaning: meaning == null && nullToAbsent
          ? const Value.absent()
          : Value(meaning),
      strokes: strokes == null && nullToAbsent
          ? const Value.absent()
          : Value(strokes),
      compounds: compounds == null && nullToAbsent
          ? const Value.absent()
          : Value(compounds),
    );
  }

  factory KanjisData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return KanjisData(
      id: serializer.fromJson<int>(json['id']),
      kanji: serializer.fromJson<String>(json['kanji']),
      radical: serializer.fromJson<String>(json['radical']),
      components: serializer.fromJson<String?>(json['components']),
      grade: serializer.fromJson<int?>(json['grade']),
      strokeCount: serializer.fromJson<int>(json['strokeCount']),
      frequency: serializer.fromJson<int?>(json['frequency']),
      jlpt: serializer.fromJson<int?>(json['jlpt']),
      meaning: serializer.fromJson<String?>(json['meaning']),
      strokes: serializer.fromJson<String?>(json['strokes']),
      compounds: serializer.fromJson<String?>(json['compounds']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'kanji': serializer.toJson<String>(kanji),
      'radical': serializer.toJson<String>(radical),
      'components': serializer.toJson<String?>(components),
      'grade': serializer.toJson<int?>(grade),
      'strokeCount': serializer.toJson<int>(strokeCount),
      'frequency': serializer.toJson<int?>(frequency),
      'jlpt': serializer.toJson<int?>(jlpt),
      'meaning': serializer.toJson<String?>(meaning),
      'strokes': serializer.toJson<String?>(strokes),
      'compounds': serializer.toJson<String?>(compounds),
    };
  }

  KanjisData copyWith(
          {int? id,
          String? kanji,
          String? radical,
          Value<String?> components = const Value.absent(),
          Value<int?> grade = const Value.absent(),
          int? strokeCount,
          Value<int?> frequency = const Value.absent(),
          Value<int?> jlpt = const Value.absent(),
          Value<String?> meaning = const Value.absent(),
          Value<String?> strokes = const Value.absent(),
          Value<String?> compounds = const Value.absent()}) =>
      KanjisData(
        id: id ?? this.id,
        kanji: kanji ?? this.kanji,
        radical: radical ?? this.radical,
        components: components.present ? components.value : this.components,
        grade: grade.present ? grade.value : this.grade,
        strokeCount: strokeCount ?? this.strokeCount,
        frequency: frequency.present ? frequency.value : this.frequency,
        jlpt: jlpt.present ? jlpt.value : this.jlpt,
        meaning: meaning.present ? meaning.value : this.meaning,
        strokes: strokes.present ? strokes.value : this.strokes,
        compounds: compounds.present ? compounds.value : this.compounds,
      );
  KanjisData copyWithCompanion(KanjisCompanion data) {
    return KanjisData(
      id: data.id.present ? data.id.value : this.id,
      kanji: data.kanji.present ? data.kanji.value : this.kanji,
      radical: data.radical.present ? data.radical.value : this.radical,
      components:
          data.components.present ? data.components.value : this.components,
      grade: data.grade.present ? data.grade.value : this.grade,
      strokeCount:
          data.strokeCount.present ? data.strokeCount.value : this.strokeCount,
      frequency: data.frequency.present ? data.frequency.value : this.frequency,
      jlpt: data.jlpt.present ? data.jlpt.value : this.jlpt,
      meaning: data.meaning.present ? data.meaning.value : this.meaning,
      strokes: data.strokes.present ? data.strokes.value : this.strokes,
      compounds: data.compounds.present ? data.compounds.value : this.compounds,
    );
  }

  @override
  String toString() {
    return (StringBuffer('KanjisData(')
          ..write('id: $id, ')
          ..write('kanji: $kanji, ')
          ..write('radical: $radical, ')
          ..write('components: $components, ')
          ..write('grade: $grade, ')
          ..write('strokeCount: $strokeCount, ')
          ..write('frequency: $frequency, ')
          ..write('jlpt: $jlpt, ')
          ..write('meaning: $meaning, ')
          ..write('strokes: $strokes, ')
          ..write('compounds: $compounds')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, kanji, radical, components, grade,
      strokeCount, frequency, jlpt, meaning, strokes, compounds);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is KanjisData &&
          other.id == this.id &&
          other.kanji == this.kanji &&
          other.radical == this.radical &&
          other.components == this.components &&
          other.grade == this.grade &&
          other.strokeCount == this.strokeCount &&
          other.frequency == this.frequency &&
          other.jlpt == this.jlpt &&
          other.meaning == this.meaning &&
          other.strokes == this.strokes &&
          other.compounds == this.compounds);
}

class KanjisCompanion extends UpdateCompanion<KanjisData> {
  final Value<int> id;
  final Value<String> kanji;
  final Value<String> radical;
  final Value<String?> components;
  final Value<int?> grade;
  final Value<int> strokeCount;
  final Value<int?> frequency;
  final Value<int?> jlpt;
  final Value<String?> meaning;
  final Value<String?> strokes;
  final Value<String?> compounds;
  const KanjisCompanion({
    this.id = const Value.absent(),
    this.kanji = const Value.absent(),
    this.radical = const Value.absent(),
    this.components = const Value.absent(),
    this.grade = const Value.absent(),
    this.strokeCount = const Value.absent(),
    this.frequency = const Value.absent(),
    this.jlpt = const Value.absent(),
    this.meaning = const Value.absent(),
    this.strokes = const Value.absent(),
    this.compounds = const Value.absent(),
  });
  KanjisCompanion.insert({
    this.id = const Value.absent(),
    required String kanji,
    required String radical,
    this.components = const Value.absent(),
    this.grade = const Value.absent(),
    required int strokeCount,
    this.frequency = const Value.absent(),
    this.jlpt = const Value.absent(),
    this.meaning = const Value.absent(),
    this.strokes = const Value.absent(),
    this.compounds = const Value.absent(),
  })  : kanji = Value(kanji),
        radical = Value(radical),
        strokeCount = Value(strokeCount);
  static Insertable<KanjisData> custom({
    Expression<int>? id,
    Expression<String>? kanji,
    Expression<String>? radical,
    Expression<String>? components,
    Expression<int>? grade,
    Expression<int>? strokeCount,
    Expression<int>? frequency,
    Expression<int>? jlpt,
    Expression<String>? meaning,
    Expression<String>? strokes,
    Expression<String>? compounds,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (kanji != null) 'kanji': kanji,
      if (radical != null) 'radical': radical,
      if (components != null) 'components': components,
      if (grade != null) 'grade': grade,
      if (strokeCount != null) 'stroke_count': strokeCount,
      if (frequency != null) 'frequency': frequency,
      if (jlpt != null) 'jlpt': jlpt,
      if (meaning != null) 'meaning': meaning,
      if (strokes != null) 'strokes': strokes,
      if (compounds != null) 'compounds': compounds,
    });
  }

  KanjisCompanion copyWith(
      {Value<int>? id,
      Value<String>? kanji,
      Value<String>? radical,
      Value<String?>? components,
      Value<int?>? grade,
      Value<int>? strokeCount,
      Value<int?>? frequency,
      Value<int?>? jlpt,
      Value<String?>? meaning,
      Value<String?>? strokes,
      Value<String?>? compounds}) {
    return KanjisCompanion(
      id: id ?? this.id,
      kanji: kanji ?? this.kanji,
      radical: radical ?? this.radical,
      components: components ?? this.components,
      grade: grade ?? this.grade,
      strokeCount: strokeCount ?? this.strokeCount,
      frequency: frequency ?? this.frequency,
      jlpt: jlpt ?? this.jlpt,
      meaning: meaning ?? this.meaning,
      strokes: strokes ?? this.strokes,
      compounds: compounds ?? this.compounds,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (kanji.present) {
      map['kanji'] = Variable<String>(kanji.value);
    }
    if (radical.present) {
      map['radical'] = Variable<String>(radical.value);
    }
    if (components.present) {
      map['components'] = Variable<String>(components.value);
    }
    if (grade.present) {
      map['grade'] = Variable<int>(grade.value);
    }
    if (strokeCount.present) {
      map['stroke_count'] = Variable<int>(strokeCount.value);
    }
    if (frequency.present) {
      map['frequency'] = Variable<int>(frequency.value);
    }
    if (jlpt.present) {
      map['jlpt'] = Variable<int>(jlpt.value);
    }
    if (meaning.present) {
      map['meaning'] = Variable<String>(meaning.value);
    }
    if (strokes.present) {
      map['strokes'] = Variable<String>(strokes.value);
    }
    if (compounds.present) {
      map['compounds'] = Variable<String>(compounds.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('KanjisCompanion(')
          ..write('id: $id, ')
          ..write('kanji: $kanji, ')
          ..write('radical: $radical, ')
          ..write('components: $components, ')
          ..write('grade: $grade, ')
          ..write('strokeCount: $strokeCount, ')
          ..write('frequency: $frequency, ')
          ..write('jlpt: $jlpt, ')
          ..write('meaning: $meaning, ')
          ..write('strokes: $strokes, ')
          ..write('compounds: $compounds')
          ..write(')'))
        .toString();
  }
}

class KanjiReadings extends Table
    with TableInfo<KanjiReadings, KanjiReadingsData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  KanjiReadings(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  late final GeneratedColumn<int> kanjiId = GeneratedColumn<int>(
      'kanji_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  late final GeneratedColumn<String> reading = GeneratedColumn<String>(
      'reading', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<String> readingSearchForm =
      GeneratedColumn<String>('reading_search_form', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  late final GeneratedColumn<String> readingRomaji = GeneratedColumn<String>(
      'reading_romaji', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<String> readingRomajiSimplified =
      GeneratedColumn<String>('reading_romaji_simplified', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  late final GeneratedColumn<int> type = GeneratedColumn<int>(
      'type', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        kanjiId,
        reading,
        readingSearchForm,
        readingRomaji,
        readingRomajiSimplified,
        type
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'kanji_readings';
  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  KanjiReadingsData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return KanjiReadingsData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      kanjiId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}kanji_id'])!,
      reading: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}reading'])!,
      readingSearchForm: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}reading_search_form']),
      readingRomaji: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}reading_romaji'])!,
      readingRomajiSimplified: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}reading_romaji_simplified']),
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}type'])!,
    );
  }

  @override
  KanjiReadings createAlias(String alias) {
    return KanjiReadings(attachedDatabase, alias);
  }
}

class KanjiReadingsData extends DataClass
    implements Insertable<KanjiReadingsData> {
  final int id;
  final int kanjiId;
  final String reading;
  final String? readingSearchForm;
  final String readingRomaji;
  final String? readingRomajiSimplified;
  final int type;
  const KanjiReadingsData(
      {required this.id,
      required this.kanjiId,
      required this.reading,
      this.readingSearchForm,
      required this.readingRomaji,
      this.readingRomajiSimplified,
      required this.type});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['kanji_id'] = Variable<int>(kanjiId);
    map['reading'] = Variable<String>(reading);
    if (!nullToAbsent || readingSearchForm != null) {
      map['reading_search_form'] = Variable<String>(readingSearchForm);
    }
    map['reading_romaji'] = Variable<String>(readingRomaji);
    if (!nullToAbsent || readingRomajiSimplified != null) {
      map['reading_romaji_simplified'] =
          Variable<String>(readingRomajiSimplified);
    }
    map['type'] = Variable<int>(type);
    return map;
  }

  KanjiReadingsCompanion toCompanion(bool nullToAbsent) {
    return KanjiReadingsCompanion(
      id: Value(id),
      kanjiId: Value(kanjiId),
      reading: Value(reading),
      readingSearchForm: readingSearchForm == null && nullToAbsent
          ? const Value.absent()
          : Value(readingSearchForm),
      readingRomaji: Value(readingRomaji),
      readingRomajiSimplified: readingRomajiSimplified == null && nullToAbsent
          ? const Value.absent()
          : Value(readingRomajiSimplified),
      type: Value(type),
    );
  }

  factory KanjiReadingsData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return KanjiReadingsData(
      id: serializer.fromJson<int>(json['id']),
      kanjiId: serializer.fromJson<int>(json['kanjiId']),
      reading: serializer.fromJson<String>(json['reading']),
      readingSearchForm:
          serializer.fromJson<String?>(json['readingSearchForm']),
      readingRomaji: serializer.fromJson<String>(json['readingRomaji']),
      readingRomajiSimplified:
          serializer.fromJson<String?>(json['readingRomajiSimplified']),
      type: serializer.fromJson<int>(json['type']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'kanjiId': serializer.toJson<int>(kanjiId),
      'reading': serializer.toJson<String>(reading),
      'readingSearchForm': serializer.toJson<String?>(readingSearchForm),
      'readingRomaji': serializer.toJson<String>(readingRomaji),
      'readingRomajiSimplified':
          serializer.toJson<String?>(readingRomajiSimplified),
      'type': serializer.toJson<int>(type),
    };
  }

  KanjiReadingsData copyWith(
          {int? id,
          int? kanjiId,
          String? reading,
          Value<String?> readingSearchForm = const Value.absent(),
          String? readingRomaji,
          Value<String?> readingRomajiSimplified = const Value.absent(),
          int? type}) =>
      KanjiReadingsData(
        id: id ?? this.id,
        kanjiId: kanjiId ?? this.kanjiId,
        reading: reading ?? this.reading,
        readingSearchForm: readingSearchForm.present
            ? readingSearchForm.value
            : this.readingSearchForm,
        readingRomaji: readingRomaji ?? this.readingRomaji,
        readingRomajiSimplified: readingRomajiSimplified.present
            ? readingRomajiSimplified.value
            : this.readingRomajiSimplified,
        type: type ?? this.type,
      );
  KanjiReadingsData copyWithCompanion(KanjiReadingsCompanion data) {
    return KanjiReadingsData(
      id: data.id.present ? data.id.value : this.id,
      kanjiId: data.kanjiId.present ? data.kanjiId.value : this.kanjiId,
      reading: data.reading.present ? data.reading.value : this.reading,
      readingSearchForm: data.readingSearchForm.present
          ? data.readingSearchForm.value
          : this.readingSearchForm,
      readingRomaji: data.readingRomaji.present
          ? data.readingRomaji.value
          : this.readingRomaji,
      readingRomajiSimplified: data.readingRomajiSimplified.present
          ? data.readingRomajiSimplified.value
          : this.readingRomajiSimplified,
      type: data.type.present ? data.type.value : this.type,
    );
  }

  @override
  String toString() {
    return (StringBuffer('KanjiReadingsData(')
          ..write('id: $id, ')
          ..write('kanjiId: $kanjiId, ')
          ..write('reading: $reading, ')
          ..write('readingSearchForm: $readingSearchForm, ')
          ..write('readingRomaji: $readingRomaji, ')
          ..write('readingRomajiSimplified: $readingRomajiSimplified, ')
          ..write('type: $type')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, kanjiId, reading, readingSearchForm,
      readingRomaji, readingRomajiSimplified, type);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is KanjiReadingsData &&
          other.id == this.id &&
          other.kanjiId == this.kanjiId &&
          other.reading == this.reading &&
          other.readingSearchForm == this.readingSearchForm &&
          other.readingRomaji == this.readingRomaji &&
          other.readingRomajiSimplified == this.readingRomajiSimplified &&
          other.type == this.type);
}

class KanjiReadingsCompanion extends UpdateCompanion<KanjiReadingsData> {
  final Value<int> id;
  final Value<int> kanjiId;
  final Value<String> reading;
  final Value<String?> readingSearchForm;
  final Value<String> readingRomaji;
  final Value<String?> readingRomajiSimplified;
  final Value<int> type;
  const KanjiReadingsCompanion({
    this.id = const Value.absent(),
    this.kanjiId = const Value.absent(),
    this.reading = const Value.absent(),
    this.readingSearchForm = const Value.absent(),
    this.readingRomaji = const Value.absent(),
    this.readingRomajiSimplified = const Value.absent(),
    this.type = const Value.absent(),
  });
  KanjiReadingsCompanion.insert({
    this.id = const Value.absent(),
    required int kanjiId,
    required String reading,
    this.readingSearchForm = const Value.absent(),
    required String readingRomaji,
    this.readingRomajiSimplified = const Value.absent(),
    required int type,
  })  : kanjiId = Value(kanjiId),
        reading = Value(reading),
        readingRomaji = Value(readingRomaji),
        type = Value(type);
  static Insertable<KanjiReadingsData> custom({
    Expression<int>? id,
    Expression<int>? kanjiId,
    Expression<String>? reading,
    Expression<String>? readingSearchForm,
    Expression<String>? readingRomaji,
    Expression<String>? readingRomajiSimplified,
    Expression<int>? type,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (kanjiId != null) 'kanji_id': kanjiId,
      if (reading != null) 'reading': reading,
      if (readingSearchForm != null) 'reading_search_form': readingSearchForm,
      if (readingRomaji != null) 'reading_romaji': readingRomaji,
      if (readingRomajiSimplified != null)
        'reading_romaji_simplified': readingRomajiSimplified,
      if (type != null) 'type': type,
    });
  }

  KanjiReadingsCompanion copyWith(
      {Value<int>? id,
      Value<int>? kanjiId,
      Value<String>? reading,
      Value<String?>? readingSearchForm,
      Value<String>? readingRomaji,
      Value<String?>? readingRomajiSimplified,
      Value<int>? type}) {
    return KanjiReadingsCompanion(
      id: id ?? this.id,
      kanjiId: kanjiId ?? this.kanjiId,
      reading: reading ?? this.reading,
      readingSearchForm: readingSearchForm ?? this.readingSearchForm,
      readingRomaji: readingRomaji ?? this.readingRomaji,
      readingRomajiSimplified:
          readingRomajiSimplified ?? this.readingRomajiSimplified,
      type: type ?? this.type,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (kanjiId.present) {
      map['kanji_id'] = Variable<int>(kanjiId.value);
    }
    if (reading.present) {
      map['reading'] = Variable<String>(reading.value);
    }
    if (readingSearchForm.present) {
      map['reading_search_form'] = Variable<String>(readingSearchForm.value);
    }
    if (readingRomaji.present) {
      map['reading_romaji'] = Variable<String>(readingRomaji.value);
    }
    if (readingRomajiSimplified.present) {
      map['reading_romaji_simplified'] =
          Variable<String>(readingRomajiSimplified.value);
    }
    if (type.present) {
      map['type'] = Variable<int>(type.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('KanjiReadingsCompanion(')
          ..write('id: $id, ')
          ..write('kanjiId: $kanjiId, ')
          ..write('reading: $reading, ')
          ..write('readingSearchForm: $readingSearchForm, ')
          ..write('readingRomaji: $readingRomaji, ')
          ..write('readingRomajiSimplified: $readingRomajiSimplified, ')
          ..write('type: $type')
          ..write(')'))
        .toString();
  }
}

class KanjiMeaningWords extends Table
    with TableInfo<KanjiMeaningWords, KanjiMeaningWordsData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  KanjiMeaningWords(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  late final GeneratedColumn<String> word = GeneratedColumn<String>(
      'word', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<int> kanjiId = GeneratedColumn<int>(
      'kanji_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, word, kanjiId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'kanji_meaning_words';
  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  KanjiMeaningWordsData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return KanjiMeaningWordsData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      word: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}word'])!,
      kanjiId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}kanji_id'])!,
    );
  }

  @override
  KanjiMeaningWords createAlias(String alias) {
    return KanjiMeaningWords(attachedDatabase, alias);
  }
}

class KanjiMeaningWordsData extends DataClass
    implements Insertable<KanjiMeaningWordsData> {
  final int id;
  final String word;
  final int kanjiId;
  const KanjiMeaningWordsData(
      {required this.id, required this.word, required this.kanjiId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['word'] = Variable<String>(word);
    map['kanji_id'] = Variable<int>(kanjiId);
    return map;
  }

  KanjiMeaningWordsCompanion toCompanion(bool nullToAbsent) {
    return KanjiMeaningWordsCompanion(
      id: Value(id),
      word: Value(word),
      kanjiId: Value(kanjiId),
    );
  }

  factory KanjiMeaningWordsData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return KanjiMeaningWordsData(
      id: serializer.fromJson<int>(json['id']),
      word: serializer.fromJson<String>(json['word']),
      kanjiId: serializer.fromJson<int>(json['kanjiId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'word': serializer.toJson<String>(word),
      'kanjiId': serializer.toJson<int>(kanjiId),
    };
  }

  KanjiMeaningWordsData copyWith({int? id, String? word, int? kanjiId}) =>
      KanjiMeaningWordsData(
        id: id ?? this.id,
        word: word ?? this.word,
        kanjiId: kanjiId ?? this.kanjiId,
      );
  KanjiMeaningWordsData copyWithCompanion(KanjiMeaningWordsCompanion data) {
    return KanjiMeaningWordsData(
      id: data.id.present ? data.id.value : this.id,
      word: data.word.present ? data.word.value : this.word,
      kanjiId: data.kanjiId.present ? data.kanjiId.value : this.kanjiId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('KanjiMeaningWordsData(')
          ..write('id: $id, ')
          ..write('word: $word, ')
          ..write('kanjiId: $kanjiId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, word, kanjiId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is KanjiMeaningWordsData &&
          other.id == this.id &&
          other.word == this.word &&
          other.kanjiId == this.kanjiId);
}

class KanjiMeaningWordsCompanion
    extends UpdateCompanion<KanjiMeaningWordsData> {
  final Value<int> id;
  final Value<String> word;
  final Value<int> kanjiId;
  const KanjiMeaningWordsCompanion({
    this.id = const Value.absent(),
    this.word = const Value.absent(),
    this.kanjiId = const Value.absent(),
  });
  KanjiMeaningWordsCompanion.insert({
    this.id = const Value.absent(),
    required String word,
    required int kanjiId,
  })  : word = Value(word),
        kanjiId = Value(kanjiId);
  static Insertable<KanjiMeaningWordsData> custom({
    Expression<int>? id,
    Expression<String>? word,
    Expression<int>? kanjiId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (word != null) 'word': word,
      if (kanjiId != null) 'kanji_id': kanjiId,
    });
  }

  KanjiMeaningWordsCompanion copyWith(
      {Value<int>? id, Value<String>? word, Value<int>? kanjiId}) {
    return KanjiMeaningWordsCompanion(
      id: id ?? this.id,
      word: word ?? this.word,
      kanjiId: kanjiId ?? this.kanjiId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (word.present) {
      map['word'] = Variable<String>(word.value);
    }
    if (kanjiId.present) {
      map['kanji_id'] = Variable<int>(kanjiId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('KanjiMeaningWordsCompanion(')
          ..write('id: $id, ')
          ..write('word: $word, ')
          ..write('kanjiId: $kanjiId')
          ..write(')'))
        .toString();
  }
}

class VocabNotes extends Table with TableInfo<VocabNotes, VocabNotesData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  VocabNotes(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
      'note', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, note];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'vocab_notes';
  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  VocabNotesData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return VocabNotesData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      note: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}note'])!,
    );
  }

  @override
  VocabNotes createAlias(String alias) {
    return VocabNotes(attachedDatabase, alias);
  }
}

class VocabNotesData extends DataClass implements Insertable<VocabNotesData> {
  final int id;
  final String note;
  const VocabNotesData({required this.id, required this.note});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['note'] = Variable<String>(note);
    return map;
  }

  VocabNotesCompanion toCompanion(bool nullToAbsent) {
    return VocabNotesCompanion(
      id: Value(id),
      note: Value(note),
    );
  }

  factory VocabNotesData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return VocabNotesData(
      id: serializer.fromJson<int>(json['id']),
      note: serializer.fromJson<String>(json['note']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'note': serializer.toJson<String>(note),
    };
  }

  VocabNotesData copyWith({int? id, String? note}) => VocabNotesData(
        id: id ?? this.id,
        note: note ?? this.note,
      );
  VocabNotesData copyWithCompanion(VocabNotesCompanion data) {
    return VocabNotesData(
      id: data.id.present ? data.id.value : this.id,
      note: data.note.present ? data.note.value : this.note,
    );
  }

  @override
  String toString() {
    return (StringBuffer('VocabNotesData(')
          ..write('id: $id, ')
          ..write('note: $note')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, note);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is VocabNotesData &&
          other.id == this.id &&
          other.note == this.note);
}

class VocabNotesCompanion extends UpdateCompanion<VocabNotesData> {
  final Value<int> id;
  final Value<String> note;
  const VocabNotesCompanion({
    this.id = const Value.absent(),
    this.note = const Value.absent(),
  });
  VocabNotesCompanion.insert({
    this.id = const Value.absent(),
    required String note,
  }) : note = Value(note);
  static Insertable<VocabNotesData> custom({
    Expression<int>? id,
    Expression<String>? note,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (note != null) 'note': note,
    });
  }

  VocabNotesCompanion copyWith({Value<int>? id, Value<String>? note}) {
    return VocabNotesCompanion(
      id: id ?? this.id,
      note: note ?? this.note,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('VocabNotesCompanion(')
          ..write('id: $id, ')
          ..write('note: $note')
          ..write(')'))
        .toString();
  }
}

class TextAnalysisHistoryItems extends Table
    with TableInfo<TextAnalysisHistoryItems, TextAnalysisHistoryItemsData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  TextAnalysisHistoryItems(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  late final GeneratedColumn<String> analysisText = GeneratedColumn<String>(
      'analysis_text', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, analysisText];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'text_analysis_history_items';
  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TextAnalysisHistoryItemsData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TextAnalysisHistoryItemsData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      analysisText: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}analysis_text'])!,
    );
  }

  @override
  TextAnalysisHistoryItems createAlias(String alias) {
    return TextAnalysisHistoryItems(attachedDatabase, alias);
  }
}

class TextAnalysisHistoryItemsData extends DataClass
    implements Insertable<TextAnalysisHistoryItemsData> {
  final int id;
  final String analysisText;
  const TextAnalysisHistoryItemsData(
      {required this.id, required this.analysisText});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['analysis_text'] = Variable<String>(analysisText);
    return map;
  }

  TextAnalysisHistoryItemsCompanion toCompanion(bool nullToAbsent) {
    return TextAnalysisHistoryItemsCompanion(
      id: Value(id),
      analysisText: Value(analysisText),
    );
  }

  factory TextAnalysisHistoryItemsData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TextAnalysisHistoryItemsData(
      id: serializer.fromJson<int>(json['id']),
      analysisText: serializer.fromJson<String>(json['analysisText']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'analysisText': serializer.toJson<String>(analysisText),
    };
  }

  TextAnalysisHistoryItemsData copyWith({int? id, String? analysisText}) =>
      TextAnalysisHistoryItemsData(
        id: id ?? this.id,
        analysisText: analysisText ?? this.analysisText,
      );
  TextAnalysisHistoryItemsData copyWithCompanion(
      TextAnalysisHistoryItemsCompanion data) {
    return TextAnalysisHistoryItemsData(
      id: data.id.present ? data.id.value : this.id,
      analysisText: data.analysisText.present
          ? data.analysisText.value
          : this.analysisText,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TextAnalysisHistoryItemsData(')
          ..write('id: $id, ')
          ..write('analysisText: $analysisText')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, analysisText);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TextAnalysisHistoryItemsData &&
          other.id == this.id &&
          other.analysisText == this.analysisText);
}

class TextAnalysisHistoryItemsCompanion
    extends UpdateCompanion<TextAnalysisHistoryItemsData> {
  final Value<int> id;
  final Value<String> analysisText;
  const TextAnalysisHistoryItemsCompanion({
    this.id = const Value.absent(),
    this.analysisText = const Value.absent(),
  });
  TextAnalysisHistoryItemsCompanion.insert({
    this.id = const Value.absent(),
    required String analysisText,
  }) : analysisText = Value(analysisText);
  static Insertable<TextAnalysisHistoryItemsData> custom({
    Expression<int>? id,
    Expression<String>? analysisText,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (analysisText != null) 'analysis_text': analysisText,
    });
  }

  TextAnalysisHistoryItemsCompanion copyWith(
      {Value<int>? id, Value<String>? analysisText}) {
    return TextAnalysisHistoryItemsCompanion(
      id: id ?? this.id,
      analysisText: analysisText ?? this.analysisText,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (analysisText.present) {
      map['analysis_text'] = Variable<String>(analysisText.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TextAnalysisHistoryItemsCompanion(')
          ..write('id: $id, ')
          ..write('analysisText: $analysisText')
          ..write(')'))
        .toString();
  }
}

class SpacedRepetitionDatas extends Table
    with TableInfo<SpacedRepetitionDatas, SpacedRepetitionDatasData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  SpacedRepetitionDatas(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<int> vocabId = GeneratedColumn<int>(
      'vocab_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints:
          'NOT NULL DEFAULT 0 CHECK( IIF(vocab_id = 0, 1, 0) + IIF(kanji_id = 0, 1, 0) = 1 )',
      defaultValue: const CustomExpression('0'));
  late final GeneratedColumn<int> kanjiId = GeneratedColumn<int>(
      'kanji_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints:
          'NOT NULL DEFAULT 0 CHECK( IIF(vocab_id = 0, 1, 0) + IIF(kanji_id = 0, 1, 0) = 1 )',
      defaultValue: const CustomExpression('0'));
  late final GeneratedColumn<int> frontType = GeneratedColumn<int>(
      'front_type', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  late final GeneratedColumn<int> interval = GeneratedColumn<int>(
      'interval', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  late final GeneratedColumn<int> repetitions = GeneratedColumn<int>(
      'repetitions', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  late final GeneratedColumn<double> easeFactor = GeneratedColumn<double>(
      'ease_factor', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  late final GeneratedColumn<int> dueDate = GeneratedColumn<int>(
      'due_date', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  late final GeneratedColumn<int> totalAnswers = GeneratedColumn<int>(
      'total_answers', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  late final GeneratedColumn<int> totalWrongAnswers = GeneratedColumn<int>(
      'total_wrong_answers', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        vocabId,
        kanjiId,
        frontType,
        interval,
        repetitions,
        easeFactor,
        dueDate,
        totalAnswers,
        totalWrongAnswers
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'spaced_repetition_datas';
  @override
  Set<GeneratedColumn> get $primaryKey => {vocabId, kanjiId, frontType};
  @override
  SpacedRepetitionDatasData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SpacedRepetitionDatasData(
      vocabId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}vocab_id'])!,
      kanjiId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}kanji_id'])!,
      frontType: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}front_type'])!,
      interval: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}interval'])!,
      repetitions: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}repetitions'])!,
      easeFactor: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}ease_factor'])!,
      dueDate: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}due_date']),
      totalAnswers: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}total_answers'])!,
      totalWrongAnswers: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}total_wrong_answers'])!,
    );
  }

  @override
  SpacedRepetitionDatas createAlias(String alias) {
    return SpacedRepetitionDatas(attachedDatabase, alias);
  }

  @override
  bool get withoutRowId => true;
}

class SpacedRepetitionDatasData extends DataClass
    implements Insertable<SpacedRepetitionDatasData> {
  final int vocabId;
  final int kanjiId;
  final int frontType;
  final int interval;
  final int repetitions;
  final double easeFactor;
  final int? dueDate;
  final int totalAnswers;
  final int totalWrongAnswers;
  const SpacedRepetitionDatasData(
      {required this.vocabId,
      required this.kanjiId,
      required this.frontType,
      required this.interval,
      required this.repetitions,
      required this.easeFactor,
      this.dueDate,
      required this.totalAnswers,
      required this.totalWrongAnswers});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['vocab_id'] = Variable<int>(vocabId);
    map['kanji_id'] = Variable<int>(kanjiId);
    map['front_type'] = Variable<int>(frontType);
    map['interval'] = Variable<int>(interval);
    map['repetitions'] = Variable<int>(repetitions);
    map['ease_factor'] = Variable<double>(easeFactor);
    if (!nullToAbsent || dueDate != null) {
      map['due_date'] = Variable<int>(dueDate);
    }
    map['total_answers'] = Variable<int>(totalAnswers);
    map['total_wrong_answers'] = Variable<int>(totalWrongAnswers);
    return map;
  }

  SpacedRepetitionDatasCompanion toCompanion(bool nullToAbsent) {
    return SpacedRepetitionDatasCompanion(
      vocabId: Value(vocabId),
      kanjiId: Value(kanjiId),
      frontType: Value(frontType),
      interval: Value(interval),
      repetitions: Value(repetitions),
      easeFactor: Value(easeFactor),
      dueDate: dueDate == null && nullToAbsent
          ? const Value.absent()
          : Value(dueDate),
      totalAnswers: Value(totalAnswers),
      totalWrongAnswers: Value(totalWrongAnswers),
    );
  }

  factory SpacedRepetitionDatasData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SpacedRepetitionDatasData(
      vocabId: serializer.fromJson<int>(json['vocabId']),
      kanjiId: serializer.fromJson<int>(json['kanjiId']),
      frontType: serializer.fromJson<int>(json['frontType']),
      interval: serializer.fromJson<int>(json['interval']),
      repetitions: serializer.fromJson<int>(json['repetitions']),
      easeFactor: serializer.fromJson<double>(json['easeFactor']),
      dueDate: serializer.fromJson<int?>(json['dueDate']),
      totalAnswers: serializer.fromJson<int>(json['totalAnswers']),
      totalWrongAnswers: serializer.fromJson<int>(json['totalWrongAnswers']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'vocabId': serializer.toJson<int>(vocabId),
      'kanjiId': serializer.toJson<int>(kanjiId),
      'frontType': serializer.toJson<int>(frontType),
      'interval': serializer.toJson<int>(interval),
      'repetitions': serializer.toJson<int>(repetitions),
      'easeFactor': serializer.toJson<double>(easeFactor),
      'dueDate': serializer.toJson<int?>(dueDate),
      'totalAnswers': serializer.toJson<int>(totalAnswers),
      'totalWrongAnswers': serializer.toJson<int>(totalWrongAnswers),
    };
  }

  SpacedRepetitionDatasData copyWith(
          {int? vocabId,
          int? kanjiId,
          int? frontType,
          int? interval,
          int? repetitions,
          double? easeFactor,
          Value<int?> dueDate = const Value.absent(),
          int? totalAnswers,
          int? totalWrongAnswers}) =>
      SpacedRepetitionDatasData(
        vocabId: vocabId ?? this.vocabId,
        kanjiId: kanjiId ?? this.kanjiId,
        frontType: frontType ?? this.frontType,
        interval: interval ?? this.interval,
        repetitions: repetitions ?? this.repetitions,
        easeFactor: easeFactor ?? this.easeFactor,
        dueDate: dueDate.present ? dueDate.value : this.dueDate,
        totalAnswers: totalAnswers ?? this.totalAnswers,
        totalWrongAnswers: totalWrongAnswers ?? this.totalWrongAnswers,
      );
  SpacedRepetitionDatasData copyWithCompanion(
      SpacedRepetitionDatasCompanion data) {
    return SpacedRepetitionDatasData(
      vocabId: data.vocabId.present ? data.vocabId.value : this.vocabId,
      kanjiId: data.kanjiId.present ? data.kanjiId.value : this.kanjiId,
      frontType: data.frontType.present ? data.frontType.value : this.frontType,
      interval: data.interval.present ? data.interval.value : this.interval,
      repetitions:
          data.repetitions.present ? data.repetitions.value : this.repetitions,
      easeFactor:
          data.easeFactor.present ? data.easeFactor.value : this.easeFactor,
      dueDate: data.dueDate.present ? data.dueDate.value : this.dueDate,
      totalAnswers: data.totalAnswers.present
          ? data.totalAnswers.value
          : this.totalAnswers,
      totalWrongAnswers: data.totalWrongAnswers.present
          ? data.totalWrongAnswers.value
          : this.totalWrongAnswers,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SpacedRepetitionDatasData(')
          ..write('vocabId: $vocabId, ')
          ..write('kanjiId: $kanjiId, ')
          ..write('frontType: $frontType, ')
          ..write('interval: $interval, ')
          ..write('repetitions: $repetitions, ')
          ..write('easeFactor: $easeFactor, ')
          ..write('dueDate: $dueDate, ')
          ..write('totalAnswers: $totalAnswers, ')
          ..write('totalWrongAnswers: $totalWrongAnswers')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(vocabId, kanjiId, frontType, interval,
      repetitions, easeFactor, dueDate, totalAnswers, totalWrongAnswers);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SpacedRepetitionDatasData &&
          other.vocabId == this.vocabId &&
          other.kanjiId == this.kanjiId &&
          other.frontType == this.frontType &&
          other.interval == this.interval &&
          other.repetitions == this.repetitions &&
          other.easeFactor == this.easeFactor &&
          other.dueDate == this.dueDate &&
          other.totalAnswers == this.totalAnswers &&
          other.totalWrongAnswers == this.totalWrongAnswers);
}

class SpacedRepetitionDatasCompanion
    extends UpdateCompanion<SpacedRepetitionDatasData> {
  final Value<int> vocabId;
  final Value<int> kanjiId;
  final Value<int> frontType;
  final Value<int> interval;
  final Value<int> repetitions;
  final Value<double> easeFactor;
  final Value<int?> dueDate;
  final Value<int> totalAnswers;
  final Value<int> totalWrongAnswers;
  const SpacedRepetitionDatasCompanion({
    this.vocabId = const Value.absent(),
    this.kanjiId = const Value.absent(),
    this.frontType = const Value.absent(),
    this.interval = const Value.absent(),
    this.repetitions = const Value.absent(),
    this.easeFactor = const Value.absent(),
    this.dueDate = const Value.absent(),
    this.totalAnswers = const Value.absent(),
    this.totalWrongAnswers = const Value.absent(),
  });
  SpacedRepetitionDatasCompanion.insert({
    this.vocabId = const Value.absent(),
    this.kanjiId = const Value.absent(),
    required int frontType,
    required int interval,
    required int repetitions,
    required double easeFactor,
    this.dueDate = const Value.absent(),
    required int totalAnswers,
    required int totalWrongAnswers,
  })  : frontType = Value(frontType),
        interval = Value(interval),
        repetitions = Value(repetitions),
        easeFactor = Value(easeFactor),
        totalAnswers = Value(totalAnswers),
        totalWrongAnswers = Value(totalWrongAnswers);
  static Insertable<SpacedRepetitionDatasData> custom({
    Expression<int>? vocabId,
    Expression<int>? kanjiId,
    Expression<int>? frontType,
    Expression<int>? interval,
    Expression<int>? repetitions,
    Expression<double>? easeFactor,
    Expression<int>? dueDate,
    Expression<int>? totalAnswers,
    Expression<int>? totalWrongAnswers,
  }) {
    return RawValuesInsertable({
      if (vocabId != null) 'vocab_id': vocabId,
      if (kanjiId != null) 'kanji_id': kanjiId,
      if (frontType != null) 'front_type': frontType,
      if (interval != null) 'interval': interval,
      if (repetitions != null) 'repetitions': repetitions,
      if (easeFactor != null) 'ease_factor': easeFactor,
      if (dueDate != null) 'due_date': dueDate,
      if (totalAnswers != null) 'total_answers': totalAnswers,
      if (totalWrongAnswers != null) 'total_wrong_answers': totalWrongAnswers,
    });
  }

  SpacedRepetitionDatasCompanion copyWith(
      {Value<int>? vocabId,
      Value<int>? kanjiId,
      Value<int>? frontType,
      Value<int>? interval,
      Value<int>? repetitions,
      Value<double>? easeFactor,
      Value<int?>? dueDate,
      Value<int>? totalAnswers,
      Value<int>? totalWrongAnswers}) {
    return SpacedRepetitionDatasCompanion(
      vocabId: vocabId ?? this.vocabId,
      kanjiId: kanjiId ?? this.kanjiId,
      frontType: frontType ?? this.frontType,
      interval: interval ?? this.interval,
      repetitions: repetitions ?? this.repetitions,
      easeFactor: easeFactor ?? this.easeFactor,
      dueDate: dueDate ?? this.dueDate,
      totalAnswers: totalAnswers ?? this.totalAnswers,
      totalWrongAnswers: totalWrongAnswers ?? this.totalWrongAnswers,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (vocabId.present) {
      map['vocab_id'] = Variable<int>(vocabId.value);
    }
    if (kanjiId.present) {
      map['kanji_id'] = Variable<int>(kanjiId.value);
    }
    if (frontType.present) {
      map['front_type'] = Variable<int>(frontType.value);
    }
    if (interval.present) {
      map['interval'] = Variable<int>(interval.value);
    }
    if (repetitions.present) {
      map['repetitions'] = Variable<int>(repetitions.value);
    }
    if (easeFactor.present) {
      map['ease_factor'] = Variable<double>(easeFactor.value);
    }
    if (dueDate.present) {
      map['due_date'] = Variable<int>(dueDate.value);
    }
    if (totalAnswers.present) {
      map['total_answers'] = Variable<int>(totalAnswers.value);
    }
    if (totalWrongAnswers.present) {
      map['total_wrong_answers'] = Variable<int>(totalWrongAnswers.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SpacedRepetitionDatasCompanion(')
          ..write('vocabId: $vocabId, ')
          ..write('kanjiId: $kanjiId, ')
          ..write('frontType: $frontType, ')
          ..write('interval: $interval, ')
          ..write('repetitions: $repetitions, ')
          ..write('easeFactor: $easeFactor, ')
          ..write('dueDate: $dueDate, ')
          ..write('totalAnswers: $totalAnswers, ')
          ..write('totalWrongAnswers: $totalWrongAnswers')
          ..write(')'))
        .toString();
  }
}

class SearchHistoryItems extends Table
    with TableInfo<SearchHistoryItems, SearchHistoryItemsData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  SearchHistoryItems(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  late final GeneratedColumn<String> searchText = GeneratedColumn<String>(
      'search_text', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, searchText];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'search_history_items';
  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SearchHistoryItemsData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SearchHistoryItemsData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      searchText: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}search_text'])!,
    );
  }

  @override
  SearchHistoryItems createAlias(String alias) {
    return SearchHistoryItems(attachedDatabase, alias);
  }
}

class SearchHistoryItemsData extends DataClass
    implements Insertable<SearchHistoryItemsData> {
  final int id;
  final String searchText;
  const SearchHistoryItemsData({required this.id, required this.searchText});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['search_text'] = Variable<String>(searchText);
    return map;
  }

  SearchHistoryItemsCompanion toCompanion(bool nullToAbsent) {
    return SearchHistoryItemsCompanion(
      id: Value(id),
      searchText: Value(searchText),
    );
  }

  factory SearchHistoryItemsData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SearchHistoryItemsData(
      id: serializer.fromJson<int>(json['id']),
      searchText: serializer.fromJson<String>(json['searchText']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'searchText': serializer.toJson<String>(searchText),
    };
  }

  SearchHistoryItemsData copyWith({int? id, String? searchText}) =>
      SearchHistoryItemsData(
        id: id ?? this.id,
        searchText: searchText ?? this.searchText,
      );
  SearchHistoryItemsData copyWithCompanion(SearchHistoryItemsCompanion data) {
    return SearchHistoryItemsData(
      id: data.id.present ? data.id.value : this.id,
      searchText:
          data.searchText.present ? data.searchText.value : this.searchText,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SearchHistoryItemsData(')
          ..write('id: $id, ')
          ..write('searchText: $searchText')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, searchText);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SearchHistoryItemsData &&
          other.id == this.id &&
          other.searchText == this.searchText);
}

class SearchHistoryItemsCompanion
    extends UpdateCompanion<SearchHistoryItemsData> {
  final Value<int> id;
  final Value<String> searchText;
  const SearchHistoryItemsCompanion({
    this.id = const Value.absent(),
    this.searchText = const Value.absent(),
  });
  SearchHistoryItemsCompanion.insert({
    this.id = const Value.absent(),
    required String searchText,
  }) : searchText = Value(searchText);
  static Insertable<SearchHistoryItemsData> custom({
    Expression<int>? id,
    Expression<String>? searchText,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (searchText != null) 'search_text': searchText,
    });
  }

  SearchHistoryItemsCompanion copyWith(
      {Value<int>? id, Value<String>? searchText}) {
    return SearchHistoryItemsCompanion(
      id: id ?? this.id,
      searchText: searchText ?? this.searchText,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (searchText.present) {
      map['search_text'] = Variable<String>(searchText.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SearchHistoryItemsCompanion(')
          ..write('id: $id, ')
          ..write('searchText: $searchText')
          ..write(')'))
        .toString();
  }
}

class Radicals extends Table with TableInfo<Radicals, RadicalsData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Radicals(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  late final GeneratedColumn<String> radical = GeneratedColumn<String>(
      'radical', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<int> kangxiId = GeneratedColumn<int>(
      'kangxi_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  late final GeneratedColumn<int> strokeCount = GeneratedColumn<int>(
      'stroke_count', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  late final GeneratedColumn<String> meaning = GeneratedColumn<String>(
      'meaning', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<String> reading = GeneratedColumn<String>(
      'reading', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<int> position = GeneratedColumn<int>(
      'position', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  late final GeneratedColumn<int> importance = GeneratedColumn<int>(
      'importance', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  late final GeneratedColumn<String> strokes = GeneratedColumn<String>(
      'strokes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  late final GeneratedColumn<String> variants = GeneratedColumn<String>(
      'variants', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  late final GeneratedColumn<String> variantOf = GeneratedColumn<String>(
      'variant_of', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        radical,
        kangxiId,
        strokeCount,
        meaning,
        reading,
        position,
        importance,
        strokes,
        variants,
        variantOf
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'radicals';
  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RadicalsData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RadicalsData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      radical: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}radical'])!,
      kangxiId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}kangxi_id']),
      strokeCount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}stroke_count'])!,
      meaning: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}meaning'])!,
      reading: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}reading'])!,
      position: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}position']),
      importance: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}importance']),
      strokes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}strokes']),
      variants: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}variants']),
      variantOf: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}variant_of']),
    );
  }

  @override
  Radicals createAlias(String alias) {
    return Radicals(attachedDatabase, alias);
  }
}

class RadicalsData extends DataClass implements Insertable<RadicalsData> {
  final int id;
  final String radical;
  final int? kangxiId;
  final int strokeCount;
  final String meaning;
  final String reading;
  final int? position;
  final int? importance;
  final String? strokes;
  final String? variants;
  final String? variantOf;
  const RadicalsData(
      {required this.id,
      required this.radical,
      this.kangxiId,
      required this.strokeCount,
      required this.meaning,
      required this.reading,
      this.position,
      this.importance,
      this.strokes,
      this.variants,
      this.variantOf});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['radical'] = Variable<String>(radical);
    if (!nullToAbsent || kangxiId != null) {
      map['kangxi_id'] = Variable<int>(kangxiId);
    }
    map['stroke_count'] = Variable<int>(strokeCount);
    map['meaning'] = Variable<String>(meaning);
    map['reading'] = Variable<String>(reading);
    if (!nullToAbsent || position != null) {
      map['position'] = Variable<int>(position);
    }
    if (!nullToAbsent || importance != null) {
      map['importance'] = Variable<int>(importance);
    }
    if (!nullToAbsent || strokes != null) {
      map['strokes'] = Variable<String>(strokes);
    }
    if (!nullToAbsent || variants != null) {
      map['variants'] = Variable<String>(variants);
    }
    if (!nullToAbsent || variantOf != null) {
      map['variant_of'] = Variable<String>(variantOf);
    }
    return map;
  }

  RadicalsCompanion toCompanion(bool nullToAbsent) {
    return RadicalsCompanion(
      id: Value(id),
      radical: Value(radical),
      kangxiId: kangxiId == null && nullToAbsent
          ? const Value.absent()
          : Value(kangxiId),
      strokeCount: Value(strokeCount),
      meaning: Value(meaning),
      reading: Value(reading),
      position: position == null && nullToAbsent
          ? const Value.absent()
          : Value(position),
      importance: importance == null && nullToAbsent
          ? const Value.absent()
          : Value(importance),
      strokes: strokes == null && nullToAbsent
          ? const Value.absent()
          : Value(strokes),
      variants: variants == null && nullToAbsent
          ? const Value.absent()
          : Value(variants),
      variantOf: variantOf == null && nullToAbsent
          ? const Value.absent()
          : Value(variantOf),
    );
  }

  factory RadicalsData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RadicalsData(
      id: serializer.fromJson<int>(json['id']),
      radical: serializer.fromJson<String>(json['radical']),
      kangxiId: serializer.fromJson<int?>(json['kangxiId']),
      strokeCount: serializer.fromJson<int>(json['strokeCount']),
      meaning: serializer.fromJson<String>(json['meaning']),
      reading: serializer.fromJson<String>(json['reading']),
      position: serializer.fromJson<int?>(json['position']),
      importance: serializer.fromJson<int?>(json['importance']),
      strokes: serializer.fromJson<String?>(json['strokes']),
      variants: serializer.fromJson<String?>(json['variants']),
      variantOf: serializer.fromJson<String?>(json['variantOf']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'radical': serializer.toJson<String>(radical),
      'kangxiId': serializer.toJson<int?>(kangxiId),
      'strokeCount': serializer.toJson<int>(strokeCount),
      'meaning': serializer.toJson<String>(meaning),
      'reading': serializer.toJson<String>(reading),
      'position': serializer.toJson<int?>(position),
      'importance': serializer.toJson<int?>(importance),
      'strokes': serializer.toJson<String?>(strokes),
      'variants': serializer.toJson<String?>(variants),
      'variantOf': serializer.toJson<String?>(variantOf),
    };
  }

  RadicalsData copyWith(
          {int? id,
          String? radical,
          Value<int?> kangxiId = const Value.absent(),
          int? strokeCount,
          String? meaning,
          String? reading,
          Value<int?> position = const Value.absent(),
          Value<int?> importance = const Value.absent(),
          Value<String?> strokes = const Value.absent(),
          Value<String?> variants = const Value.absent(),
          Value<String?> variantOf = const Value.absent()}) =>
      RadicalsData(
        id: id ?? this.id,
        radical: radical ?? this.radical,
        kangxiId: kangxiId.present ? kangxiId.value : this.kangxiId,
        strokeCount: strokeCount ?? this.strokeCount,
        meaning: meaning ?? this.meaning,
        reading: reading ?? this.reading,
        position: position.present ? position.value : this.position,
        importance: importance.present ? importance.value : this.importance,
        strokes: strokes.present ? strokes.value : this.strokes,
        variants: variants.present ? variants.value : this.variants,
        variantOf: variantOf.present ? variantOf.value : this.variantOf,
      );
  RadicalsData copyWithCompanion(RadicalsCompanion data) {
    return RadicalsData(
      id: data.id.present ? data.id.value : this.id,
      radical: data.radical.present ? data.radical.value : this.radical,
      kangxiId: data.kangxiId.present ? data.kangxiId.value : this.kangxiId,
      strokeCount:
          data.strokeCount.present ? data.strokeCount.value : this.strokeCount,
      meaning: data.meaning.present ? data.meaning.value : this.meaning,
      reading: data.reading.present ? data.reading.value : this.reading,
      position: data.position.present ? data.position.value : this.position,
      importance:
          data.importance.present ? data.importance.value : this.importance,
      strokes: data.strokes.present ? data.strokes.value : this.strokes,
      variants: data.variants.present ? data.variants.value : this.variants,
      variantOf: data.variantOf.present ? data.variantOf.value : this.variantOf,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RadicalsData(')
          ..write('id: $id, ')
          ..write('radical: $radical, ')
          ..write('kangxiId: $kangxiId, ')
          ..write('strokeCount: $strokeCount, ')
          ..write('meaning: $meaning, ')
          ..write('reading: $reading, ')
          ..write('position: $position, ')
          ..write('importance: $importance, ')
          ..write('strokes: $strokes, ')
          ..write('variants: $variants, ')
          ..write('variantOf: $variantOf')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, radical, kangxiId, strokeCount, meaning,
      reading, position, importance, strokes, variants, variantOf);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RadicalsData &&
          other.id == this.id &&
          other.radical == this.radical &&
          other.kangxiId == this.kangxiId &&
          other.strokeCount == this.strokeCount &&
          other.meaning == this.meaning &&
          other.reading == this.reading &&
          other.position == this.position &&
          other.importance == this.importance &&
          other.strokes == this.strokes &&
          other.variants == this.variants &&
          other.variantOf == this.variantOf);
}

class RadicalsCompanion extends UpdateCompanion<RadicalsData> {
  final Value<int> id;
  final Value<String> radical;
  final Value<int?> kangxiId;
  final Value<int> strokeCount;
  final Value<String> meaning;
  final Value<String> reading;
  final Value<int?> position;
  final Value<int?> importance;
  final Value<String?> strokes;
  final Value<String?> variants;
  final Value<String?> variantOf;
  const RadicalsCompanion({
    this.id = const Value.absent(),
    this.radical = const Value.absent(),
    this.kangxiId = const Value.absent(),
    this.strokeCount = const Value.absent(),
    this.meaning = const Value.absent(),
    this.reading = const Value.absent(),
    this.position = const Value.absent(),
    this.importance = const Value.absent(),
    this.strokes = const Value.absent(),
    this.variants = const Value.absent(),
    this.variantOf = const Value.absent(),
  });
  RadicalsCompanion.insert({
    this.id = const Value.absent(),
    required String radical,
    this.kangxiId = const Value.absent(),
    required int strokeCount,
    required String meaning,
    required String reading,
    this.position = const Value.absent(),
    this.importance = const Value.absent(),
    this.strokes = const Value.absent(),
    this.variants = const Value.absent(),
    this.variantOf = const Value.absent(),
  })  : radical = Value(radical),
        strokeCount = Value(strokeCount),
        meaning = Value(meaning),
        reading = Value(reading);
  static Insertable<RadicalsData> custom({
    Expression<int>? id,
    Expression<String>? radical,
    Expression<int>? kangxiId,
    Expression<int>? strokeCount,
    Expression<String>? meaning,
    Expression<String>? reading,
    Expression<int>? position,
    Expression<int>? importance,
    Expression<String>? strokes,
    Expression<String>? variants,
    Expression<String>? variantOf,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (radical != null) 'radical': radical,
      if (kangxiId != null) 'kangxi_id': kangxiId,
      if (strokeCount != null) 'stroke_count': strokeCount,
      if (meaning != null) 'meaning': meaning,
      if (reading != null) 'reading': reading,
      if (position != null) 'position': position,
      if (importance != null) 'importance': importance,
      if (strokes != null) 'strokes': strokes,
      if (variants != null) 'variants': variants,
      if (variantOf != null) 'variant_of': variantOf,
    });
  }

  RadicalsCompanion copyWith(
      {Value<int>? id,
      Value<String>? radical,
      Value<int?>? kangxiId,
      Value<int>? strokeCount,
      Value<String>? meaning,
      Value<String>? reading,
      Value<int?>? position,
      Value<int?>? importance,
      Value<String?>? strokes,
      Value<String?>? variants,
      Value<String?>? variantOf}) {
    return RadicalsCompanion(
      id: id ?? this.id,
      radical: radical ?? this.radical,
      kangxiId: kangxiId ?? this.kangxiId,
      strokeCount: strokeCount ?? this.strokeCount,
      meaning: meaning ?? this.meaning,
      reading: reading ?? this.reading,
      position: position ?? this.position,
      importance: importance ?? this.importance,
      strokes: strokes ?? this.strokes,
      variants: variants ?? this.variants,
      variantOf: variantOf ?? this.variantOf,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (radical.present) {
      map['radical'] = Variable<String>(radical.value);
    }
    if (kangxiId.present) {
      map['kangxi_id'] = Variable<int>(kangxiId.value);
    }
    if (strokeCount.present) {
      map['stroke_count'] = Variable<int>(strokeCount.value);
    }
    if (meaning.present) {
      map['meaning'] = Variable<String>(meaning.value);
    }
    if (reading.present) {
      map['reading'] = Variable<String>(reading.value);
    }
    if (position.present) {
      map['position'] = Variable<int>(position.value);
    }
    if (importance.present) {
      map['importance'] = Variable<int>(importance.value);
    }
    if (strokes.present) {
      map['strokes'] = Variable<String>(strokes.value);
    }
    if (variants.present) {
      map['variants'] = Variable<String>(variants.value);
    }
    if (variantOf.present) {
      map['variant_of'] = Variable<String>(variantOf.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RadicalsCompanion(')
          ..write('id: $id, ')
          ..write('radical: $radical, ')
          ..write('kangxiId: $kangxiId, ')
          ..write('strokeCount: $strokeCount, ')
          ..write('meaning: $meaning, ')
          ..write('reading: $reading, ')
          ..write('position: $position, ')
          ..write('importance: $importance, ')
          ..write('strokes: $strokes, ')
          ..write('variants: $variants, ')
          ..write('variantOf: $variantOf')
          ..write(')'))
        .toString();
  }
}

class ProperNouns extends Table with TableInfo<ProperNouns, ProperNounsData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  ProperNouns(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  late final GeneratedColumn<String> writing = GeneratedColumn<String>(
      'writing', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  late final GeneratedColumn<String> writingSearchForm =
      GeneratedColumn<String>('writing_search_form', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  late final GeneratedColumn<String> reading = GeneratedColumn<String>(
      'reading', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<String> readingSearchForm =
      GeneratedColumn<String>('reading_search_form', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  late final GeneratedColumn<String> readingRomaji = GeneratedColumn<String>(
      'reading_romaji', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<String> readingRomajiSimplified =
      GeneratedColumn<String>('reading_romaji_simplified', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  late final GeneratedColumn<String> romaji = GeneratedColumn<String>(
      'romaji', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<String> types = GeneratedColumn<String>(
      'types', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        writing,
        writingSearchForm,
        reading,
        readingSearchForm,
        readingRomaji,
        readingRomajiSimplified,
        romaji,
        types
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'proper_nouns';
  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ProperNounsData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProperNounsData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      writing: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}writing']),
      writingSearchForm: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}writing_search_form']),
      reading: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}reading'])!,
      readingSearchForm: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}reading_search_form']),
      readingRomaji: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}reading_romaji'])!,
      readingRomajiSimplified: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}reading_romaji_simplified']),
      romaji: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}romaji'])!,
      types: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}types'])!,
    );
  }

  @override
  ProperNouns createAlias(String alias) {
    return ProperNouns(attachedDatabase, alias);
  }
}

class ProperNounsData extends DataClass implements Insertable<ProperNounsData> {
  final int id;
  final String? writing;
  final String? writingSearchForm;
  final String reading;
  final String? readingSearchForm;
  final String readingRomaji;
  final String? readingRomajiSimplified;
  final String romaji;
  final String types;
  const ProperNounsData(
      {required this.id,
      this.writing,
      this.writingSearchForm,
      required this.reading,
      this.readingSearchForm,
      required this.readingRomaji,
      this.readingRomajiSimplified,
      required this.romaji,
      required this.types});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || writing != null) {
      map['writing'] = Variable<String>(writing);
    }
    if (!nullToAbsent || writingSearchForm != null) {
      map['writing_search_form'] = Variable<String>(writingSearchForm);
    }
    map['reading'] = Variable<String>(reading);
    if (!nullToAbsent || readingSearchForm != null) {
      map['reading_search_form'] = Variable<String>(readingSearchForm);
    }
    map['reading_romaji'] = Variable<String>(readingRomaji);
    if (!nullToAbsent || readingRomajiSimplified != null) {
      map['reading_romaji_simplified'] =
          Variable<String>(readingRomajiSimplified);
    }
    map['romaji'] = Variable<String>(romaji);
    map['types'] = Variable<String>(types);
    return map;
  }

  ProperNounsCompanion toCompanion(bool nullToAbsent) {
    return ProperNounsCompanion(
      id: Value(id),
      writing: writing == null && nullToAbsent
          ? const Value.absent()
          : Value(writing),
      writingSearchForm: writingSearchForm == null && nullToAbsent
          ? const Value.absent()
          : Value(writingSearchForm),
      reading: Value(reading),
      readingSearchForm: readingSearchForm == null && nullToAbsent
          ? const Value.absent()
          : Value(readingSearchForm),
      readingRomaji: Value(readingRomaji),
      readingRomajiSimplified: readingRomajiSimplified == null && nullToAbsent
          ? const Value.absent()
          : Value(readingRomajiSimplified),
      romaji: Value(romaji),
      types: Value(types),
    );
  }

  factory ProperNounsData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProperNounsData(
      id: serializer.fromJson<int>(json['id']),
      writing: serializer.fromJson<String?>(json['writing']),
      writingSearchForm:
          serializer.fromJson<String?>(json['writingSearchForm']),
      reading: serializer.fromJson<String>(json['reading']),
      readingSearchForm:
          serializer.fromJson<String?>(json['readingSearchForm']),
      readingRomaji: serializer.fromJson<String>(json['readingRomaji']),
      readingRomajiSimplified:
          serializer.fromJson<String?>(json['readingRomajiSimplified']),
      romaji: serializer.fromJson<String>(json['romaji']),
      types: serializer.fromJson<String>(json['types']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'writing': serializer.toJson<String?>(writing),
      'writingSearchForm': serializer.toJson<String?>(writingSearchForm),
      'reading': serializer.toJson<String>(reading),
      'readingSearchForm': serializer.toJson<String?>(readingSearchForm),
      'readingRomaji': serializer.toJson<String>(readingRomaji),
      'readingRomajiSimplified':
          serializer.toJson<String?>(readingRomajiSimplified),
      'romaji': serializer.toJson<String>(romaji),
      'types': serializer.toJson<String>(types),
    };
  }

  ProperNounsData copyWith(
          {int? id,
          Value<String?> writing = const Value.absent(),
          Value<String?> writingSearchForm = const Value.absent(),
          String? reading,
          Value<String?> readingSearchForm = const Value.absent(),
          String? readingRomaji,
          Value<String?> readingRomajiSimplified = const Value.absent(),
          String? romaji,
          String? types}) =>
      ProperNounsData(
        id: id ?? this.id,
        writing: writing.present ? writing.value : this.writing,
        writingSearchForm: writingSearchForm.present
            ? writingSearchForm.value
            : this.writingSearchForm,
        reading: reading ?? this.reading,
        readingSearchForm: readingSearchForm.present
            ? readingSearchForm.value
            : this.readingSearchForm,
        readingRomaji: readingRomaji ?? this.readingRomaji,
        readingRomajiSimplified: readingRomajiSimplified.present
            ? readingRomajiSimplified.value
            : this.readingRomajiSimplified,
        romaji: romaji ?? this.romaji,
        types: types ?? this.types,
      );
  ProperNounsData copyWithCompanion(ProperNounsCompanion data) {
    return ProperNounsData(
      id: data.id.present ? data.id.value : this.id,
      writing: data.writing.present ? data.writing.value : this.writing,
      writingSearchForm: data.writingSearchForm.present
          ? data.writingSearchForm.value
          : this.writingSearchForm,
      reading: data.reading.present ? data.reading.value : this.reading,
      readingSearchForm: data.readingSearchForm.present
          ? data.readingSearchForm.value
          : this.readingSearchForm,
      readingRomaji: data.readingRomaji.present
          ? data.readingRomaji.value
          : this.readingRomaji,
      readingRomajiSimplified: data.readingRomajiSimplified.present
          ? data.readingRomajiSimplified.value
          : this.readingRomajiSimplified,
      romaji: data.romaji.present ? data.romaji.value : this.romaji,
      types: data.types.present ? data.types.value : this.types,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProperNounsData(')
          ..write('id: $id, ')
          ..write('writing: $writing, ')
          ..write('writingSearchForm: $writingSearchForm, ')
          ..write('reading: $reading, ')
          ..write('readingSearchForm: $readingSearchForm, ')
          ..write('readingRomaji: $readingRomaji, ')
          ..write('readingRomajiSimplified: $readingRomajiSimplified, ')
          ..write('romaji: $romaji, ')
          ..write('types: $types')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, writing, writingSearchForm, reading,
      readingSearchForm, readingRomaji, readingRomajiSimplified, romaji, types);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProperNounsData &&
          other.id == this.id &&
          other.writing == this.writing &&
          other.writingSearchForm == this.writingSearchForm &&
          other.reading == this.reading &&
          other.readingSearchForm == this.readingSearchForm &&
          other.readingRomaji == this.readingRomaji &&
          other.readingRomajiSimplified == this.readingRomajiSimplified &&
          other.romaji == this.romaji &&
          other.types == this.types);
}

class ProperNounsCompanion extends UpdateCompanion<ProperNounsData> {
  final Value<int> id;
  final Value<String?> writing;
  final Value<String?> writingSearchForm;
  final Value<String> reading;
  final Value<String?> readingSearchForm;
  final Value<String> readingRomaji;
  final Value<String?> readingRomajiSimplified;
  final Value<String> romaji;
  final Value<String> types;
  const ProperNounsCompanion({
    this.id = const Value.absent(),
    this.writing = const Value.absent(),
    this.writingSearchForm = const Value.absent(),
    this.reading = const Value.absent(),
    this.readingSearchForm = const Value.absent(),
    this.readingRomaji = const Value.absent(),
    this.readingRomajiSimplified = const Value.absent(),
    this.romaji = const Value.absent(),
    this.types = const Value.absent(),
  });
  ProperNounsCompanion.insert({
    this.id = const Value.absent(),
    this.writing = const Value.absent(),
    this.writingSearchForm = const Value.absent(),
    required String reading,
    this.readingSearchForm = const Value.absent(),
    required String readingRomaji,
    this.readingRomajiSimplified = const Value.absent(),
    required String romaji,
    required String types,
  })  : reading = Value(reading),
        readingRomaji = Value(readingRomaji),
        romaji = Value(romaji),
        types = Value(types);
  static Insertable<ProperNounsData> custom({
    Expression<int>? id,
    Expression<String>? writing,
    Expression<String>? writingSearchForm,
    Expression<String>? reading,
    Expression<String>? readingSearchForm,
    Expression<String>? readingRomaji,
    Expression<String>? readingRomajiSimplified,
    Expression<String>? romaji,
    Expression<String>? types,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (writing != null) 'writing': writing,
      if (writingSearchForm != null) 'writing_search_form': writingSearchForm,
      if (reading != null) 'reading': reading,
      if (readingSearchForm != null) 'reading_search_form': readingSearchForm,
      if (readingRomaji != null) 'reading_romaji': readingRomaji,
      if (readingRomajiSimplified != null)
        'reading_romaji_simplified': readingRomajiSimplified,
      if (romaji != null) 'romaji': romaji,
      if (types != null) 'types': types,
    });
  }

  ProperNounsCompanion copyWith(
      {Value<int>? id,
      Value<String?>? writing,
      Value<String?>? writingSearchForm,
      Value<String>? reading,
      Value<String?>? readingSearchForm,
      Value<String>? readingRomaji,
      Value<String?>? readingRomajiSimplified,
      Value<String>? romaji,
      Value<String>? types}) {
    return ProperNounsCompanion(
      id: id ?? this.id,
      writing: writing ?? this.writing,
      writingSearchForm: writingSearchForm ?? this.writingSearchForm,
      reading: reading ?? this.reading,
      readingSearchForm: readingSearchForm ?? this.readingSearchForm,
      readingRomaji: readingRomaji ?? this.readingRomaji,
      readingRomajiSimplified:
          readingRomajiSimplified ?? this.readingRomajiSimplified,
      romaji: romaji ?? this.romaji,
      types: types ?? this.types,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (writing.present) {
      map['writing'] = Variable<String>(writing.value);
    }
    if (writingSearchForm.present) {
      map['writing_search_form'] = Variable<String>(writingSearchForm.value);
    }
    if (reading.present) {
      map['reading'] = Variable<String>(reading.value);
    }
    if (readingSearchForm.present) {
      map['reading_search_form'] = Variable<String>(readingSearchForm.value);
    }
    if (readingRomaji.present) {
      map['reading_romaji'] = Variable<String>(readingRomaji.value);
    }
    if (readingRomajiSimplified.present) {
      map['reading_romaji_simplified'] =
          Variable<String>(readingRomajiSimplified.value);
    }
    if (romaji.present) {
      map['romaji'] = Variable<String>(romaji.value);
    }
    if (types.present) {
      map['types'] = Variable<String>(types.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProperNounsCompanion(')
          ..write('id: $id, ')
          ..write('writing: $writing, ')
          ..write('writingSearchForm: $writingSearchForm, ')
          ..write('reading: $reading, ')
          ..write('readingSearchForm: $readingSearchForm, ')
          ..write('readingRomaji: $readingRomaji, ')
          ..write('readingRomajiSimplified: $readingRomajiSimplified, ')
          ..write('romaji: $romaji, ')
          ..write('types: $types')
          ..write(')'))
        .toString();
  }
}

class ProperNounRomajiWords extends Table
    with TableInfo<ProperNounRomajiWords, ProperNounRomajiWordsData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  ProperNounRomajiWords(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  late final GeneratedColumn<String> word = GeneratedColumn<String>(
      'word', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<int> properNounId = GeneratedColumn<int>(
      'proper_noun_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, word, properNounId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'proper_noun_romaji_words';
  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ProperNounRomajiWordsData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProperNounRomajiWordsData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      word: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}word'])!,
      properNounId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}proper_noun_id'])!,
    );
  }

  @override
  ProperNounRomajiWords createAlias(String alias) {
    return ProperNounRomajiWords(attachedDatabase, alias);
  }
}

class ProperNounRomajiWordsData extends DataClass
    implements Insertable<ProperNounRomajiWordsData> {
  final int id;
  final String word;
  final int properNounId;
  const ProperNounRomajiWordsData(
      {required this.id, required this.word, required this.properNounId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['word'] = Variable<String>(word);
    map['proper_noun_id'] = Variable<int>(properNounId);
    return map;
  }

  ProperNounRomajiWordsCompanion toCompanion(bool nullToAbsent) {
    return ProperNounRomajiWordsCompanion(
      id: Value(id),
      word: Value(word),
      properNounId: Value(properNounId),
    );
  }

  factory ProperNounRomajiWordsData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProperNounRomajiWordsData(
      id: serializer.fromJson<int>(json['id']),
      word: serializer.fromJson<String>(json['word']),
      properNounId: serializer.fromJson<int>(json['properNounId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'word': serializer.toJson<String>(word),
      'properNounId': serializer.toJson<int>(properNounId),
    };
  }

  ProperNounRomajiWordsData copyWith(
          {int? id, String? word, int? properNounId}) =>
      ProperNounRomajiWordsData(
        id: id ?? this.id,
        word: word ?? this.word,
        properNounId: properNounId ?? this.properNounId,
      );
  ProperNounRomajiWordsData copyWithCompanion(
      ProperNounRomajiWordsCompanion data) {
    return ProperNounRomajiWordsData(
      id: data.id.present ? data.id.value : this.id,
      word: data.word.present ? data.word.value : this.word,
      properNounId: data.properNounId.present
          ? data.properNounId.value
          : this.properNounId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProperNounRomajiWordsData(')
          ..write('id: $id, ')
          ..write('word: $word, ')
          ..write('properNounId: $properNounId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, word, properNounId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProperNounRomajiWordsData &&
          other.id == this.id &&
          other.word == this.word &&
          other.properNounId == this.properNounId);
}

class ProperNounRomajiWordsCompanion
    extends UpdateCompanion<ProperNounRomajiWordsData> {
  final Value<int> id;
  final Value<String> word;
  final Value<int> properNounId;
  const ProperNounRomajiWordsCompanion({
    this.id = const Value.absent(),
    this.word = const Value.absent(),
    this.properNounId = const Value.absent(),
  });
  ProperNounRomajiWordsCompanion.insert({
    this.id = const Value.absent(),
    required String word,
    required int properNounId,
  })  : word = Value(word),
        properNounId = Value(properNounId);
  static Insertable<ProperNounRomajiWordsData> custom({
    Expression<int>? id,
    Expression<String>? word,
    Expression<int>? properNounId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (word != null) 'word': word,
      if (properNounId != null) 'proper_noun_id': properNounId,
    });
  }

  ProperNounRomajiWordsCompanion copyWith(
      {Value<int>? id, Value<String>? word, Value<int>? properNounId}) {
    return ProperNounRomajiWordsCompanion(
      id: id ?? this.id,
      word: word ?? this.word,
      properNounId: properNounId ?? this.properNounId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (word.present) {
      map['word'] = Variable<String>(word.value);
    }
    if (properNounId.present) {
      map['proper_noun_id'] = Variable<int>(properNounId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProperNounRomajiWordsCompanion(')
          ..write('id: $id, ')
          ..write('word: $word, ')
          ..write('properNounId: $properNounId')
          ..write(')'))
        .toString();
  }
}

class PredefinedDictionaryLists extends Table
    with TableInfo<PredefinedDictionaryLists, PredefinedDictionaryListsData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  PredefinedDictionaryLists(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      check: () => ComparableExpr(name.length).isBiggerThan(Constant(0)),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  late final GeneratedColumn<String> vocab = GeneratedColumn<String>(
      'vocab', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<String> kanji = GeneratedColumn<String>(
      'kanji', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, vocab, kanji];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'predefined_dictionary_lists';
  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PredefinedDictionaryListsData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PredefinedDictionaryListsData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      vocab: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}vocab'])!,
      kanji: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}kanji'])!,
    );
  }

  @override
  PredefinedDictionaryLists createAlias(String alias) {
    return PredefinedDictionaryLists(attachedDatabase, alias);
  }
}

class PredefinedDictionaryListsData extends DataClass
    implements Insertable<PredefinedDictionaryListsData> {
  final int id;
  final String name;
  final String vocab;
  final String kanji;
  const PredefinedDictionaryListsData(
      {required this.id,
      required this.name,
      required this.vocab,
      required this.kanji});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['vocab'] = Variable<String>(vocab);
    map['kanji'] = Variable<String>(kanji);
    return map;
  }

  PredefinedDictionaryListsCompanion toCompanion(bool nullToAbsent) {
    return PredefinedDictionaryListsCompanion(
      id: Value(id),
      name: Value(name),
      vocab: Value(vocab),
      kanji: Value(kanji),
    );
  }

  factory PredefinedDictionaryListsData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PredefinedDictionaryListsData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      vocab: serializer.fromJson<String>(json['vocab']),
      kanji: serializer.fromJson<String>(json['kanji']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'vocab': serializer.toJson<String>(vocab),
      'kanji': serializer.toJson<String>(kanji),
    };
  }

  PredefinedDictionaryListsData copyWith(
          {int? id, String? name, String? vocab, String? kanji}) =>
      PredefinedDictionaryListsData(
        id: id ?? this.id,
        name: name ?? this.name,
        vocab: vocab ?? this.vocab,
        kanji: kanji ?? this.kanji,
      );
  PredefinedDictionaryListsData copyWithCompanion(
      PredefinedDictionaryListsCompanion data) {
    return PredefinedDictionaryListsData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      vocab: data.vocab.present ? data.vocab.value : this.vocab,
      kanji: data.kanji.present ? data.kanji.value : this.kanji,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PredefinedDictionaryListsData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('vocab: $vocab, ')
          ..write('kanji: $kanji')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, vocab, kanji);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PredefinedDictionaryListsData &&
          other.id == this.id &&
          other.name == this.name &&
          other.vocab == this.vocab &&
          other.kanji == this.kanji);
}

class PredefinedDictionaryListsCompanion
    extends UpdateCompanion<PredefinedDictionaryListsData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> vocab;
  final Value<String> kanji;
  const PredefinedDictionaryListsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.vocab = const Value.absent(),
    this.kanji = const Value.absent(),
  });
  PredefinedDictionaryListsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String vocab,
    required String kanji,
  })  : name = Value(name),
        vocab = Value(vocab),
        kanji = Value(kanji);
  static Insertable<PredefinedDictionaryListsData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? vocab,
    Expression<String>? kanji,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (vocab != null) 'vocab': vocab,
      if (kanji != null) 'kanji': kanji,
    });
  }

  PredefinedDictionaryListsCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? vocab,
      Value<String>? kanji}) {
    return PredefinedDictionaryListsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      vocab: vocab ?? this.vocab,
      kanji: kanji ?? this.kanji,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (vocab.present) {
      map['vocab'] = Variable<String>(vocab.value);
    }
    if (kanji.present) {
      map['kanji'] = Variable<String>(kanji.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PredefinedDictionaryListsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('vocab: $vocab, ')
          ..write('kanji: $kanji')
          ..write(')'))
        .toString();
  }
}

class MyDictionaryLists extends Table
    with TableInfo<MyDictionaryLists, MyDictionaryListsData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  MyDictionaryLists(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      check: () => ComparableExpr(name.length).isBiggerThan(Constant(0)),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  late final GeneratedColumn<DateTime> timestamp = GeneratedColumn<DateTime>(
      'timestamp', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: const CustomExpression(
          'CAST(strftime(\'%s\', CURRENT_TIMESTAMP) AS INTEGER)'));
  @override
  List<GeneratedColumn> get $columns => [id, name, timestamp];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'my_dictionary_lists';
  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MyDictionaryListsData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MyDictionaryListsData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      timestamp: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}timestamp'])!,
    );
  }

  @override
  MyDictionaryLists createAlias(String alias) {
    return MyDictionaryLists(attachedDatabase, alias);
  }
}

class MyDictionaryListsData extends DataClass
    implements Insertable<MyDictionaryListsData> {
  final int id;
  final String name;
  final DateTime timestamp;
  const MyDictionaryListsData(
      {required this.id, required this.name, required this.timestamp});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['timestamp'] = Variable<DateTime>(timestamp);
    return map;
  }

  MyDictionaryListsCompanion toCompanion(bool nullToAbsent) {
    return MyDictionaryListsCompanion(
      id: Value(id),
      name: Value(name),
      timestamp: Value(timestamp),
    );
  }

  factory MyDictionaryListsData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MyDictionaryListsData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      timestamp: serializer.fromJson<DateTime>(json['timestamp']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'timestamp': serializer.toJson<DateTime>(timestamp),
    };
  }

  MyDictionaryListsData copyWith(
          {int? id, String? name, DateTime? timestamp}) =>
      MyDictionaryListsData(
        id: id ?? this.id,
        name: name ?? this.name,
        timestamp: timestamp ?? this.timestamp,
      );
  MyDictionaryListsData copyWithCompanion(MyDictionaryListsCompanion data) {
    return MyDictionaryListsData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      timestamp: data.timestamp.present ? data.timestamp.value : this.timestamp,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MyDictionaryListsData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('timestamp: $timestamp')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, timestamp);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MyDictionaryListsData &&
          other.id == this.id &&
          other.name == this.name &&
          other.timestamp == this.timestamp);
}

class MyDictionaryListsCompanion
    extends UpdateCompanion<MyDictionaryListsData> {
  final Value<int> id;
  final Value<String> name;
  final Value<DateTime> timestamp;
  const MyDictionaryListsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.timestamp = const Value.absent(),
  });
  MyDictionaryListsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.timestamp = const Value.absent(),
  }) : name = Value(name);
  static Insertable<MyDictionaryListsData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<DateTime>? timestamp,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (timestamp != null) 'timestamp': timestamp,
    });
  }

  MyDictionaryListsCompanion copyWith(
      {Value<int>? id, Value<String>? name, Value<DateTime>? timestamp}) {
    return MyDictionaryListsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      timestamp: timestamp ?? this.timestamp,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (timestamp.present) {
      map['timestamp'] = Variable<DateTime>(timestamp.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MyDictionaryListsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('timestamp: $timestamp')
          ..write(')'))
        .toString();
  }
}

class MyDictionaryListItems extends Table
    with TableInfo<MyDictionaryListItems, MyDictionaryListItemsData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  MyDictionaryListItems(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  late final GeneratedColumn<int> listId = GeneratedColumn<int>(
      'list_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  late final GeneratedColumn<int> vocabId = GeneratedColumn<int>(
      'vocab_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints:
          'NOT NULL DEFAULT 0 CHECK( IIF(vocab_id = 0, 1, 0) + IIF(kanji_id = 0, 1, 0) = 1 )',
      defaultValue: const CustomExpression('0'));
  late final GeneratedColumn<int> kanjiId = GeneratedColumn<int>(
      'kanji_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints:
          'NOT NULL DEFAULT 0 CHECK( IIF(vocab_id = 0, 1, 0) + IIF(kanji_id = 0, 1, 0) = 1 )',
      defaultValue: const CustomExpression('0'));
  @override
  List<GeneratedColumn> get $columns => [id, listId, vocabId, kanjiId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'my_dictionary_list_items';
  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
        {listId, vocabId, kanjiId},
      ];
  @override
  MyDictionaryListItemsData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MyDictionaryListItemsData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      listId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}list_id'])!,
      vocabId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}vocab_id'])!,
      kanjiId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}kanji_id'])!,
    );
  }

  @override
  MyDictionaryListItems createAlias(String alias) {
    return MyDictionaryListItems(attachedDatabase, alias);
  }
}

class MyDictionaryListItemsData extends DataClass
    implements Insertable<MyDictionaryListItemsData> {
  final int id;
  final int listId;
  final int vocabId;
  final int kanjiId;
  const MyDictionaryListItemsData(
      {required this.id,
      required this.listId,
      required this.vocabId,
      required this.kanjiId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['list_id'] = Variable<int>(listId);
    map['vocab_id'] = Variable<int>(vocabId);
    map['kanji_id'] = Variable<int>(kanjiId);
    return map;
  }

  MyDictionaryListItemsCompanion toCompanion(bool nullToAbsent) {
    return MyDictionaryListItemsCompanion(
      id: Value(id),
      listId: Value(listId),
      vocabId: Value(vocabId),
      kanjiId: Value(kanjiId),
    );
  }

  factory MyDictionaryListItemsData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MyDictionaryListItemsData(
      id: serializer.fromJson<int>(json['id']),
      listId: serializer.fromJson<int>(json['listId']),
      vocabId: serializer.fromJson<int>(json['vocabId']),
      kanjiId: serializer.fromJson<int>(json['kanjiId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'listId': serializer.toJson<int>(listId),
      'vocabId': serializer.toJson<int>(vocabId),
      'kanjiId': serializer.toJson<int>(kanjiId),
    };
  }

  MyDictionaryListItemsData copyWith(
          {int? id, int? listId, int? vocabId, int? kanjiId}) =>
      MyDictionaryListItemsData(
        id: id ?? this.id,
        listId: listId ?? this.listId,
        vocabId: vocabId ?? this.vocabId,
        kanjiId: kanjiId ?? this.kanjiId,
      );
  MyDictionaryListItemsData copyWithCompanion(
      MyDictionaryListItemsCompanion data) {
    return MyDictionaryListItemsData(
      id: data.id.present ? data.id.value : this.id,
      listId: data.listId.present ? data.listId.value : this.listId,
      vocabId: data.vocabId.present ? data.vocabId.value : this.vocabId,
      kanjiId: data.kanjiId.present ? data.kanjiId.value : this.kanjiId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MyDictionaryListItemsData(')
          ..write('id: $id, ')
          ..write('listId: $listId, ')
          ..write('vocabId: $vocabId, ')
          ..write('kanjiId: $kanjiId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, listId, vocabId, kanjiId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MyDictionaryListItemsData &&
          other.id == this.id &&
          other.listId == this.listId &&
          other.vocabId == this.vocabId &&
          other.kanjiId == this.kanjiId);
}

class MyDictionaryListItemsCompanion
    extends UpdateCompanion<MyDictionaryListItemsData> {
  final Value<int> id;
  final Value<int> listId;
  final Value<int> vocabId;
  final Value<int> kanjiId;
  const MyDictionaryListItemsCompanion({
    this.id = const Value.absent(),
    this.listId = const Value.absent(),
    this.vocabId = const Value.absent(),
    this.kanjiId = const Value.absent(),
  });
  MyDictionaryListItemsCompanion.insert({
    this.id = const Value.absent(),
    required int listId,
    this.vocabId = const Value.absent(),
    this.kanjiId = const Value.absent(),
  }) : listId = Value(listId);
  static Insertable<MyDictionaryListItemsData> custom({
    Expression<int>? id,
    Expression<int>? listId,
    Expression<int>? vocabId,
    Expression<int>? kanjiId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (listId != null) 'list_id': listId,
      if (vocabId != null) 'vocab_id': vocabId,
      if (kanjiId != null) 'kanji_id': kanjiId,
    });
  }

  MyDictionaryListItemsCompanion copyWith(
      {Value<int>? id,
      Value<int>? listId,
      Value<int>? vocabId,
      Value<int>? kanjiId}) {
    return MyDictionaryListItemsCompanion(
      id: id ?? this.id,
      listId: listId ?? this.listId,
      vocabId: vocabId ?? this.vocabId,
      kanjiId: kanjiId ?? this.kanjiId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (listId.present) {
      map['list_id'] = Variable<int>(listId.value);
    }
    if (vocabId.present) {
      map['vocab_id'] = Variable<int>(vocabId.value);
    }
    if (kanjiId.present) {
      map['kanji_id'] = Variable<int>(kanjiId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MyDictionaryListItemsCompanion(')
          ..write('id: $id, ')
          ..write('listId: $listId, ')
          ..write('vocabId: $vocabId, ')
          ..write('kanjiId: $kanjiId')
          ..write(')'))
        .toString();
  }
}

class KanjiNotes extends Table with TableInfo<KanjiNotes, KanjiNotesData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  KanjiNotes(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
      'note', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, note];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'kanji_notes';
  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  KanjiNotesData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return KanjiNotesData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      note: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}note'])!,
    );
  }

  @override
  KanjiNotes createAlias(String alias) {
    return KanjiNotes(attachedDatabase, alias);
  }
}

class KanjiNotesData extends DataClass implements Insertable<KanjiNotesData> {
  final int id;
  final String note;
  const KanjiNotesData({required this.id, required this.note});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['note'] = Variable<String>(note);
    return map;
  }

  KanjiNotesCompanion toCompanion(bool nullToAbsent) {
    return KanjiNotesCompanion(
      id: Value(id),
      note: Value(note),
    );
  }

  factory KanjiNotesData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return KanjiNotesData(
      id: serializer.fromJson<int>(json['id']),
      note: serializer.fromJson<String>(json['note']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'note': serializer.toJson<String>(note),
    };
  }

  KanjiNotesData copyWith({int? id, String? note}) => KanjiNotesData(
        id: id ?? this.id,
        note: note ?? this.note,
      );
  KanjiNotesData copyWithCompanion(KanjiNotesCompanion data) {
    return KanjiNotesData(
      id: data.id.present ? data.id.value : this.id,
      note: data.note.present ? data.note.value : this.note,
    );
  }

  @override
  String toString() {
    return (StringBuffer('KanjiNotesData(')
          ..write('id: $id, ')
          ..write('note: $note')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, note);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is KanjiNotesData &&
          other.id == this.id &&
          other.note == this.note);
}

class KanjiNotesCompanion extends UpdateCompanion<KanjiNotesData> {
  final Value<int> id;
  final Value<String> note;
  const KanjiNotesCompanion({
    this.id = const Value.absent(),
    this.note = const Value.absent(),
  });
  KanjiNotesCompanion.insert({
    this.id = const Value.absent(),
    required String note,
  }) : note = Value(note);
  static Insertable<KanjiNotesData> custom({
    Expression<int>? id,
    Expression<String>? note,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (note != null) 'note': note,
    });
  }

  KanjiNotesCompanion copyWith({Value<int>? id, Value<String>? note}) {
    return KanjiNotesCompanion(
      id: id ?? this.id,
      note: note ?? this.note,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('KanjiNotesCompanion(')
          ..write('id: $id, ')
          ..write('note: $note')
          ..write(')'))
        .toString();
  }
}

class FlashcardSets extends Table
    with TableInfo<FlashcardSets, FlashcardSetsData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  FlashcardSets(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<bool> usingSpacedRepetition =
      GeneratedColumn<bool>('using_spaced_repetition', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintIsAlways(
              'CHECK ("using_spaced_repetition" IN (0, 1))'),
          defaultValue: const CustomExpression('1'));
  late final GeneratedColumn<int> frontType = GeneratedColumn<int>(
      'front_type', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const CustomExpression('0'));
  late final GeneratedColumn<bool> vocabShowReading = GeneratedColumn<bool>(
      'vocab_show_reading', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("vocab_show_reading" IN (0, 1))'),
      defaultValue: const CustomExpression('0'));
  late final GeneratedColumn<bool> vocabShowReadingIfRareKanji =
      GeneratedColumn<bool>(
          'vocab_show_reading_if_rare_kanji', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintIsAlways(
              'CHECK ("vocab_show_reading_if_rare_kanji" IN (0, 1))'),
          defaultValue: const CustomExpression('1'));
  late final GeneratedColumn<bool> vocabShowAlternatives =
      GeneratedColumn<bool>('vocab_show_alternatives', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintIsAlways(
              'CHECK ("vocab_show_alternatives" IN (0, 1))'),
          defaultValue: const CustomExpression('0'));
  late final GeneratedColumn<bool> vocabShowPitchAccent = GeneratedColumn<bool>(
      'vocab_show_pitch_accent', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("vocab_show_pitch_accent" IN (0, 1))'),
      defaultValue: const CustomExpression('0'));
  late final GeneratedColumn<bool> kanjiShowReading = GeneratedColumn<bool>(
      'kanji_show_reading', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("kanji_show_reading" IN (0, 1))'),
      defaultValue: const CustomExpression('0'));
  late final GeneratedColumn<bool> vocabShowPartsOfSpeech =
      GeneratedColumn<bool>('vocab_show_parts_of_speech', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintIsAlways(
              'CHECK ("vocab_show_parts_of_speech" IN (0, 1))'),
          defaultValue: const CustomExpression('0'));
  late final GeneratedColumn<bool> showNote = GeneratedColumn<bool>(
      'show_note', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("show_note" IN (0, 1))'),
      defaultValue: const CustomExpression('0'));
  late final GeneratedColumn<DateTime> timestamp = GeneratedColumn<DateTime>(
      'timestamp', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: const CustomExpression(
          'CAST(strftime(\'%s\', CURRENT_TIMESTAMP) AS INTEGER)'));
  late final GeneratedColumn<String> predefinedDictionaryLists =
      GeneratedColumn<String>('predefined_dictionary_lists', aliasedName, false,
          type: DriftSqlType.string,
          requiredDuringInsert: false,
          defaultValue: const CustomExpression('\'[]\''));
  late final GeneratedColumn<String> myDictionaryLists =
      GeneratedColumn<String>('my_dictionary_lists', aliasedName, false,
          type: DriftSqlType.string,
          requiredDuringInsert: false,
          defaultValue: const CustomExpression('\'[]\''));
  late final GeneratedColumn<int> streak = GeneratedColumn<int>(
      'streak', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const CustomExpression('0'));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        usingSpacedRepetition,
        frontType,
        vocabShowReading,
        vocabShowReadingIfRareKanji,
        vocabShowAlternatives,
        vocabShowPitchAccent,
        kanjiShowReading,
        vocabShowPartsOfSpeech,
        showNote,
        timestamp,
        predefinedDictionaryLists,
        myDictionaryLists,
        streak
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'flashcard_sets';
  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FlashcardSetsData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FlashcardSetsData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      usingSpacedRepetition: attachedDatabase.typeMapping.read(
          DriftSqlType.bool,
          data['${effectivePrefix}using_spaced_repetition'])!,
      frontType: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}front_type'])!,
      vocabShowReading: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}vocab_show_reading'])!,
      vocabShowReadingIfRareKanji: attachedDatabase.typeMapping.read(
          DriftSqlType.bool,
          data['${effectivePrefix}vocab_show_reading_if_rare_kanji'])!,
      vocabShowAlternatives: attachedDatabase.typeMapping.read(
          DriftSqlType.bool,
          data['${effectivePrefix}vocab_show_alternatives'])!,
      vocabShowPitchAccent: attachedDatabase.typeMapping.read(DriftSqlType.bool,
          data['${effectivePrefix}vocab_show_pitch_accent'])!,
      kanjiShowReading: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}kanji_show_reading'])!,
      vocabShowPartsOfSpeech: attachedDatabase.typeMapping.read(
          DriftSqlType.bool,
          data['${effectivePrefix}vocab_show_parts_of_speech'])!,
      showNote: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}show_note'])!,
      timestamp: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}timestamp'])!,
      predefinedDictionaryLists: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}predefined_dictionary_lists'])!,
      myDictionaryLists: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}my_dictionary_lists'])!,
      streak: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}streak'])!,
    );
  }

  @override
  FlashcardSets createAlias(String alias) {
    return FlashcardSets(attachedDatabase, alias);
  }
}

class FlashcardSetsData extends DataClass
    implements Insertable<FlashcardSetsData> {
  final int id;
  final String name;
  final bool usingSpacedRepetition;
  final int frontType;
  final bool vocabShowReading;
  final bool vocabShowReadingIfRareKanji;
  final bool vocabShowAlternatives;
  final bool vocabShowPitchAccent;
  final bool kanjiShowReading;
  final bool vocabShowPartsOfSpeech;
  final bool showNote;
  final DateTime timestamp;
  final String predefinedDictionaryLists;
  final String myDictionaryLists;
  final int streak;
  const FlashcardSetsData(
      {required this.id,
      required this.name,
      required this.usingSpacedRepetition,
      required this.frontType,
      required this.vocabShowReading,
      required this.vocabShowReadingIfRareKanji,
      required this.vocabShowAlternatives,
      required this.vocabShowPitchAccent,
      required this.kanjiShowReading,
      required this.vocabShowPartsOfSpeech,
      required this.showNote,
      required this.timestamp,
      required this.predefinedDictionaryLists,
      required this.myDictionaryLists,
      required this.streak});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['using_spaced_repetition'] = Variable<bool>(usingSpacedRepetition);
    map['front_type'] = Variable<int>(frontType);
    map['vocab_show_reading'] = Variable<bool>(vocabShowReading);
    map['vocab_show_reading_if_rare_kanji'] =
        Variable<bool>(vocabShowReadingIfRareKanji);
    map['vocab_show_alternatives'] = Variable<bool>(vocabShowAlternatives);
    map['vocab_show_pitch_accent'] = Variable<bool>(vocabShowPitchAccent);
    map['kanji_show_reading'] = Variable<bool>(kanjiShowReading);
    map['vocab_show_parts_of_speech'] = Variable<bool>(vocabShowPartsOfSpeech);
    map['show_note'] = Variable<bool>(showNote);
    map['timestamp'] = Variable<DateTime>(timestamp);
    map['predefined_dictionary_lists'] =
        Variable<String>(predefinedDictionaryLists);
    map['my_dictionary_lists'] = Variable<String>(myDictionaryLists);
    map['streak'] = Variable<int>(streak);
    return map;
  }

  FlashcardSetsCompanion toCompanion(bool nullToAbsent) {
    return FlashcardSetsCompanion(
      id: Value(id),
      name: Value(name),
      usingSpacedRepetition: Value(usingSpacedRepetition),
      frontType: Value(frontType),
      vocabShowReading: Value(vocabShowReading),
      vocabShowReadingIfRareKanji: Value(vocabShowReadingIfRareKanji),
      vocabShowAlternatives: Value(vocabShowAlternatives),
      vocabShowPitchAccent: Value(vocabShowPitchAccent),
      kanjiShowReading: Value(kanjiShowReading),
      vocabShowPartsOfSpeech: Value(vocabShowPartsOfSpeech),
      showNote: Value(showNote),
      timestamp: Value(timestamp),
      predefinedDictionaryLists: Value(predefinedDictionaryLists),
      myDictionaryLists: Value(myDictionaryLists),
      streak: Value(streak),
    );
  }

  factory FlashcardSetsData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FlashcardSetsData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      usingSpacedRepetition:
          serializer.fromJson<bool>(json['usingSpacedRepetition']),
      frontType: serializer.fromJson<int>(json['frontType']),
      vocabShowReading: serializer.fromJson<bool>(json['vocabShowReading']),
      vocabShowReadingIfRareKanji:
          serializer.fromJson<bool>(json['vocabShowReadingIfRareKanji']),
      vocabShowAlternatives:
          serializer.fromJson<bool>(json['vocabShowAlternatives']),
      vocabShowPitchAccent:
          serializer.fromJson<bool>(json['vocabShowPitchAccent']),
      kanjiShowReading: serializer.fromJson<bool>(json['kanjiShowReading']),
      vocabShowPartsOfSpeech:
          serializer.fromJson<bool>(json['vocabShowPartsOfSpeech']),
      showNote: serializer.fromJson<bool>(json['showNote']),
      timestamp: serializer.fromJson<DateTime>(json['timestamp']),
      predefinedDictionaryLists:
          serializer.fromJson<String>(json['predefinedDictionaryLists']),
      myDictionaryLists: serializer.fromJson<String>(json['myDictionaryLists']),
      streak: serializer.fromJson<int>(json['streak']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'usingSpacedRepetition': serializer.toJson<bool>(usingSpacedRepetition),
      'frontType': serializer.toJson<int>(frontType),
      'vocabShowReading': serializer.toJson<bool>(vocabShowReading),
      'vocabShowReadingIfRareKanji':
          serializer.toJson<bool>(vocabShowReadingIfRareKanji),
      'vocabShowAlternatives': serializer.toJson<bool>(vocabShowAlternatives),
      'vocabShowPitchAccent': serializer.toJson<bool>(vocabShowPitchAccent),
      'kanjiShowReading': serializer.toJson<bool>(kanjiShowReading),
      'vocabShowPartsOfSpeech': serializer.toJson<bool>(vocabShowPartsOfSpeech),
      'showNote': serializer.toJson<bool>(showNote),
      'timestamp': serializer.toJson<DateTime>(timestamp),
      'predefinedDictionaryLists':
          serializer.toJson<String>(predefinedDictionaryLists),
      'myDictionaryLists': serializer.toJson<String>(myDictionaryLists),
      'streak': serializer.toJson<int>(streak),
    };
  }

  FlashcardSetsData copyWith(
          {int? id,
          String? name,
          bool? usingSpacedRepetition,
          int? frontType,
          bool? vocabShowReading,
          bool? vocabShowReadingIfRareKanji,
          bool? vocabShowAlternatives,
          bool? vocabShowPitchAccent,
          bool? kanjiShowReading,
          bool? vocabShowPartsOfSpeech,
          bool? showNote,
          DateTime? timestamp,
          String? predefinedDictionaryLists,
          String? myDictionaryLists,
          int? streak}) =>
      FlashcardSetsData(
        id: id ?? this.id,
        name: name ?? this.name,
        usingSpacedRepetition:
            usingSpacedRepetition ?? this.usingSpacedRepetition,
        frontType: frontType ?? this.frontType,
        vocabShowReading: vocabShowReading ?? this.vocabShowReading,
        vocabShowReadingIfRareKanji:
            vocabShowReadingIfRareKanji ?? this.vocabShowReadingIfRareKanji,
        vocabShowAlternatives:
            vocabShowAlternatives ?? this.vocabShowAlternatives,
        vocabShowPitchAccent: vocabShowPitchAccent ?? this.vocabShowPitchAccent,
        kanjiShowReading: kanjiShowReading ?? this.kanjiShowReading,
        vocabShowPartsOfSpeech:
            vocabShowPartsOfSpeech ?? this.vocabShowPartsOfSpeech,
        showNote: showNote ?? this.showNote,
        timestamp: timestamp ?? this.timestamp,
        predefinedDictionaryLists:
            predefinedDictionaryLists ?? this.predefinedDictionaryLists,
        myDictionaryLists: myDictionaryLists ?? this.myDictionaryLists,
        streak: streak ?? this.streak,
      );
  FlashcardSetsData copyWithCompanion(FlashcardSetsCompanion data) {
    return FlashcardSetsData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      usingSpacedRepetition: data.usingSpacedRepetition.present
          ? data.usingSpacedRepetition.value
          : this.usingSpacedRepetition,
      frontType: data.frontType.present ? data.frontType.value : this.frontType,
      vocabShowReading: data.vocabShowReading.present
          ? data.vocabShowReading.value
          : this.vocabShowReading,
      vocabShowReadingIfRareKanji: data.vocabShowReadingIfRareKanji.present
          ? data.vocabShowReadingIfRareKanji.value
          : this.vocabShowReadingIfRareKanji,
      vocabShowAlternatives: data.vocabShowAlternatives.present
          ? data.vocabShowAlternatives.value
          : this.vocabShowAlternatives,
      vocabShowPitchAccent: data.vocabShowPitchAccent.present
          ? data.vocabShowPitchAccent.value
          : this.vocabShowPitchAccent,
      kanjiShowReading: data.kanjiShowReading.present
          ? data.kanjiShowReading.value
          : this.kanjiShowReading,
      vocabShowPartsOfSpeech: data.vocabShowPartsOfSpeech.present
          ? data.vocabShowPartsOfSpeech.value
          : this.vocabShowPartsOfSpeech,
      showNote: data.showNote.present ? data.showNote.value : this.showNote,
      timestamp: data.timestamp.present ? data.timestamp.value : this.timestamp,
      predefinedDictionaryLists: data.predefinedDictionaryLists.present
          ? data.predefinedDictionaryLists.value
          : this.predefinedDictionaryLists,
      myDictionaryLists: data.myDictionaryLists.present
          ? data.myDictionaryLists.value
          : this.myDictionaryLists,
      streak: data.streak.present ? data.streak.value : this.streak,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FlashcardSetsData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('usingSpacedRepetition: $usingSpacedRepetition, ')
          ..write('frontType: $frontType, ')
          ..write('vocabShowReading: $vocabShowReading, ')
          ..write('vocabShowReadingIfRareKanji: $vocabShowReadingIfRareKanji, ')
          ..write('vocabShowAlternatives: $vocabShowAlternatives, ')
          ..write('vocabShowPitchAccent: $vocabShowPitchAccent, ')
          ..write('kanjiShowReading: $kanjiShowReading, ')
          ..write('vocabShowPartsOfSpeech: $vocabShowPartsOfSpeech, ')
          ..write('showNote: $showNote, ')
          ..write('timestamp: $timestamp, ')
          ..write('predefinedDictionaryLists: $predefinedDictionaryLists, ')
          ..write('myDictionaryLists: $myDictionaryLists, ')
          ..write('streak: $streak')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      name,
      usingSpacedRepetition,
      frontType,
      vocabShowReading,
      vocabShowReadingIfRareKanji,
      vocabShowAlternatives,
      vocabShowPitchAccent,
      kanjiShowReading,
      vocabShowPartsOfSpeech,
      showNote,
      timestamp,
      predefinedDictionaryLists,
      myDictionaryLists,
      streak);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FlashcardSetsData &&
          other.id == this.id &&
          other.name == this.name &&
          other.usingSpacedRepetition == this.usingSpacedRepetition &&
          other.frontType == this.frontType &&
          other.vocabShowReading == this.vocabShowReading &&
          other.vocabShowReadingIfRareKanji ==
              this.vocabShowReadingIfRareKanji &&
          other.vocabShowAlternatives == this.vocabShowAlternatives &&
          other.vocabShowPitchAccent == this.vocabShowPitchAccent &&
          other.kanjiShowReading == this.kanjiShowReading &&
          other.vocabShowPartsOfSpeech == this.vocabShowPartsOfSpeech &&
          other.showNote == this.showNote &&
          other.timestamp == this.timestamp &&
          other.predefinedDictionaryLists == this.predefinedDictionaryLists &&
          other.myDictionaryLists == this.myDictionaryLists &&
          other.streak == this.streak);
}

class FlashcardSetsCompanion extends UpdateCompanion<FlashcardSetsData> {
  final Value<int> id;
  final Value<String> name;
  final Value<bool> usingSpacedRepetition;
  final Value<int> frontType;
  final Value<bool> vocabShowReading;
  final Value<bool> vocabShowReadingIfRareKanji;
  final Value<bool> vocabShowAlternatives;
  final Value<bool> vocabShowPitchAccent;
  final Value<bool> kanjiShowReading;
  final Value<bool> vocabShowPartsOfSpeech;
  final Value<bool> showNote;
  final Value<DateTime> timestamp;
  final Value<String> predefinedDictionaryLists;
  final Value<String> myDictionaryLists;
  final Value<int> streak;
  const FlashcardSetsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.usingSpacedRepetition = const Value.absent(),
    this.frontType = const Value.absent(),
    this.vocabShowReading = const Value.absent(),
    this.vocabShowReadingIfRareKanji = const Value.absent(),
    this.vocabShowAlternatives = const Value.absent(),
    this.vocabShowPitchAccent = const Value.absent(),
    this.kanjiShowReading = const Value.absent(),
    this.vocabShowPartsOfSpeech = const Value.absent(),
    this.showNote = const Value.absent(),
    this.timestamp = const Value.absent(),
    this.predefinedDictionaryLists = const Value.absent(),
    this.myDictionaryLists = const Value.absent(),
    this.streak = const Value.absent(),
  });
  FlashcardSetsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.usingSpacedRepetition = const Value.absent(),
    this.frontType = const Value.absent(),
    this.vocabShowReading = const Value.absent(),
    this.vocabShowReadingIfRareKanji = const Value.absent(),
    this.vocabShowAlternatives = const Value.absent(),
    this.vocabShowPitchAccent = const Value.absent(),
    this.kanjiShowReading = const Value.absent(),
    this.vocabShowPartsOfSpeech = const Value.absent(),
    this.showNote = const Value.absent(),
    this.timestamp = const Value.absent(),
    this.predefinedDictionaryLists = const Value.absent(),
    this.myDictionaryLists = const Value.absent(),
    this.streak = const Value.absent(),
  }) : name = Value(name);
  static Insertable<FlashcardSetsData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<bool>? usingSpacedRepetition,
    Expression<int>? frontType,
    Expression<bool>? vocabShowReading,
    Expression<bool>? vocabShowReadingIfRareKanji,
    Expression<bool>? vocabShowAlternatives,
    Expression<bool>? vocabShowPitchAccent,
    Expression<bool>? kanjiShowReading,
    Expression<bool>? vocabShowPartsOfSpeech,
    Expression<bool>? showNote,
    Expression<DateTime>? timestamp,
    Expression<String>? predefinedDictionaryLists,
    Expression<String>? myDictionaryLists,
    Expression<int>? streak,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (usingSpacedRepetition != null)
        'using_spaced_repetition': usingSpacedRepetition,
      if (frontType != null) 'front_type': frontType,
      if (vocabShowReading != null) 'vocab_show_reading': vocabShowReading,
      if (vocabShowReadingIfRareKanji != null)
        'vocab_show_reading_if_rare_kanji': vocabShowReadingIfRareKanji,
      if (vocabShowAlternatives != null)
        'vocab_show_alternatives': vocabShowAlternatives,
      if (vocabShowPitchAccent != null)
        'vocab_show_pitch_accent': vocabShowPitchAccent,
      if (kanjiShowReading != null) 'kanji_show_reading': kanjiShowReading,
      if (vocabShowPartsOfSpeech != null)
        'vocab_show_parts_of_speech': vocabShowPartsOfSpeech,
      if (showNote != null) 'show_note': showNote,
      if (timestamp != null) 'timestamp': timestamp,
      if (predefinedDictionaryLists != null)
        'predefined_dictionary_lists': predefinedDictionaryLists,
      if (myDictionaryLists != null) 'my_dictionary_lists': myDictionaryLists,
      if (streak != null) 'streak': streak,
    });
  }

  FlashcardSetsCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<bool>? usingSpacedRepetition,
      Value<int>? frontType,
      Value<bool>? vocabShowReading,
      Value<bool>? vocabShowReadingIfRareKanji,
      Value<bool>? vocabShowAlternatives,
      Value<bool>? vocabShowPitchAccent,
      Value<bool>? kanjiShowReading,
      Value<bool>? vocabShowPartsOfSpeech,
      Value<bool>? showNote,
      Value<DateTime>? timestamp,
      Value<String>? predefinedDictionaryLists,
      Value<String>? myDictionaryLists,
      Value<int>? streak}) {
    return FlashcardSetsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      usingSpacedRepetition:
          usingSpacedRepetition ?? this.usingSpacedRepetition,
      frontType: frontType ?? this.frontType,
      vocabShowReading: vocabShowReading ?? this.vocabShowReading,
      vocabShowReadingIfRareKanji:
          vocabShowReadingIfRareKanji ?? this.vocabShowReadingIfRareKanji,
      vocabShowAlternatives:
          vocabShowAlternatives ?? this.vocabShowAlternatives,
      vocabShowPitchAccent: vocabShowPitchAccent ?? this.vocabShowPitchAccent,
      kanjiShowReading: kanjiShowReading ?? this.kanjiShowReading,
      vocabShowPartsOfSpeech:
          vocabShowPartsOfSpeech ?? this.vocabShowPartsOfSpeech,
      showNote: showNote ?? this.showNote,
      timestamp: timestamp ?? this.timestamp,
      predefinedDictionaryLists:
          predefinedDictionaryLists ?? this.predefinedDictionaryLists,
      myDictionaryLists: myDictionaryLists ?? this.myDictionaryLists,
      streak: streak ?? this.streak,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (usingSpacedRepetition.present) {
      map['using_spaced_repetition'] =
          Variable<bool>(usingSpacedRepetition.value);
    }
    if (frontType.present) {
      map['front_type'] = Variable<int>(frontType.value);
    }
    if (vocabShowReading.present) {
      map['vocab_show_reading'] = Variable<bool>(vocabShowReading.value);
    }
    if (vocabShowReadingIfRareKanji.present) {
      map['vocab_show_reading_if_rare_kanji'] =
          Variable<bool>(vocabShowReadingIfRareKanji.value);
    }
    if (vocabShowAlternatives.present) {
      map['vocab_show_alternatives'] =
          Variable<bool>(vocabShowAlternatives.value);
    }
    if (vocabShowPitchAccent.present) {
      map['vocab_show_pitch_accent'] =
          Variable<bool>(vocabShowPitchAccent.value);
    }
    if (kanjiShowReading.present) {
      map['kanji_show_reading'] = Variable<bool>(kanjiShowReading.value);
    }
    if (vocabShowPartsOfSpeech.present) {
      map['vocab_show_parts_of_speech'] =
          Variable<bool>(vocabShowPartsOfSpeech.value);
    }
    if (showNote.present) {
      map['show_note'] = Variable<bool>(showNote.value);
    }
    if (timestamp.present) {
      map['timestamp'] = Variable<DateTime>(timestamp.value);
    }
    if (predefinedDictionaryLists.present) {
      map['predefined_dictionary_lists'] =
          Variable<String>(predefinedDictionaryLists.value);
    }
    if (myDictionaryLists.present) {
      map['my_dictionary_lists'] = Variable<String>(myDictionaryLists.value);
    }
    if (streak.present) {
      map['streak'] = Variable<int>(streak.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FlashcardSetsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('usingSpacedRepetition: $usingSpacedRepetition, ')
          ..write('frontType: $frontType, ')
          ..write('vocabShowReading: $vocabShowReading, ')
          ..write('vocabShowReadingIfRareKanji: $vocabShowReadingIfRareKanji, ')
          ..write('vocabShowAlternatives: $vocabShowAlternatives, ')
          ..write('vocabShowPitchAccent: $vocabShowPitchAccent, ')
          ..write('kanjiShowReading: $kanjiShowReading, ')
          ..write('vocabShowPartsOfSpeech: $vocabShowPartsOfSpeech, ')
          ..write('showNote: $showNote, ')
          ..write('timestamp: $timestamp, ')
          ..write('predefinedDictionaryLists: $predefinedDictionaryLists, ')
          ..write('myDictionaryLists: $myDictionaryLists, ')
          ..write('streak: $streak')
          ..write(')'))
        .toString();
  }
}

class FlashcardSetReports extends Table
    with TableInfo<FlashcardSetReports, FlashcardSetReportsData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  FlashcardSetReports(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  late final GeneratedColumn<int> flashcardSetId = GeneratedColumn<int>(
      'flashcard_set_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  late final GeneratedColumn<int> date = GeneratedColumn<int>(
      'date', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  late final GeneratedColumn<int> dueFlashcardsCompleted = GeneratedColumn<int>(
      'due_flashcards_completed', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const CustomExpression('0'));
  late final GeneratedColumn<int> dueFlashcardsGotWrong = GeneratedColumn<int>(
      'due_flashcards_got_wrong', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const CustomExpression('0'));
  late final GeneratedColumn<int> newFlashcardsCompleted = GeneratedColumn<int>(
      'new_flashcards_completed', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const CustomExpression('0'));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        flashcardSetId,
        date,
        dueFlashcardsCompleted,
        dueFlashcardsGotWrong,
        newFlashcardsCompleted
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'flashcard_set_reports';
  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FlashcardSetReportsData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FlashcardSetReportsData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      flashcardSetId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}flashcard_set_id'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}date'])!,
      dueFlashcardsCompleted: attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}due_flashcards_completed'])!,
      dueFlashcardsGotWrong: attachedDatabase.typeMapping.read(DriftSqlType.int,
          data['${effectivePrefix}due_flashcards_got_wrong'])!,
      newFlashcardsCompleted: attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}new_flashcards_completed'])!,
    );
  }

  @override
  FlashcardSetReports createAlias(String alias) {
    return FlashcardSetReports(attachedDatabase, alias);
  }
}

class FlashcardSetReportsData extends DataClass
    implements Insertable<FlashcardSetReportsData> {
  final int id;
  final int flashcardSetId;
  final int date;
  final int dueFlashcardsCompleted;
  final int dueFlashcardsGotWrong;
  final int newFlashcardsCompleted;
  const FlashcardSetReportsData(
      {required this.id,
      required this.flashcardSetId,
      required this.date,
      required this.dueFlashcardsCompleted,
      required this.dueFlashcardsGotWrong,
      required this.newFlashcardsCompleted});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['flashcard_set_id'] = Variable<int>(flashcardSetId);
    map['date'] = Variable<int>(date);
    map['due_flashcards_completed'] = Variable<int>(dueFlashcardsCompleted);
    map['due_flashcards_got_wrong'] = Variable<int>(dueFlashcardsGotWrong);
    map['new_flashcards_completed'] = Variable<int>(newFlashcardsCompleted);
    return map;
  }

  FlashcardSetReportsCompanion toCompanion(bool nullToAbsent) {
    return FlashcardSetReportsCompanion(
      id: Value(id),
      flashcardSetId: Value(flashcardSetId),
      date: Value(date),
      dueFlashcardsCompleted: Value(dueFlashcardsCompleted),
      dueFlashcardsGotWrong: Value(dueFlashcardsGotWrong),
      newFlashcardsCompleted: Value(newFlashcardsCompleted),
    );
  }

  factory FlashcardSetReportsData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FlashcardSetReportsData(
      id: serializer.fromJson<int>(json['id']),
      flashcardSetId: serializer.fromJson<int>(json['flashcardSetId']),
      date: serializer.fromJson<int>(json['date']),
      dueFlashcardsCompleted:
          serializer.fromJson<int>(json['dueFlashcardsCompleted']),
      dueFlashcardsGotWrong:
          serializer.fromJson<int>(json['dueFlashcardsGotWrong']),
      newFlashcardsCompleted:
          serializer.fromJson<int>(json['newFlashcardsCompleted']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'flashcardSetId': serializer.toJson<int>(flashcardSetId),
      'date': serializer.toJson<int>(date),
      'dueFlashcardsCompleted': serializer.toJson<int>(dueFlashcardsCompleted),
      'dueFlashcardsGotWrong': serializer.toJson<int>(dueFlashcardsGotWrong),
      'newFlashcardsCompleted': serializer.toJson<int>(newFlashcardsCompleted),
    };
  }

  FlashcardSetReportsData copyWith(
          {int? id,
          int? flashcardSetId,
          int? date,
          int? dueFlashcardsCompleted,
          int? dueFlashcardsGotWrong,
          int? newFlashcardsCompleted}) =>
      FlashcardSetReportsData(
        id: id ?? this.id,
        flashcardSetId: flashcardSetId ?? this.flashcardSetId,
        date: date ?? this.date,
        dueFlashcardsCompleted:
            dueFlashcardsCompleted ?? this.dueFlashcardsCompleted,
        dueFlashcardsGotWrong:
            dueFlashcardsGotWrong ?? this.dueFlashcardsGotWrong,
        newFlashcardsCompleted:
            newFlashcardsCompleted ?? this.newFlashcardsCompleted,
      );
  FlashcardSetReportsData copyWithCompanion(FlashcardSetReportsCompanion data) {
    return FlashcardSetReportsData(
      id: data.id.present ? data.id.value : this.id,
      flashcardSetId: data.flashcardSetId.present
          ? data.flashcardSetId.value
          : this.flashcardSetId,
      date: data.date.present ? data.date.value : this.date,
      dueFlashcardsCompleted: data.dueFlashcardsCompleted.present
          ? data.dueFlashcardsCompleted.value
          : this.dueFlashcardsCompleted,
      dueFlashcardsGotWrong: data.dueFlashcardsGotWrong.present
          ? data.dueFlashcardsGotWrong.value
          : this.dueFlashcardsGotWrong,
      newFlashcardsCompleted: data.newFlashcardsCompleted.present
          ? data.newFlashcardsCompleted.value
          : this.newFlashcardsCompleted,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FlashcardSetReportsData(')
          ..write('id: $id, ')
          ..write('flashcardSetId: $flashcardSetId, ')
          ..write('date: $date, ')
          ..write('dueFlashcardsCompleted: $dueFlashcardsCompleted, ')
          ..write('dueFlashcardsGotWrong: $dueFlashcardsGotWrong, ')
          ..write('newFlashcardsCompleted: $newFlashcardsCompleted')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, flashcardSetId, date,
      dueFlashcardsCompleted, dueFlashcardsGotWrong, newFlashcardsCompleted);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FlashcardSetReportsData &&
          other.id == this.id &&
          other.flashcardSetId == this.flashcardSetId &&
          other.date == this.date &&
          other.dueFlashcardsCompleted == this.dueFlashcardsCompleted &&
          other.dueFlashcardsGotWrong == this.dueFlashcardsGotWrong &&
          other.newFlashcardsCompleted == this.newFlashcardsCompleted);
}

class FlashcardSetReportsCompanion
    extends UpdateCompanion<FlashcardSetReportsData> {
  final Value<int> id;
  final Value<int> flashcardSetId;
  final Value<int> date;
  final Value<int> dueFlashcardsCompleted;
  final Value<int> dueFlashcardsGotWrong;
  final Value<int> newFlashcardsCompleted;
  const FlashcardSetReportsCompanion({
    this.id = const Value.absent(),
    this.flashcardSetId = const Value.absent(),
    this.date = const Value.absent(),
    this.dueFlashcardsCompleted = const Value.absent(),
    this.dueFlashcardsGotWrong = const Value.absent(),
    this.newFlashcardsCompleted = const Value.absent(),
  });
  FlashcardSetReportsCompanion.insert({
    this.id = const Value.absent(),
    required int flashcardSetId,
    required int date,
    this.dueFlashcardsCompleted = const Value.absent(),
    this.dueFlashcardsGotWrong = const Value.absent(),
    this.newFlashcardsCompleted = const Value.absent(),
  })  : flashcardSetId = Value(flashcardSetId),
        date = Value(date);
  static Insertable<FlashcardSetReportsData> custom({
    Expression<int>? id,
    Expression<int>? flashcardSetId,
    Expression<int>? date,
    Expression<int>? dueFlashcardsCompleted,
    Expression<int>? dueFlashcardsGotWrong,
    Expression<int>? newFlashcardsCompleted,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (flashcardSetId != null) 'flashcard_set_id': flashcardSetId,
      if (date != null) 'date': date,
      if (dueFlashcardsCompleted != null)
        'due_flashcards_completed': dueFlashcardsCompleted,
      if (dueFlashcardsGotWrong != null)
        'due_flashcards_got_wrong': dueFlashcardsGotWrong,
      if (newFlashcardsCompleted != null)
        'new_flashcards_completed': newFlashcardsCompleted,
    });
  }

  FlashcardSetReportsCompanion copyWith(
      {Value<int>? id,
      Value<int>? flashcardSetId,
      Value<int>? date,
      Value<int>? dueFlashcardsCompleted,
      Value<int>? dueFlashcardsGotWrong,
      Value<int>? newFlashcardsCompleted}) {
    return FlashcardSetReportsCompanion(
      id: id ?? this.id,
      flashcardSetId: flashcardSetId ?? this.flashcardSetId,
      date: date ?? this.date,
      dueFlashcardsCompleted:
          dueFlashcardsCompleted ?? this.dueFlashcardsCompleted,
      dueFlashcardsGotWrong:
          dueFlashcardsGotWrong ?? this.dueFlashcardsGotWrong,
      newFlashcardsCompleted:
          newFlashcardsCompleted ?? this.newFlashcardsCompleted,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (flashcardSetId.present) {
      map['flashcard_set_id'] = Variable<int>(flashcardSetId.value);
    }
    if (date.present) {
      map['date'] = Variable<int>(date.value);
    }
    if (dueFlashcardsCompleted.present) {
      map['due_flashcards_completed'] =
          Variable<int>(dueFlashcardsCompleted.value);
    }
    if (dueFlashcardsGotWrong.present) {
      map['due_flashcards_got_wrong'] =
          Variable<int>(dueFlashcardsGotWrong.value);
    }
    if (newFlashcardsCompleted.present) {
      map['new_flashcards_completed'] =
          Variable<int>(newFlashcardsCompleted.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FlashcardSetReportsCompanion(')
          ..write('id: $id, ')
          ..write('flashcardSetId: $flashcardSetId, ')
          ..write('date: $date, ')
          ..write('dueFlashcardsCompleted: $dueFlashcardsCompleted, ')
          ..write('dueFlashcardsGotWrong: $dueFlashcardsGotWrong, ')
          ..write('newFlashcardsCompleted: $newFlashcardsCompleted')
          ..write(')'))
        .toString();
  }
}

class DictionaryInfos extends Table
    with TableInfo<DictionaryInfos, DictionaryInfosData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  DictionaryInfos(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const CustomExpression('0'));
  late final GeneratedColumn<int> version = GeneratedColumn<int>(
      'version', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, version];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'dictionary_infos';
  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  DictionaryInfosData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DictionaryInfosData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      version: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}version'])!,
    );
  }

  @override
  DictionaryInfos createAlias(String alias) {
    return DictionaryInfos(attachedDatabase, alias);
  }
}

class DictionaryInfosData extends DataClass
    implements Insertable<DictionaryInfosData> {
  final int id;
  final int version;
  const DictionaryInfosData({required this.id, required this.version});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['version'] = Variable<int>(version);
    return map;
  }

  DictionaryInfosCompanion toCompanion(bool nullToAbsent) {
    return DictionaryInfosCompanion(
      id: Value(id),
      version: Value(version),
    );
  }

  factory DictionaryInfosData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DictionaryInfosData(
      id: serializer.fromJson<int>(json['id']),
      version: serializer.fromJson<int>(json['version']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'version': serializer.toJson<int>(version),
    };
  }

  DictionaryInfosData copyWith({int? id, int? version}) => DictionaryInfosData(
        id: id ?? this.id,
        version: version ?? this.version,
      );
  DictionaryInfosData copyWithCompanion(DictionaryInfosCompanion data) {
    return DictionaryInfosData(
      id: data.id.present ? data.id.value : this.id,
      version: data.version.present ? data.version.value : this.version,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DictionaryInfosData(')
          ..write('id: $id, ')
          ..write('version: $version')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, version);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DictionaryInfosData &&
          other.id == this.id &&
          other.version == this.version);
}

class DictionaryInfosCompanion extends UpdateCompanion<DictionaryInfosData> {
  final Value<int> id;
  final Value<int> version;
  final Value<int> rowid;
  const DictionaryInfosCompanion({
    this.id = const Value.absent(),
    this.version = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DictionaryInfosCompanion.insert({
    this.id = const Value.absent(),
    required int version,
    this.rowid = const Value.absent(),
  }) : version = Value(version);
  static Insertable<DictionaryInfosData> custom({
    Expression<int>? id,
    Expression<int>? version,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (version != null) 'version': version,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DictionaryInfosCompanion copyWith(
      {Value<int>? id, Value<int>? version, Value<int>? rowid}) {
    return DictionaryInfosCompanion(
      id: id ?? this.id,
      version: version ?? this.version,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (version.present) {
      map['version'] = Variable<int>(version.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DictionaryInfosCompanion(')
          ..write('id: $id, ')
          ..write('version: $version, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class DatabaseAtV2 extends GeneratedDatabase {
  DatabaseAtV2(QueryExecutor e) : super(e);
  late final VocabWritings vocabWritings = VocabWritings(this);
  late final Index iXVocabWritingsWritingSearchForm = Index(
      'IX_vocab_writings_writing_search_form',
      'CREATE INDEX IX_vocab_writings_writing_search_form ON vocab_writings (writing_search_form) WHERE writing_search_form IS NOT NULL');
  late final VocabReadings vocabReadings = VocabReadings(this);
  late final Index iXVocabReadingsReadingSearchForm = Index(
      'IX_vocab_readings_reading_search_form',
      'CREATE INDEX IX_vocab_readings_reading_search_form ON vocab_readings (reading_search_form) WHERE reading_search_form IS NOT NULL');
  late final Index iXVocabReadingsReadingRomajiSimplified = Index(
      'IX_vocab_readings_reading_romaji_simplified',
      'CREATE INDEX IX_vocab_readings_reading_romaji_simplified ON vocab_readings (reading_romaji_simplified) WHERE reading_romaji_simplified IS NOT NULL');
  late final Vocabs vocabs = Vocabs(this);
  late final VocabDefinitions vocabDefinitions = VocabDefinitions(this);
  late final VocabDefinitionWords vocabDefinitionWords =
      VocabDefinitionWords(this);
  late final Index iXVocabWritingsVocabId = Index('IX_vocab_writings_vocab_id',
      'CREATE INDEX IX_vocab_writings_vocab_id ON vocab_writings (vocab_id)');
  late final Index iXVocabWritingsWriting = Index('IX_vocab_writings_writing',
      'CREATE INDEX IX_vocab_writings_writing ON vocab_writings (writing)');
  late final Index iXVocabReadingsVocabId = Index('IX_vocab_readings_vocab_id',
      'CREATE INDEX IX_vocab_readings_vocab_id ON vocab_readings (vocab_id)');
  late final Index iXVocabReadingsReading = Index('IX_vocab_readings_reading',
      'CREATE INDEX IX_vocab_readings_reading ON vocab_readings (reading)');
  late final Index iXVocabReadingsReadingRomaji = Index(
      'IX_vocab_readings_reading_romaji',
      'CREATE INDEX IX_vocab_readings_reading_romaji ON vocab_readings (reading_romaji)');
  late final Index iXVocabDefinitionsVocabId = Index(
      'IX_vocab_definitions_vocab_id',
      'CREATE INDEX IX_vocab_definitions_vocab_id ON vocab_definitions (vocab_id)');
  late final Index iXVocabDefinitionWordsWord = Index(
      'IX_vocab_definition_words_word',
      'CREATE INDEX IX_vocab_definition_words_word ON vocab_definition_words (word)');
  late final Kanjis kanjis = Kanjis(this);
  late final KanjiReadings kanjiReadings = KanjiReadings(this);
  late final KanjiMeaningWords kanjiMeaningWords = KanjiMeaningWords(this);
  late final Index iXKanjisRadical = Index('IX_kanjis_radical',
      'CREATE INDEX IX_kanjis_radical ON kanjis (radical)');
  late final Index iXKanjiReadingsKanjiId = Index('IX_kanji_readings_kanji_id',
      'CREATE INDEX IX_kanji_readings_kanji_id ON kanji_readings (kanji_id)');
  late final Index iXKanjiReadingsReading = Index('IX_kanji_readings_reading',
      'CREATE INDEX IX_kanji_readings_reading ON kanji_readings (reading)');
  late final Index iXKanjiReadingsReadingRomaji = Index(
      'IX_kanji_readings_reading_romaji',
      'CREATE INDEX IX_kanji_readings_reading_romaji ON kanji_readings (reading_romaji)');
  late final Index iXKanjiMeaningWordsWord = Index(
      'IX_kanji_meaning_words_word',
      'CREATE INDEX IX_kanji_meaning_words_word ON kanji_meaning_words (word)');
  late final VocabNotes vocabNotes = VocabNotes(this);
  late final TextAnalysisHistoryItems textAnalysisHistoryItems =
      TextAnalysisHistoryItems(this);
  late final SpacedRepetitionDatas spacedRepetitionDatas =
      SpacedRepetitionDatas(this);
  late final SearchHistoryItems searchHistoryItems = SearchHistoryItems(this);
  late final Radicals radicals = Radicals(this);
  late final Index uKRadicalsRadical = Index('UK_radicals_radical',
      'CREATE UNIQUE INDEX UK_radicals_radical ON radicals (radical)');
  late final ProperNouns properNouns = ProperNouns(this);
  late final ProperNounRomajiWords properNounRomajiWords =
      ProperNounRomajiWords(this);
  late final Index iXProperNounsReading = Index('IX_proper_nouns_reading',
      'CREATE INDEX IX_proper_nouns_reading ON proper_nouns (reading)');
  late final Index iXProperNounsReadingRomaji = Index(
      'IX_proper_nouns_reading_romaji',
      'CREATE INDEX IX_proper_nouns_reading_romaji ON proper_nouns (reading_romaji)');
  late final Index iXProperNounRomajiWordsWord = Index(
      'IX_proper_noun_romaji_words_word',
      'CREATE INDEX IX_proper_noun_romaji_words_word ON proper_noun_romaji_words (word)');
  late final PredefinedDictionaryLists predefinedDictionaryLists =
      PredefinedDictionaryLists(this);
  late final MyDictionaryLists myDictionaryLists = MyDictionaryLists(this);
  late final MyDictionaryListItems myDictionaryListItems =
      MyDictionaryListItems(this);
  late final Index iXMyDictionaryListItemsListId = Index(
      'IX_my_dictionary_list_items_list_id',
      'CREATE INDEX IX_my_dictionary_list_items_list_id ON my_dictionary_list_items (list_id)');
  late final KanjiNotes kanjiNotes = KanjiNotes(this);
  late final FlashcardSets flashcardSets = FlashcardSets(this);
  late final FlashcardSetReports flashcardSetReports =
      FlashcardSetReports(this);
  late final Index uXFlashcardSetReportsFlashcardSetIdAndDate = Index(
      'UX_flashcard_set_reports_flashcard_set_id_and_date',
      'CREATE UNIQUE INDEX UX_flashcard_set_reports_flashcard_set_id_and_date ON flashcard_set_reports (flashcard_set_id, date)');
  late final DictionaryInfos dictionaryInfos = DictionaryInfos(this);
  late final Index iXSpacedRepetitionDatasVocabId = Index(
      'IX_spaced_repetition_datas_vocab_id',
      'CREATE INDEX IX_spaced_repetition_datas_vocab_id ON spaced_repetition_datas (vocab_id) WHERE vocab_id != 0');
  late final Index iXSpacedRepetitionDatasKanjiId = Index(
      'IX_spaced_repetition_datas_kanji_id',
      'CREATE INDEX IX_spaced_repetition_datas_kanji_id ON spaced_repetition_datas (kanji_id) WHERE kanji_id != 0');
  late final Index iXProperNounsWriting = Index('IX_proper_nouns_writing',
      'CREATE INDEX IX_proper_nouns_writing ON proper_nouns (writing) WHERE writing IS NOT NULL');
  late final Index iXProperNounsWritingSearchForm = Index(
      'IX_proper_nouns_writing_search_form',
      'CREATE INDEX IX_proper_nouns_writing_search_form ON proper_nouns (writing_search_form) WHERE writing_search_form IS NOT NULL');
  late final Index iXProperNounsReadingSearchForm = Index(
      'IX_proper_nouns_reading_search_form',
      'CREATE INDEX IX_proper_nouns_reading_search_form ON proper_nouns (reading_search_form) WHERE reading_search_form IS NOT NULL');
  late final Index iXProperNounsReadingRomajiSimplified = Index(
      'IX_proper_nouns_reading_romaji_simplified',
      'CREATE INDEX IX_proper_nouns_reading_romaji_simplified ON proper_nouns (reading_romaji_simplified) WHERE reading_romaji_simplified IS NOT NULL');
  late final Index iXProperNounsRomaji = Index('IX_proper_nouns_romaji',
      'CREATE INDEX IX_proper_nouns_romaji ON proper_nouns (romaji COLLATE NOCASE) WHERE romaji');
  late final Index iXMyDictionaryListItemsVocabId = Index(
      'IX_my_dictionary_list_items_vocab_id',
      'CREATE INDEX IX_my_dictionary_list_items_vocab_id ON my_dictionary_list_items (vocab_id) WHERE vocab_id != 0');
  late final Index iXMyDictionaryListItemsKanjiId = Index(
      'IX_my_dictionary_list_items_kanji_id',
      'CREATE INDEX IX_my_dictionary_list_items_kanji_id ON my_dictionary_list_items (kanji_id) WHERE kanji_id != 0');
  late final Index iXKanjiReadingsReadingSearchForm = Index(
      'IX_kanji_readings_reading_search_form',
      'CREATE INDEX IX_kanji_readings_reading_search_form ON kanji_readings (reading_search_form) WHERE reading_search_form IS NOT NULL');
  late final Index iXKanjiReadingsReadingRomajiSimplified = Index(
      'IX_kanji_readings_reading_romaji_simplified',
      'CREATE INDEX IX_kanji_readings_reading_romaji_simplified ON kanji_readings (reading_romaji_simplified) WHERE reading_romaji_simplified IS NOT NULL');
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        vocabWritings,
        iXVocabWritingsWritingSearchForm,
        vocabReadings,
        iXVocabReadingsReadingSearchForm,
        iXVocabReadingsReadingRomajiSimplified,
        vocabs,
        vocabDefinitions,
        vocabDefinitionWords,
        iXVocabWritingsVocabId,
        iXVocabWritingsWriting,
        iXVocabReadingsVocabId,
        iXVocabReadingsReading,
        iXVocabReadingsReadingRomaji,
        iXVocabDefinitionsVocabId,
        iXVocabDefinitionWordsWord,
        kanjis,
        kanjiReadings,
        kanjiMeaningWords,
        iXKanjisRadical,
        iXKanjiReadingsKanjiId,
        iXKanjiReadingsReading,
        iXKanjiReadingsReadingRomaji,
        iXKanjiMeaningWordsWord,
        vocabNotes,
        textAnalysisHistoryItems,
        spacedRepetitionDatas,
        searchHistoryItems,
        radicals,
        uKRadicalsRadical,
        properNouns,
        properNounRomajiWords,
        iXProperNounsReading,
        iXProperNounsReadingRomaji,
        iXProperNounRomajiWordsWord,
        predefinedDictionaryLists,
        myDictionaryLists,
        myDictionaryListItems,
        iXMyDictionaryListItemsListId,
        kanjiNotes,
        flashcardSets,
        flashcardSetReports,
        uXFlashcardSetReportsFlashcardSetIdAndDate,
        dictionaryInfos,
        iXSpacedRepetitionDatasVocabId,
        iXSpacedRepetitionDatasKanjiId,
        iXProperNounsWriting,
        iXProperNounsWritingSearchForm,
        iXProperNounsReadingSearchForm,
        iXProperNounsReadingRomajiSimplified,
        iXProperNounsRomaji,
        iXMyDictionaryListItemsVocabId,
        iXMyDictionaryListItemsKanjiId,
        iXKanjiReadingsReadingSearchForm,
        iXKanjiReadingsReadingRomajiSimplified
      ];
  @override
  int get schemaVersion => 2;
}
