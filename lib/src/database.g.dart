// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $VocabWritingsTable extends VocabWritings
    with TableInfo<$VocabWritingsTable, VocabWriting> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $VocabWritingsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _vocabIdMeta =
      const VerificationMeta('vocabId');
  @override
  late final GeneratedColumn<int> vocabId = GeneratedColumn<int>(
      'vocab_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _writingMeta =
      const VerificationMeta('writing');
  @override
  late final GeneratedColumn<String> writing = GeneratedColumn<String>(
      'writing', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _writingSearchFormMeta =
      const VerificationMeta('writingSearchForm');
  @override
  late final GeneratedColumn<String> writingSearchForm =
      GeneratedColumn<String>('writing_search_form', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _infoMeta = const VerificationMeta('info');
  @override
  late final GeneratedColumnWithTypeConverter<List<WritingInfo>?, String> info =
      GeneratedColumn<String>('info', aliasedName, true,
              type: DriftSqlType.string, requiredDuringInsert: false)
          .withConverter<List<WritingInfo>?>(
              $VocabWritingsTable.$converterinfon);
  @override
  List<GeneratedColumn> get $columns =>
      [id, vocabId, writing, writingSearchForm, info];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'vocab_writings';
  @override
  VerificationContext validateIntegrity(Insertable<VocabWriting> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('vocab_id')) {
      context.handle(_vocabIdMeta,
          vocabId.isAcceptableOrUnknown(data['vocab_id']!, _vocabIdMeta));
    } else if (isInserting) {
      context.missing(_vocabIdMeta);
    }
    if (data.containsKey('writing')) {
      context.handle(_writingMeta,
          writing.isAcceptableOrUnknown(data['writing']!, _writingMeta));
    } else if (isInserting) {
      context.missing(_writingMeta);
    }
    if (data.containsKey('writing_search_form')) {
      context.handle(
          _writingSearchFormMeta,
          writingSearchForm.isAcceptableOrUnknown(
              data['writing_search_form']!, _writingSearchFormMeta));
    }
    context.handle(_infoMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  VocabWriting map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return VocabWriting(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      vocabId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}vocab_id'])!,
      writing: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}writing'])!,
      writingSearchForm: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}writing_search_form']),
      info: $VocabWritingsTable.$converterinfon.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}info'])),
    );
  }

  @override
  $VocabWritingsTable createAlias(String alias) {
    return $VocabWritingsTable(attachedDatabase, alias);
  }

  static TypeConverter<List<WritingInfo>, String> $converterinfo =
      const WritingInfoConverter();
  static TypeConverter<List<WritingInfo>?, String?> $converterinfon =
      NullAwareTypeConverter.wrap($converterinfo);
}

class VocabWriting extends DataClass implements Insertable<VocabWriting> {
  final int id;
  final int vocabId;
  final String writing;
  final String? writingSearchForm;
  final List<WritingInfo>? info;
  const VocabWriting(
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
      map['info'] =
          Variable<String>($VocabWritingsTable.$converterinfon.toSql(info));
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

  factory VocabWriting.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return VocabWriting(
      id: serializer.fromJson<int>(json['id']),
      vocabId: serializer.fromJson<int>(json['vocabId']),
      writing: serializer.fromJson<String>(json['writing']),
      writingSearchForm:
          serializer.fromJson<String?>(json['writingSearchForm']),
      info: serializer.fromJson<List<WritingInfo>?>(json['info']),
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
      'info': serializer.toJson<List<WritingInfo>?>(info),
    };
  }

  VocabWriting copyWith(
          {int? id,
          int? vocabId,
          String? writing,
          Value<String?> writingSearchForm = const Value.absent(),
          Value<List<WritingInfo>?> info = const Value.absent()}) =>
      VocabWriting(
        id: id ?? this.id,
        vocabId: vocabId ?? this.vocabId,
        writing: writing ?? this.writing,
        writingSearchForm: writingSearchForm.present
            ? writingSearchForm.value
            : this.writingSearchForm,
        info: info.present ? info.value : this.info,
      );
  @override
  String toString() {
    return (StringBuffer('VocabWriting(')
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
      (other is VocabWriting &&
          other.id == this.id &&
          other.vocabId == this.vocabId &&
          other.writing == this.writing &&
          other.writingSearchForm == this.writingSearchForm &&
          other.info == this.info);
}

class VocabWritingsCompanion extends UpdateCompanion<VocabWriting> {
  final Value<int> id;
  final Value<int> vocabId;
  final Value<String> writing;
  final Value<String?> writingSearchForm;
  final Value<List<WritingInfo>?> info;
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
  static Insertable<VocabWriting> custom({
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
      Value<List<WritingInfo>?>? info}) {
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
      map['info'] = Variable<String>(
          $VocabWritingsTable.$converterinfon.toSql(info.value));
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

class $VocabReadingsTable extends VocabReadings
    with TableInfo<$VocabReadingsTable, VocabReading> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $VocabReadingsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _vocabIdMeta =
      const VerificationMeta('vocabId');
  @override
  late final GeneratedColumn<int> vocabId = GeneratedColumn<int>(
      'vocab_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _readingMeta =
      const VerificationMeta('reading');
  @override
  late final GeneratedColumn<String> reading = GeneratedColumn<String>(
      'reading', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _readingSearchFormMeta =
      const VerificationMeta('readingSearchForm');
  @override
  late final GeneratedColumn<String> readingSearchForm =
      GeneratedColumn<String>('reading_search_form', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _readingRomajiMeta =
      const VerificationMeta('readingRomaji');
  @override
  late final GeneratedColumn<String> readingRomaji = GeneratedColumn<String>(
      'reading_romaji', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _readingRomajiSimplifiedMeta =
      const VerificationMeta('readingRomajiSimplified');
  @override
  late final GeneratedColumn<String> readingRomajiSimplified =
      GeneratedColumn<String>('reading_romaji_simplified', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _associatedWritingsMeta =
      const VerificationMeta('associatedWritings');
  @override
  late final GeneratedColumnWithTypeConverter<List<String>?, String>
      associatedWritings = GeneratedColumn<String>(
              'associated_writings', aliasedName, true,
              type: DriftSqlType.string, requiredDuringInsert: false)
          .withConverter<List<String>?>(
              $VocabReadingsTable.$converterassociatedWritingsn);
  static const VerificationMeta _infoMeta = const VerificationMeta('info');
  @override
  late final GeneratedColumnWithTypeConverter<List<ReadingInfo>?, String> info =
      GeneratedColumn<String>('info', aliasedName, true,
              type: DriftSqlType.string, requiredDuringInsert: false)
          .withConverter<List<ReadingInfo>?>(
              $VocabReadingsTable.$converterinfon);
  static const VerificationMeta _pitchAccentsMeta =
      const VerificationMeta('pitchAccents');
  @override
  late final GeneratedColumnWithTypeConverter<List<int>?, String> pitchAccents =
      GeneratedColumn<String>('pitch_accents', aliasedName, true,
              type: DriftSqlType.string, requiredDuringInsert: false)
          .withConverter<List<int>?>(
              $VocabReadingsTable.$converterpitchAccentsn);
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
  VerificationContext validateIntegrity(Insertable<VocabReading> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('vocab_id')) {
      context.handle(_vocabIdMeta,
          vocabId.isAcceptableOrUnknown(data['vocab_id']!, _vocabIdMeta));
    } else if (isInserting) {
      context.missing(_vocabIdMeta);
    }
    if (data.containsKey('reading')) {
      context.handle(_readingMeta,
          reading.isAcceptableOrUnknown(data['reading']!, _readingMeta));
    } else if (isInserting) {
      context.missing(_readingMeta);
    }
    if (data.containsKey('reading_search_form')) {
      context.handle(
          _readingSearchFormMeta,
          readingSearchForm.isAcceptableOrUnknown(
              data['reading_search_form']!, _readingSearchFormMeta));
    }
    if (data.containsKey('reading_romaji')) {
      context.handle(
          _readingRomajiMeta,
          readingRomaji.isAcceptableOrUnknown(
              data['reading_romaji']!, _readingRomajiMeta));
    } else if (isInserting) {
      context.missing(_readingRomajiMeta);
    }
    if (data.containsKey('reading_romaji_simplified')) {
      context.handle(
          _readingRomajiSimplifiedMeta,
          readingRomajiSimplified.isAcceptableOrUnknown(
              data['reading_romaji_simplified']!,
              _readingRomajiSimplifiedMeta));
    }
    context.handle(_associatedWritingsMeta, const VerificationResult.success());
    context.handle(_infoMeta, const VerificationResult.success());
    context.handle(_pitchAccentsMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  VocabReading map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return VocabReading(
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
      associatedWritings: $VocabReadingsTable.$converterassociatedWritingsn
          .fromSql(attachedDatabase.typeMapping.read(DriftSqlType.string,
              data['${effectivePrefix}associated_writings'])),
      info: $VocabReadingsTable.$converterinfon.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}info'])),
      pitchAccents: $VocabReadingsTable.$converterpitchAccentsn.fromSql(
          attachedDatabase.typeMapping.read(
              DriftSqlType.string, data['${effectivePrefix}pitch_accents'])),
    );
  }

  @override
  $VocabReadingsTable createAlias(String alias) {
    return $VocabReadingsTable(attachedDatabase, alias);
  }

  static TypeConverter<List<String>, String> $converterassociatedWritings =
      const StringListConverter();
  static TypeConverter<List<String>?, String?> $converterassociatedWritingsn =
      NullAwareTypeConverter.wrap($converterassociatedWritings);
  static TypeConverter<List<ReadingInfo>, String> $converterinfo =
      const ReadingInfoConverter();
  static TypeConverter<List<ReadingInfo>?, String?> $converterinfon =
      NullAwareTypeConverter.wrap($converterinfo);
  static TypeConverter<List<int>, String> $converterpitchAccents =
      const IntListConverter();
  static TypeConverter<List<int>?, String?> $converterpitchAccentsn =
      NullAwareTypeConverter.wrap($converterpitchAccents);
}

class VocabReading extends DataClass implements Insertable<VocabReading> {
  final int id;
  final int vocabId;
  final String reading;
  final String? readingSearchForm;
  final String readingRomaji;
  final String? readingRomajiSimplified;
  final List<String>? associatedWritings;
  final List<ReadingInfo>? info;
  final List<int>? pitchAccents;
  const VocabReading(
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
      map['associated_writings'] = Variable<String>($VocabReadingsTable
          .$converterassociatedWritingsn
          .toSql(associatedWritings));
    }
    if (!nullToAbsent || info != null) {
      map['info'] =
          Variable<String>($VocabReadingsTable.$converterinfon.toSql(info));
    }
    if (!nullToAbsent || pitchAccents != null) {
      map['pitch_accents'] = Variable<String>(
          $VocabReadingsTable.$converterpitchAccentsn.toSql(pitchAccents));
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

  factory VocabReading.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return VocabReading(
      id: serializer.fromJson<int>(json['id']),
      vocabId: serializer.fromJson<int>(json['vocabId']),
      reading: serializer.fromJson<String>(json['reading']),
      readingSearchForm:
          serializer.fromJson<String?>(json['readingSearchForm']),
      readingRomaji: serializer.fromJson<String>(json['readingRomaji']),
      readingRomajiSimplified:
          serializer.fromJson<String?>(json['readingRomajiSimplified']),
      associatedWritings:
          serializer.fromJson<List<String>?>(json['associatedWritings']),
      info: serializer.fromJson<List<ReadingInfo>?>(json['info']),
      pitchAccents: serializer.fromJson<List<int>?>(json['pitchAccents']),
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
      'associatedWritings':
          serializer.toJson<List<String>?>(associatedWritings),
      'info': serializer.toJson<List<ReadingInfo>?>(info),
      'pitchAccents': serializer.toJson<List<int>?>(pitchAccents),
    };
  }

  VocabReading copyWith(
          {int? id,
          int? vocabId,
          String? reading,
          Value<String?> readingSearchForm = const Value.absent(),
          String? readingRomaji,
          Value<String?> readingRomajiSimplified = const Value.absent(),
          Value<List<String>?> associatedWritings = const Value.absent(),
          Value<List<ReadingInfo>?> info = const Value.absent(),
          Value<List<int>?> pitchAccents = const Value.absent()}) =>
      VocabReading(
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
  @override
  String toString() {
    return (StringBuffer('VocabReading(')
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
      (other is VocabReading &&
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

class VocabReadingsCompanion extends UpdateCompanion<VocabReading> {
  final Value<int> id;
  final Value<int> vocabId;
  final Value<String> reading;
  final Value<String?> readingSearchForm;
  final Value<String> readingRomaji;
  final Value<String?> readingRomajiSimplified;
  final Value<List<String>?> associatedWritings;
  final Value<List<ReadingInfo>?> info;
  final Value<List<int>?> pitchAccents;
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
  static Insertable<VocabReading> custom({
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
      Value<List<String>?>? associatedWritings,
      Value<List<ReadingInfo>?>? info,
      Value<List<int>?>? pitchAccents}) {
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
      map['associated_writings'] = Variable<String>($VocabReadingsTable
          .$converterassociatedWritingsn
          .toSql(associatedWritings.value));
    }
    if (info.present) {
      map['info'] = Variable<String>(
          $VocabReadingsTable.$converterinfon.toSql(info.value));
    }
    if (pitchAccents.present) {
      map['pitch_accents'] = Variable<String>($VocabReadingsTable
          .$converterpitchAccentsn
          .toSql(pitchAccents.value));
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

class $VocabsTable extends Vocabs with TableInfo<$VocabsTable, Vocab> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $VocabsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _posMeta = const VerificationMeta('pos');
  @override
  late final GeneratedColumnWithTypeConverter<List<PartOfSpeech>?, String> pos =
      GeneratedColumn<String>('pos', aliasedName, true,
              type: DriftSqlType.string, requiredDuringInsert: false)
          .withConverter<List<PartOfSpeech>?>($VocabsTable.$converterposn);
  static const VerificationMeta _commonMeta = const VerificationMeta('common');
  @override
  late final GeneratedColumn<bool> common = GeneratedColumn<bool>(
      'common', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("common" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _frequencyScoreMeta =
      const VerificationMeta('frequencyScore');
  @override
  late final GeneratedColumn<int> frequencyScore = GeneratedColumn<int>(
      'frequency_score', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  @override
  List<GeneratedColumn> get $columns => [id, pos, common, frequencyScore];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'vocabs';
  @override
  VerificationContext validateIntegrity(Insertable<Vocab> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    context.handle(_posMeta, const VerificationResult.success());
    if (data.containsKey('common')) {
      context.handle(_commonMeta,
          common.isAcceptableOrUnknown(data['common']!, _commonMeta));
    }
    if (data.containsKey('frequency_score')) {
      context.handle(
          _frequencyScoreMeta,
          frequencyScore.isAcceptableOrUnknown(
              data['frequency_score']!, _frequencyScoreMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Vocab map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Vocab(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      pos: $VocabsTable.$converterposn.fromSql(attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}pos'])),
      common: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}common'])!,
      frequencyScore: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}frequency_score'])!,
    );
  }

  @override
  $VocabsTable createAlias(String alias) {
    return $VocabsTable(attachedDatabase, alias);
  }

  static TypeConverter<List<PartOfSpeech>, String> $converterpos =
      const PartOfSpeechConverter();
  static TypeConverter<List<PartOfSpeech>?, String?> $converterposn =
      NullAwareTypeConverter.wrap($converterpos);
}

class VocabsCompanion extends UpdateCompanion<Vocab> {
  final Value<int> id;
  final Value<List<PartOfSpeech>?> pos;
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
  static Insertable<Vocab> custom({
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
      Value<List<PartOfSpeech>?>? pos,
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
      map['pos'] =
          Variable<String>($VocabsTable.$converterposn.toSql(pos.value));
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

class $VocabDefinitionsTable extends VocabDefinitions
    with TableInfo<$VocabDefinitionsTable, VocabDefinition> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $VocabDefinitionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _vocabIdMeta =
      const VerificationMeta('vocabId');
  @override
  late final GeneratedColumn<int> vocabId = GeneratedColumn<int>(
      'vocab_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _definitionMeta =
      const VerificationMeta('definition');
  @override
  late final GeneratedColumn<String> definition = GeneratedColumn<String>(
      'definition', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _additionalInfoMeta =
      const VerificationMeta('additionalInfo');
  @override
  late final GeneratedColumn<String> additionalInfo = GeneratedColumn<String>(
      'additional_info', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _posMeta = const VerificationMeta('pos');
  @override
  late final GeneratedColumnWithTypeConverter<List<PartOfSpeech>?, String> pos =
      GeneratedColumn<String>('pos', aliasedName, true,
              type: DriftSqlType.string, requiredDuringInsert: false)
          .withConverter<List<PartOfSpeech>?>(
              $VocabDefinitionsTable.$converterposn);
  static const VerificationMeta _appliesToMeta =
      const VerificationMeta('appliesTo');
  @override
  late final GeneratedColumnWithTypeConverter<List<String>?, String> appliesTo =
      GeneratedColumn<String>('applies_to', aliasedName, true,
              type: DriftSqlType.string, requiredDuringInsert: false)
          .withConverter<List<String>?>(
              $VocabDefinitionsTable.$converterappliesTon);
  static const VerificationMeta _fieldsMeta = const VerificationMeta('fields');
  @override
  late final GeneratedColumnWithTypeConverter<List<Field>?, String> fields =
      GeneratedColumn<String>('fields', aliasedName, true,
              type: DriftSqlType.string, requiredDuringInsert: false)
          .withConverter<List<Field>?>(
              $VocabDefinitionsTable.$converterfieldsn);
  static const VerificationMeta _miscInfoMeta =
      const VerificationMeta('miscInfo');
  @override
  late final GeneratedColumnWithTypeConverter<List<MiscellaneousInfo>?, String>
      miscInfo = GeneratedColumn<String>('misc_info', aliasedName, true,
              type: DriftSqlType.string, requiredDuringInsert: false)
          .withConverter<List<MiscellaneousInfo>?>(
              $VocabDefinitionsTable.$convertermiscInfon);
  static const VerificationMeta _dialectsMeta =
      const VerificationMeta('dialects');
  @override
  late final GeneratedColumnWithTypeConverter<List<Dialect>?, String> dialects =
      GeneratedColumn<String>('dialects', aliasedName, true,
              type: DriftSqlType.string, requiredDuringInsert: false)
          .withConverter<List<Dialect>?>(
              $VocabDefinitionsTable.$converterdialectsn);
  static const VerificationMeta _examplesMeta =
      const VerificationMeta('examples');
  @override
  late final GeneratedColumnWithTypeConverter<List<VocabExample>?, String>
      examples = GeneratedColumn<String>('examples', aliasedName, true,
              type: DriftSqlType.string, requiredDuringInsert: false)
          .withConverter<List<VocabExample>?>(
              $VocabDefinitionsTable.$converterexamplesn);
  static const VerificationMeta _languageSourceMeta =
      const VerificationMeta('languageSource');
  @override
  late final GeneratedColumnWithTypeConverter<List<LanguageSource>?, String>
      languageSource = GeneratedColumn<String>(
              'language_source', aliasedName, true,
              type: DriftSqlType.string, requiredDuringInsert: false)
          .withConverter<List<LanguageSource>?>(
              $VocabDefinitionsTable.$converterlanguageSourcen);
  static const VerificationMeta _waseieigoMeta =
      const VerificationMeta('waseieigo');
  @override
  late final GeneratedColumn<bool> waseieigo = GeneratedColumn<bool>(
      'waseieigo', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("waseieigo" IN (0, 1))'));
  static const VerificationMeta _crossReferencesMeta =
      const VerificationMeta('crossReferences');
  @override
  late final GeneratedColumnWithTypeConverter<List<VocabReference>?, String>
      crossReferences = GeneratedColumn<String>(
              'cross_references', aliasedName, true,
              type: DriftSqlType.string, requiredDuringInsert: false)
          .withConverter<List<VocabReference>?>(
              $VocabDefinitionsTable.$convertercrossReferencesn);
  static const VerificationMeta _antonymsMeta =
      const VerificationMeta('antonyms');
  @override
  late final GeneratedColumnWithTypeConverter<List<VocabReference>?, String>
      antonyms = GeneratedColumn<String>('antonyms', aliasedName, true,
              type: DriftSqlType.string, requiredDuringInsert: false)
          .withConverter<List<VocabReference>?>(
              $VocabDefinitionsTable.$converterantonymsn);
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
  VerificationContext validateIntegrity(Insertable<VocabDefinition> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('vocab_id')) {
      context.handle(_vocabIdMeta,
          vocabId.isAcceptableOrUnknown(data['vocab_id']!, _vocabIdMeta));
    } else if (isInserting) {
      context.missing(_vocabIdMeta);
    }
    if (data.containsKey('definition')) {
      context.handle(
          _definitionMeta,
          definition.isAcceptableOrUnknown(
              data['definition']!, _definitionMeta));
    } else if (isInserting) {
      context.missing(_definitionMeta);
    }
    if (data.containsKey('additional_info')) {
      context.handle(
          _additionalInfoMeta,
          additionalInfo.isAcceptableOrUnknown(
              data['additional_info']!, _additionalInfoMeta));
    }
    context.handle(_posMeta, const VerificationResult.success());
    context.handle(_appliesToMeta, const VerificationResult.success());
    context.handle(_fieldsMeta, const VerificationResult.success());
    context.handle(_miscInfoMeta, const VerificationResult.success());
    context.handle(_dialectsMeta, const VerificationResult.success());
    context.handle(_examplesMeta, const VerificationResult.success());
    context.handle(_languageSourceMeta, const VerificationResult.success());
    if (data.containsKey('waseieigo')) {
      context.handle(_waseieigoMeta,
          waseieigo.isAcceptableOrUnknown(data['waseieigo']!, _waseieigoMeta));
    } else if (isInserting) {
      context.missing(_waseieigoMeta);
    }
    context.handle(_crossReferencesMeta, const VerificationResult.success());
    context.handle(_antonymsMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  VocabDefinition map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return VocabDefinition(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      vocabId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}vocab_id'])!,
      definition: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}definition'])!,
      additionalInfo: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}additional_info']),
      pos: $VocabDefinitionsTable.$converterposn.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}pos'])),
      appliesTo: $VocabDefinitionsTable.$converterappliesTon.fromSql(
          attachedDatabase.typeMapping
              .read(DriftSqlType.string, data['${effectivePrefix}applies_to'])),
      fields: $VocabDefinitionsTable.$converterfieldsn.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}fields'])),
      miscInfo: $VocabDefinitionsTable.$convertermiscInfon.fromSql(
          attachedDatabase.typeMapping
              .read(DriftSqlType.string, data['${effectivePrefix}misc_info'])),
      dialects: $VocabDefinitionsTable.$converterdialectsn.fromSql(
          attachedDatabase.typeMapping
              .read(DriftSqlType.string, data['${effectivePrefix}dialects'])),
      examples: $VocabDefinitionsTable.$converterexamplesn.fromSql(
          attachedDatabase.typeMapping
              .read(DriftSqlType.string, data['${effectivePrefix}examples'])),
      languageSource: $VocabDefinitionsTable.$converterlanguageSourcen.fromSql(
          attachedDatabase.typeMapping.read(
              DriftSqlType.string, data['${effectivePrefix}language_source'])),
      waseieigo: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}waseieigo'])!,
      crossReferences: $VocabDefinitionsTable.$convertercrossReferencesn
          .fromSql(attachedDatabase.typeMapping.read(
              DriftSqlType.string, data['${effectivePrefix}cross_references'])),
      antonyms: $VocabDefinitionsTable.$converterantonymsn.fromSql(
          attachedDatabase.typeMapping
              .read(DriftSqlType.string, data['${effectivePrefix}antonyms'])),
    );
  }

  @override
  $VocabDefinitionsTable createAlias(String alias) {
    return $VocabDefinitionsTable(attachedDatabase, alias);
  }

  static TypeConverter<List<PartOfSpeech>, String> $converterpos =
      const PartOfSpeechConverter();
  static TypeConverter<List<PartOfSpeech>?, String?> $converterposn =
      NullAwareTypeConverter.wrap($converterpos);
  static TypeConverter<List<String>, String> $converterappliesTo =
      const StringListConverter();
  static TypeConverter<List<String>?, String?> $converterappliesTon =
      NullAwareTypeConverter.wrap($converterappliesTo);
  static TypeConverter<List<Field>, String> $converterfields =
      const FieldConverter();
  static TypeConverter<List<Field>?, String?> $converterfieldsn =
      NullAwareTypeConverter.wrap($converterfields);
  static TypeConverter<List<MiscellaneousInfo>, String> $convertermiscInfo =
      const MiscellaneousInfoConverter();
  static TypeConverter<List<MiscellaneousInfo>?, String?> $convertermiscInfon =
      NullAwareTypeConverter.wrap($convertermiscInfo);
  static TypeConverter<List<Dialect>, String> $converterdialects =
      const DialectConverter();
  static TypeConverter<List<Dialect>?, String?> $converterdialectsn =
      NullAwareTypeConverter.wrap($converterdialects);
  static TypeConverter<List<VocabExample>, String> $converterexamples =
      const VocabExampleConverter();
  static TypeConverter<List<VocabExample>?, String?> $converterexamplesn =
      NullAwareTypeConverter.wrap($converterexamples);
  static TypeConverter<List<LanguageSource>, String> $converterlanguageSource =
      const LanguageSourceConverter();
  static TypeConverter<List<LanguageSource>?, String?>
      $converterlanguageSourcen =
      NullAwareTypeConverter.wrap($converterlanguageSource);
  static TypeConverter<List<VocabReference>, String> $convertercrossReferences =
      const VocabReferenceConverter();
  static TypeConverter<List<VocabReference>?, String?>
      $convertercrossReferencesn =
      NullAwareTypeConverter.wrap($convertercrossReferences);
  static TypeConverter<List<VocabReference>, String> $converterantonyms =
      const VocabReferenceConverter();
  static TypeConverter<List<VocabReference>?, String?> $converterantonymsn =
      NullAwareTypeConverter.wrap($converterantonyms);
}

class VocabDefinition extends DataClass implements Insertable<VocabDefinition> {
  final int id;
  final int vocabId;
  final String definition;
  final String? additionalInfo;
  final List<PartOfSpeech>? pos;
  final List<String>? appliesTo;
  final List<Field>? fields;
  final List<MiscellaneousInfo>? miscInfo;
  final List<Dialect>? dialects;
  final List<VocabExample>? examples;
  final List<LanguageSource>? languageSource;
  final bool waseieigo;
  final List<VocabReference>? crossReferences;
  final List<VocabReference>? antonyms;
  const VocabDefinition(
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
      map['pos'] =
          Variable<String>($VocabDefinitionsTable.$converterposn.toSql(pos));
    }
    if (!nullToAbsent || appliesTo != null) {
      map['applies_to'] = Variable<String>(
          $VocabDefinitionsTable.$converterappliesTon.toSql(appliesTo));
    }
    if (!nullToAbsent || fields != null) {
      map['fields'] = Variable<String>(
          $VocabDefinitionsTable.$converterfieldsn.toSql(fields));
    }
    if (!nullToAbsent || miscInfo != null) {
      map['misc_info'] = Variable<String>(
          $VocabDefinitionsTable.$convertermiscInfon.toSql(miscInfo));
    }
    if (!nullToAbsent || dialects != null) {
      map['dialects'] = Variable<String>(
          $VocabDefinitionsTable.$converterdialectsn.toSql(dialects));
    }
    if (!nullToAbsent || examples != null) {
      map['examples'] = Variable<String>(
          $VocabDefinitionsTable.$converterexamplesn.toSql(examples));
    }
    if (!nullToAbsent || languageSource != null) {
      map['language_source'] = Variable<String>($VocabDefinitionsTable
          .$converterlanguageSourcen
          .toSql(languageSource));
    }
    map['waseieigo'] = Variable<bool>(waseieigo);
    if (!nullToAbsent || crossReferences != null) {
      map['cross_references'] = Variable<String>($VocabDefinitionsTable
          .$convertercrossReferencesn
          .toSql(crossReferences));
    }
    if (!nullToAbsent || antonyms != null) {
      map['antonyms'] = Variable<String>(
          $VocabDefinitionsTable.$converterantonymsn.toSql(antonyms));
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

  factory VocabDefinition.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return VocabDefinition(
      id: serializer.fromJson<int>(json['id']),
      vocabId: serializer.fromJson<int>(json['vocabId']),
      definition: serializer.fromJson<String>(json['definition']),
      additionalInfo: serializer.fromJson<String?>(json['additionalInfo']),
      pos: serializer.fromJson<List<PartOfSpeech>?>(json['pos']),
      appliesTo: serializer.fromJson<List<String>?>(json['appliesTo']),
      fields: serializer.fromJson<List<Field>?>(json['fields']),
      miscInfo: serializer.fromJson<List<MiscellaneousInfo>?>(json['miscInfo']),
      dialects: serializer.fromJson<List<Dialect>?>(json['dialects']),
      examples: serializer.fromJson<List<VocabExample>?>(json['examples']),
      languageSource:
          serializer.fromJson<List<LanguageSource>?>(json['languageSource']),
      waseieigo: serializer.fromJson<bool>(json['waseieigo']),
      crossReferences:
          serializer.fromJson<List<VocabReference>?>(json['crossReferences']),
      antonyms: serializer.fromJson<List<VocabReference>?>(json['antonyms']),
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
      'pos': serializer.toJson<List<PartOfSpeech>?>(pos),
      'appliesTo': serializer.toJson<List<String>?>(appliesTo),
      'fields': serializer.toJson<List<Field>?>(fields),
      'miscInfo': serializer.toJson<List<MiscellaneousInfo>?>(miscInfo),
      'dialects': serializer.toJson<List<Dialect>?>(dialects),
      'examples': serializer.toJson<List<VocabExample>?>(examples),
      'languageSource':
          serializer.toJson<List<LanguageSource>?>(languageSource),
      'waseieigo': serializer.toJson<bool>(waseieigo),
      'crossReferences':
          serializer.toJson<List<VocabReference>?>(crossReferences),
      'antonyms': serializer.toJson<List<VocabReference>?>(antonyms),
    };
  }

  VocabDefinition copyWith(
          {int? id,
          int? vocabId,
          String? definition,
          Value<String?> additionalInfo = const Value.absent(),
          Value<List<PartOfSpeech>?> pos = const Value.absent(),
          Value<List<String>?> appliesTo = const Value.absent(),
          Value<List<Field>?> fields = const Value.absent(),
          Value<List<MiscellaneousInfo>?> miscInfo = const Value.absent(),
          Value<List<Dialect>?> dialects = const Value.absent(),
          Value<List<VocabExample>?> examples = const Value.absent(),
          Value<List<LanguageSource>?> languageSource = const Value.absent(),
          bool? waseieigo,
          Value<List<VocabReference>?> crossReferences = const Value.absent(),
          Value<List<VocabReference>?> antonyms = const Value.absent()}) =>
      VocabDefinition(
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
  @override
  String toString() {
    return (StringBuffer('VocabDefinition(')
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
      (other is VocabDefinition &&
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

class VocabDefinitionsCompanion extends UpdateCompanion<VocabDefinition> {
  final Value<int> id;
  final Value<int> vocabId;
  final Value<String> definition;
  final Value<String?> additionalInfo;
  final Value<List<PartOfSpeech>?> pos;
  final Value<List<String>?> appliesTo;
  final Value<List<Field>?> fields;
  final Value<List<MiscellaneousInfo>?> miscInfo;
  final Value<List<Dialect>?> dialects;
  final Value<List<VocabExample>?> examples;
  final Value<List<LanguageSource>?> languageSource;
  final Value<bool> waseieigo;
  final Value<List<VocabReference>?> crossReferences;
  final Value<List<VocabReference>?> antonyms;
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
  static Insertable<VocabDefinition> custom({
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
      Value<List<PartOfSpeech>?>? pos,
      Value<List<String>?>? appliesTo,
      Value<List<Field>?>? fields,
      Value<List<MiscellaneousInfo>?>? miscInfo,
      Value<List<Dialect>?>? dialects,
      Value<List<VocabExample>?>? examples,
      Value<List<LanguageSource>?>? languageSource,
      Value<bool>? waseieigo,
      Value<List<VocabReference>?>? crossReferences,
      Value<List<VocabReference>?>? antonyms}) {
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
      map['pos'] = Variable<String>(
          $VocabDefinitionsTable.$converterposn.toSql(pos.value));
    }
    if (appliesTo.present) {
      map['applies_to'] = Variable<String>(
          $VocabDefinitionsTable.$converterappliesTon.toSql(appliesTo.value));
    }
    if (fields.present) {
      map['fields'] = Variable<String>(
          $VocabDefinitionsTable.$converterfieldsn.toSql(fields.value));
    }
    if (miscInfo.present) {
      map['misc_info'] = Variable<String>(
          $VocabDefinitionsTable.$convertermiscInfon.toSql(miscInfo.value));
    }
    if (dialects.present) {
      map['dialects'] = Variable<String>(
          $VocabDefinitionsTable.$converterdialectsn.toSql(dialects.value));
    }
    if (examples.present) {
      map['examples'] = Variable<String>(
          $VocabDefinitionsTable.$converterexamplesn.toSql(examples.value));
    }
    if (languageSource.present) {
      map['language_source'] = Variable<String>($VocabDefinitionsTable
          .$converterlanguageSourcen
          .toSql(languageSource.value));
    }
    if (waseieigo.present) {
      map['waseieigo'] = Variable<bool>(waseieigo.value);
    }
    if (crossReferences.present) {
      map['cross_references'] = Variable<String>($VocabDefinitionsTable
          .$convertercrossReferencesn
          .toSql(crossReferences.value));
    }
    if (antonyms.present) {
      map['antonyms'] = Variable<String>(
          $VocabDefinitionsTable.$converterantonymsn.toSql(antonyms.value));
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

class $VocabDefinitionWordsTable extends VocabDefinitionWords
    with TableInfo<$VocabDefinitionWordsTable, VocabDefinitionWord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $VocabDefinitionWordsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _wordMeta = const VerificationMeta('word');
  @override
  late final GeneratedColumn<String> word = GeneratedColumn<String>(
      'word', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _vocabIdMeta =
      const VerificationMeta('vocabId');
  @override
  late final GeneratedColumn<int> vocabId = GeneratedColumn<int>(
      'vocab_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [word, vocabId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'vocab_definition_words';
  @override
  VerificationContext validateIntegrity(
      Insertable<VocabDefinitionWord> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('word')) {
      context.handle(
          _wordMeta, word.isAcceptableOrUnknown(data['word']!, _wordMeta));
    } else if (isInserting) {
      context.missing(_wordMeta);
    }
    if (data.containsKey('vocab_id')) {
      context.handle(_vocabIdMeta,
          vocabId.isAcceptableOrUnknown(data['vocab_id']!, _vocabIdMeta));
    } else if (isInserting) {
      context.missing(_vocabIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  VocabDefinitionWord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return VocabDefinitionWord(
      word: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}word'])!,
      vocabId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}vocab_id'])!,
    );
  }

  @override
  $VocabDefinitionWordsTable createAlias(String alias) {
    return $VocabDefinitionWordsTable(attachedDatabase, alias);
  }
}

class VocabDefinitionWord extends DataClass
    implements Insertable<VocabDefinitionWord> {
  final String word;
  final int vocabId;
  const VocabDefinitionWord({required this.word, required this.vocabId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['word'] = Variable<String>(word);
    map['vocab_id'] = Variable<int>(vocabId);
    return map;
  }

  VocabDefinitionWordsCompanion toCompanion(bool nullToAbsent) {
    return VocabDefinitionWordsCompanion(
      word: Value(word),
      vocabId: Value(vocabId),
    );
  }

  factory VocabDefinitionWord.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return VocabDefinitionWord(
      word: serializer.fromJson<String>(json['word']),
      vocabId: serializer.fromJson<int>(json['vocabId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'word': serializer.toJson<String>(word),
      'vocabId': serializer.toJson<int>(vocabId),
    };
  }

  VocabDefinitionWord copyWith({String? word, int? vocabId}) =>
      VocabDefinitionWord(
        word: word ?? this.word,
        vocabId: vocabId ?? this.vocabId,
      );
  @override
  String toString() {
    return (StringBuffer('VocabDefinitionWord(')
          ..write('word: $word, ')
          ..write('vocabId: $vocabId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(word, vocabId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is VocabDefinitionWord &&
          other.word == this.word &&
          other.vocabId == this.vocabId);
}

class VocabDefinitionWordsCompanion
    extends UpdateCompanion<VocabDefinitionWord> {
  final Value<String> word;
  final Value<int> vocabId;
  final Value<int> rowid;
  const VocabDefinitionWordsCompanion({
    this.word = const Value.absent(),
    this.vocabId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  VocabDefinitionWordsCompanion.insert({
    required String word,
    required int vocabId,
    this.rowid = const Value.absent(),
  })  : word = Value(word),
        vocabId = Value(vocabId);
  static Insertable<VocabDefinitionWord> custom({
    Expression<String>? word,
    Expression<int>? vocabId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (word != null) 'word': word,
      if (vocabId != null) 'vocab_id': vocabId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  VocabDefinitionWordsCompanion copyWith(
      {Value<String>? word, Value<int>? vocabId, Value<int>? rowid}) {
    return VocabDefinitionWordsCompanion(
      word: word ?? this.word,
      vocabId: vocabId ?? this.vocabId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (word.present) {
      map['word'] = Variable<String>(word.value);
    }
    if (vocabId.present) {
      map['vocab_id'] = Variable<int>(vocabId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('VocabDefinitionWordsCompanion(')
          ..write('word: $word, ')
          ..write('vocabId: $vocabId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $KanjisTable extends Kanjis with TableInfo<$KanjisTable, Kanji> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $KanjisTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _kanjiMeta = const VerificationMeta('kanji');
  @override
  late final GeneratedColumn<String> kanji = GeneratedColumn<String>(
      'kanji', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _radicalMeta =
      const VerificationMeta('radical');
  @override
  late final GeneratedColumn<String> radical = GeneratedColumn<String>(
      'radical', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _componentsMeta =
      const VerificationMeta('components');
  @override
  late final GeneratedColumnWithTypeConverter<List<String>?, String>
      components = GeneratedColumn<String>('components', aliasedName, true,
              type: DriftSqlType.string, requiredDuringInsert: false)
          .withConverter<List<String>?>($KanjisTable.$convertercomponentsn);
  static const VerificationMeta _gradeMeta = const VerificationMeta('grade');
  @override
  late final GeneratedColumnWithTypeConverter<KanjiGrade?, int> grade =
      GeneratedColumn<int>('grade', aliasedName, true,
              type: DriftSqlType.int, requiredDuringInsert: false)
          .withConverter<KanjiGrade?>($KanjisTable.$convertergraden);
  static const VerificationMeta _strokeCountMeta =
      const VerificationMeta('strokeCount');
  @override
  late final GeneratedColumn<int> strokeCount = GeneratedColumn<int>(
      'stroke_count', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _frequencyMeta =
      const VerificationMeta('frequency');
  @override
  late final GeneratedColumn<int> frequency = GeneratedColumn<int>(
      'frequency', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _jlptMeta = const VerificationMeta('jlpt');
  @override
  late final GeneratedColumnWithTypeConverter<JlptLevel?, int> jlpt =
      GeneratedColumn<int>('jlpt', aliasedName, true,
              type: DriftSqlType.int, requiredDuringInsert: false)
          .withConverter<JlptLevel?>($KanjisTable.$converterjlptn);
  static const VerificationMeta _meaningMeta =
      const VerificationMeta('meaning');
  @override
  late final GeneratedColumn<String> meaning = GeneratedColumn<String>(
      'meaning', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _strokesMeta =
      const VerificationMeta('strokes');
  @override
  late final GeneratedColumnWithTypeConverter<List<String>?, String> strokes =
      GeneratedColumn<String>('strokes', aliasedName, true,
              type: DriftSqlType.string, requiredDuringInsert: false)
          .withConverter<List<String>?>($KanjisTable.$converterstrokesn);
  static const VerificationMeta _compoundsMeta =
      const VerificationMeta('compounds');
  @override
  late final GeneratedColumnWithTypeConverter<List<int>?, String> compounds =
      GeneratedColumn<String>('compounds', aliasedName, true,
              type: DriftSqlType.string, requiredDuringInsert: false)
          .withConverter<List<int>?>($KanjisTable.$convertercompoundsn);
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
  VerificationContext validateIntegrity(Insertable<Kanji> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('kanji')) {
      context.handle(
          _kanjiMeta, kanji.isAcceptableOrUnknown(data['kanji']!, _kanjiMeta));
    } else if (isInserting) {
      context.missing(_kanjiMeta);
    }
    if (data.containsKey('radical')) {
      context.handle(_radicalMeta,
          radical.isAcceptableOrUnknown(data['radical']!, _radicalMeta));
    } else if (isInserting) {
      context.missing(_radicalMeta);
    }
    context.handle(_componentsMeta, const VerificationResult.success());
    context.handle(_gradeMeta, const VerificationResult.success());
    if (data.containsKey('stroke_count')) {
      context.handle(
          _strokeCountMeta,
          strokeCount.isAcceptableOrUnknown(
              data['stroke_count']!, _strokeCountMeta));
    } else if (isInserting) {
      context.missing(_strokeCountMeta);
    }
    if (data.containsKey('frequency')) {
      context.handle(_frequencyMeta,
          frequency.isAcceptableOrUnknown(data['frequency']!, _frequencyMeta));
    }
    context.handle(_jlptMeta, const VerificationResult.success());
    if (data.containsKey('meaning')) {
      context.handle(_meaningMeta,
          meaning.isAcceptableOrUnknown(data['meaning']!, _meaningMeta));
    }
    context.handle(_strokesMeta, const VerificationResult.success());
    context.handle(_compoundsMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Kanji map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Kanji(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      kanji: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}kanji'])!,
      meaning: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}meaning']),
      radical: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}radical'])!,
      components: $KanjisTable.$convertercomponentsn.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}components'])),
      grade: $KanjisTable.$convertergraden.fromSql(attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}grade'])),
      strokeCount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}stroke_count'])!,
      frequency: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}frequency']),
      jlpt: $KanjisTable.$converterjlptn.fromSql(attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}jlpt'])),
      strokes: $KanjisTable.$converterstrokesn.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}strokes'])),
      compounds: $KanjisTable.$convertercompoundsn.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}compounds'])),
    );
  }

  @override
  $KanjisTable createAlias(String alias) {
    return $KanjisTable(attachedDatabase, alias);
  }

  static TypeConverter<List<String>, String> $convertercomponents =
      const StringListConverter();
  static TypeConverter<List<String>?, String?> $convertercomponentsn =
      NullAwareTypeConverter.wrap($convertercomponents);
  static JsonTypeConverter2<KanjiGrade, int, int> $convertergrade =
      const EnumIndexConverter<KanjiGrade>(KanjiGrade.values);
  static JsonTypeConverter2<KanjiGrade?, int?, int?> $convertergraden =
      JsonTypeConverter2.asNullable($convertergrade);
  static JsonTypeConverter2<JlptLevel, int, int> $converterjlpt =
      const EnumIndexConverter<JlptLevel>(JlptLevel.values);
  static JsonTypeConverter2<JlptLevel?, int?, int?> $converterjlptn =
      JsonTypeConverter2.asNullable($converterjlpt);
  static TypeConverter<List<String>, String> $converterstrokes =
      const StringListConverter();
  static TypeConverter<List<String>?, String?> $converterstrokesn =
      NullAwareTypeConverter.wrap($converterstrokes);
  static TypeConverter<List<int>, String> $convertercompounds =
      const IntListConverter();
  static TypeConverter<List<int>?, String?> $convertercompoundsn =
      NullAwareTypeConverter.wrap($convertercompounds);
}

class KanjisCompanion extends UpdateCompanion<Kanji> {
  final Value<int> id;
  final Value<String> kanji;
  final Value<String> radical;
  final Value<List<String>?> components;
  final Value<KanjiGrade?> grade;
  final Value<int> strokeCount;
  final Value<int?> frequency;
  final Value<JlptLevel?> jlpt;
  final Value<String?> meaning;
  final Value<List<String>?> strokes;
  final Value<List<int>?> compounds;
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
  static Insertable<Kanji> custom({
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
      Value<List<String>?>? components,
      Value<KanjiGrade?>? grade,
      Value<int>? strokeCount,
      Value<int?>? frequency,
      Value<JlptLevel?>? jlpt,
      Value<String?>? meaning,
      Value<List<String>?>? strokes,
      Value<List<int>?>? compounds}) {
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
      map['components'] = Variable<String>(
          $KanjisTable.$convertercomponentsn.toSql(components.value));
    }
    if (grade.present) {
      map['grade'] =
          Variable<int>($KanjisTable.$convertergraden.toSql(grade.value));
    }
    if (strokeCount.present) {
      map['stroke_count'] = Variable<int>(strokeCount.value);
    }
    if (frequency.present) {
      map['frequency'] = Variable<int>(frequency.value);
    }
    if (jlpt.present) {
      map['jlpt'] =
          Variable<int>($KanjisTable.$converterjlptn.toSql(jlpt.value));
    }
    if (meaning.present) {
      map['meaning'] = Variable<String>(meaning.value);
    }
    if (strokes.present) {
      map['strokes'] = Variable<String>(
          $KanjisTable.$converterstrokesn.toSql(strokes.value));
    }
    if (compounds.present) {
      map['compounds'] = Variable<String>(
          $KanjisTable.$convertercompoundsn.toSql(compounds.value));
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

class $KanjiReadingsTable extends KanjiReadings
    with TableInfo<$KanjiReadingsTable, KanjiReading> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $KanjiReadingsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _kanjiIdMeta =
      const VerificationMeta('kanjiId');
  @override
  late final GeneratedColumn<int> kanjiId = GeneratedColumn<int>(
      'kanji_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _readingMeta =
      const VerificationMeta('reading');
  @override
  late final GeneratedColumn<String> reading = GeneratedColumn<String>(
      'reading', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _readingSearchFormMeta =
      const VerificationMeta('readingSearchForm');
  @override
  late final GeneratedColumn<String> readingSearchForm =
      GeneratedColumn<String>('reading_search_form', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _readingRomajiMeta =
      const VerificationMeta('readingRomaji');
  @override
  late final GeneratedColumn<String> readingRomaji = GeneratedColumn<String>(
      'reading_romaji', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _readingRomajiSimplifiedMeta =
      const VerificationMeta('readingRomajiSimplified');
  @override
  late final GeneratedColumn<String> readingRomajiSimplified =
      GeneratedColumn<String>('reading_romaji_simplified', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumnWithTypeConverter<KanjiReadingType, int> type =
      GeneratedColumn<int>('type', aliasedName, false,
              type: DriftSqlType.int, requiredDuringInsert: true)
          .withConverter<KanjiReadingType>($KanjiReadingsTable.$convertertype);
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
  VerificationContext validateIntegrity(Insertable<KanjiReading> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('kanji_id')) {
      context.handle(_kanjiIdMeta,
          kanjiId.isAcceptableOrUnknown(data['kanji_id']!, _kanjiIdMeta));
    } else if (isInserting) {
      context.missing(_kanjiIdMeta);
    }
    if (data.containsKey('reading')) {
      context.handle(_readingMeta,
          reading.isAcceptableOrUnknown(data['reading']!, _readingMeta));
    } else if (isInserting) {
      context.missing(_readingMeta);
    }
    if (data.containsKey('reading_search_form')) {
      context.handle(
          _readingSearchFormMeta,
          readingSearchForm.isAcceptableOrUnknown(
              data['reading_search_form']!, _readingSearchFormMeta));
    }
    if (data.containsKey('reading_romaji')) {
      context.handle(
          _readingRomajiMeta,
          readingRomaji.isAcceptableOrUnknown(
              data['reading_romaji']!, _readingRomajiMeta));
    } else if (isInserting) {
      context.missing(_readingRomajiMeta);
    }
    if (data.containsKey('reading_romaji_simplified')) {
      context.handle(
          _readingRomajiSimplifiedMeta,
          readingRomajiSimplified.isAcceptableOrUnknown(
              data['reading_romaji_simplified']!,
              _readingRomajiSimplifiedMeta));
    }
    context.handle(_typeMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  KanjiReading map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return KanjiReading(
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
      type: $KanjiReadingsTable.$convertertype.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}type'])!),
    );
  }

  @override
  $KanjiReadingsTable createAlias(String alias) {
    return $KanjiReadingsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<KanjiReadingType, int, int> $convertertype =
      const EnumIndexConverter<KanjiReadingType>(KanjiReadingType.values);
}

class KanjiReadingsCompanion extends UpdateCompanion<KanjiReading> {
  final Value<int> id;
  final Value<int> kanjiId;
  final Value<String> reading;
  final Value<String?> readingSearchForm;
  final Value<String> readingRomaji;
  final Value<String?> readingRomajiSimplified;
  final Value<KanjiReadingType> type;
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
    required KanjiReadingType type,
  })  : kanjiId = Value(kanjiId),
        reading = Value(reading),
        readingRomaji = Value(readingRomaji),
        type = Value(type);
  static Insertable<KanjiReading> custom({
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
      Value<KanjiReadingType>? type}) {
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
      map['type'] =
          Variable<int>($KanjiReadingsTable.$convertertype.toSql(type.value));
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

class $KanjiMeaningWordsTable extends KanjiMeaningWords
    with TableInfo<$KanjiMeaningWordsTable, KanjiMeaningWord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $KanjiMeaningWordsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _wordMeta = const VerificationMeta('word');
  @override
  late final GeneratedColumn<String> word = GeneratedColumn<String>(
      'word', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _kanjiIdMeta =
      const VerificationMeta('kanjiId');
  @override
  late final GeneratedColumn<int> kanjiId = GeneratedColumn<int>(
      'kanji_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [word, kanjiId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'kanji_meaning_words';
  @override
  VerificationContext validateIntegrity(Insertable<KanjiMeaningWord> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('word')) {
      context.handle(
          _wordMeta, word.isAcceptableOrUnknown(data['word']!, _wordMeta));
    } else if (isInserting) {
      context.missing(_wordMeta);
    }
    if (data.containsKey('kanji_id')) {
      context.handle(_kanjiIdMeta,
          kanjiId.isAcceptableOrUnknown(data['kanji_id']!, _kanjiIdMeta));
    } else if (isInserting) {
      context.missing(_kanjiIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  KanjiMeaningWord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return KanjiMeaningWord(
      word: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}word'])!,
      kanjiId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}kanji_id'])!,
    );
  }

  @override
  $KanjiMeaningWordsTable createAlias(String alias) {
    return $KanjiMeaningWordsTable(attachedDatabase, alias);
  }
}

class KanjiMeaningWord extends DataClass
    implements Insertable<KanjiMeaningWord> {
  final String word;
  final int kanjiId;
  const KanjiMeaningWord({required this.word, required this.kanjiId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['word'] = Variable<String>(word);
    map['kanji_id'] = Variable<int>(kanjiId);
    return map;
  }

  KanjiMeaningWordsCompanion toCompanion(bool nullToAbsent) {
    return KanjiMeaningWordsCompanion(
      word: Value(word),
      kanjiId: Value(kanjiId),
    );
  }

  factory KanjiMeaningWord.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return KanjiMeaningWord(
      word: serializer.fromJson<String>(json['word']),
      kanjiId: serializer.fromJson<int>(json['kanjiId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'word': serializer.toJson<String>(word),
      'kanjiId': serializer.toJson<int>(kanjiId),
    };
  }

  KanjiMeaningWord copyWith({String? word, int? kanjiId}) => KanjiMeaningWord(
        word: word ?? this.word,
        kanjiId: kanjiId ?? this.kanjiId,
      );
  @override
  String toString() {
    return (StringBuffer('KanjiMeaningWord(')
          ..write('word: $word, ')
          ..write('kanjiId: $kanjiId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(word, kanjiId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is KanjiMeaningWord &&
          other.word == this.word &&
          other.kanjiId == this.kanjiId);
}

class KanjiMeaningWordsCompanion extends UpdateCompanion<KanjiMeaningWord> {
  final Value<String> word;
  final Value<int> kanjiId;
  final Value<int> rowid;
  const KanjiMeaningWordsCompanion({
    this.word = const Value.absent(),
    this.kanjiId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  KanjiMeaningWordsCompanion.insert({
    required String word,
    required int kanjiId,
    this.rowid = const Value.absent(),
  })  : word = Value(word),
        kanjiId = Value(kanjiId);
  static Insertable<KanjiMeaningWord> custom({
    Expression<String>? word,
    Expression<int>? kanjiId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (word != null) 'word': word,
      if (kanjiId != null) 'kanji_id': kanjiId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  KanjiMeaningWordsCompanion copyWith(
      {Value<String>? word, Value<int>? kanjiId, Value<int>? rowid}) {
    return KanjiMeaningWordsCompanion(
      word: word ?? this.word,
      kanjiId: kanjiId ?? this.kanjiId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (word.present) {
      map['word'] = Variable<String>(word.value);
    }
    if (kanjiId.present) {
      map['kanji_id'] = Variable<int>(kanjiId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('KanjiMeaningWordsCompanion(')
          ..write('word: $word, ')
          ..write('kanjiId: $kanjiId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SpacedRepetitionDatasTable extends SpacedRepetitionDatas
    with TableInfo<$SpacedRepetitionDatasTable, SpacedRepetitionData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SpacedRepetitionDatasTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _vocabIdMeta =
      const VerificationMeta('vocabId');
  @override
  late final GeneratedColumn<int> vocabId = GeneratedColumn<int>(
      'vocab_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints:
          'NOT NULL DEFAULT 0 CHECK( IIF(vocab_id = 0, 1, 0) + IIF(kanji_id = 0, 1, 0) = 1 )');
  static const VerificationMeta _kanjiIdMeta =
      const VerificationMeta('kanjiId');
  @override
  late final GeneratedColumn<int> kanjiId = GeneratedColumn<int>(
      'kanji_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints:
          'NOT NULL DEFAULT 0 CHECK( IIF(vocab_id = 0, 1, 0) + IIF(kanji_id = 0, 1, 0) = 1 )');
  static const VerificationMeta _frontTypeMeta =
      const VerificationMeta('frontType');
  @override
  late final GeneratedColumnWithTypeConverter<FrontType, int> frontType =
      GeneratedColumn<int>('front_type', aliasedName, false,
              type: DriftSqlType.int, requiredDuringInsert: true)
          .withConverter<FrontType>(
              $SpacedRepetitionDatasTable.$converterfrontType);
  static const VerificationMeta _intervalMeta =
      const VerificationMeta('interval');
  @override
  late final GeneratedColumn<int> interval = GeneratedColumn<int>(
      'interval', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _repetitionsMeta =
      const VerificationMeta('repetitions');
  @override
  late final GeneratedColumn<int> repetitions = GeneratedColumn<int>(
      'repetitions', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _easeFactorMeta =
      const VerificationMeta('easeFactor');
  @override
  late final GeneratedColumn<double> easeFactor = GeneratedColumn<double>(
      'ease_factor', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _dueDateMeta =
      const VerificationMeta('dueDate');
  @override
  late final GeneratedColumn<int> dueDate = GeneratedColumn<int>(
      'due_date', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _totalAnswersMeta =
      const VerificationMeta('totalAnswers');
  @override
  late final GeneratedColumn<int> totalAnswers = GeneratedColumn<int>(
      'total_answers', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _totalWrongAnswersMeta =
      const VerificationMeta('totalWrongAnswers');
  @override
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
  VerificationContext validateIntegrity(
      Insertable<SpacedRepetitionData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('vocab_id')) {
      context.handle(_vocabIdMeta,
          vocabId.isAcceptableOrUnknown(data['vocab_id']!, _vocabIdMeta));
    } else if (isInserting) {
      context.missing(_vocabIdMeta);
    }
    if (data.containsKey('kanji_id')) {
      context.handle(_kanjiIdMeta,
          kanjiId.isAcceptableOrUnknown(data['kanji_id']!, _kanjiIdMeta));
    } else if (isInserting) {
      context.missing(_kanjiIdMeta);
    }
    context.handle(_frontTypeMeta, const VerificationResult.success());
    if (data.containsKey('interval')) {
      context.handle(_intervalMeta,
          interval.isAcceptableOrUnknown(data['interval']!, _intervalMeta));
    } else if (isInserting) {
      context.missing(_intervalMeta);
    }
    if (data.containsKey('repetitions')) {
      context.handle(
          _repetitionsMeta,
          repetitions.isAcceptableOrUnknown(
              data['repetitions']!, _repetitionsMeta));
    } else if (isInserting) {
      context.missing(_repetitionsMeta);
    }
    if (data.containsKey('ease_factor')) {
      context.handle(
          _easeFactorMeta,
          easeFactor.isAcceptableOrUnknown(
              data['ease_factor']!, _easeFactorMeta));
    } else if (isInserting) {
      context.missing(_easeFactorMeta);
    }
    if (data.containsKey('due_date')) {
      context.handle(_dueDateMeta,
          dueDate.isAcceptableOrUnknown(data['due_date']!, _dueDateMeta));
    }
    if (data.containsKey('total_answers')) {
      context.handle(
          _totalAnswersMeta,
          totalAnswers.isAcceptableOrUnknown(
              data['total_answers']!, _totalAnswersMeta));
    } else if (isInserting) {
      context.missing(_totalAnswersMeta);
    }
    if (data.containsKey('total_wrong_answers')) {
      context.handle(
          _totalWrongAnswersMeta,
          totalWrongAnswers.isAcceptableOrUnknown(
              data['total_wrong_answers']!, _totalWrongAnswersMeta));
    } else if (isInserting) {
      context.missing(_totalWrongAnswersMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {vocabId, kanjiId, frontType};
  @override
  SpacedRepetitionData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SpacedRepetitionData(
      vocabId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}vocab_id'])!,
      kanjiId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}kanji_id'])!,
      frontType: $SpacedRepetitionDatasTable.$converterfrontType.fromSql(
          attachedDatabase.typeMapping
              .read(DriftSqlType.int, data['${effectivePrefix}front_type'])!),
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
  $SpacedRepetitionDatasTable createAlias(String alias) {
    return $SpacedRepetitionDatasTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<FrontType, int, int> $converterfrontType =
      const EnumIndexConverter<FrontType>(FrontType.values);
  @override
  bool get withoutRowId => true;
}

class SpacedRepetitionDatasCompanion
    extends UpdateCompanion<SpacedRepetitionData> {
  final Value<int> vocabId;
  final Value<int> kanjiId;
  final Value<FrontType> frontType;
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
    required int vocabId,
    required int kanjiId,
    required FrontType frontType,
    required int interval,
    required int repetitions,
    required double easeFactor,
    this.dueDate = const Value.absent(),
    required int totalAnswers,
    required int totalWrongAnswers,
  })  : vocabId = Value(vocabId),
        kanjiId = Value(kanjiId),
        frontType = Value(frontType),
        interval = Value(interval),
        repetitions = Value(repetitions),
        easeFactor = Value(easeFactor),
        totalAnswers = Value(totalAnswers),
        totalWrongAnswers = Value(totalWrongAnswers);
  static Insertable<SpacedRepetitionData> custom({
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
      Value<FrontType>? frontType,
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
      map['front_type'] = Variable<int>($SpacedRepetitionDatasTable
          .$converterfrontType
          .toSql(frontType.value));
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

class $SearchHistoryItemsTable extends SearchHistoryItems
    with TableInfo<$SearchHistoryItemsTable, SearchHistoryItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SearchHistoryItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _searchTextMeta =
      const VerificationMeta('searchText');
  @override
  late final GeneratedColumn<String> searchText = GeneratedColumn<String>(
      'search_text', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _timestampMeta =
      const VerificationMeta('timestamp');
  @override
  late final GeneratedColumn<DateTime> timestamp = GeneratedColumn<DateTime>(
      'timestamp', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [id, searchText, timestamp];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'search_history_items';
  @override
  VerificationContext validateIntegrity(Insertable<SearchHistoryItem> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('search_text')) {
      context.handle(
          _searchTextMeta,
          searchText.isAcceptableOrUnknown(
              data['search_text']!, _searchTextMeta));
    } else if (isInserting) {
      context.missing(_searchTextMeta);
    }
    if (data.containsKey('timestamp')) {
      context.handle(_timestampMeta,
          timestamp.isAcceptableOrUnknown(data['timestamp']!, _timestampMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SearchHistoryItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SearchHistoryItem(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      searchText: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}search_text'])!,
      timestamp: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}timestamp'])!,
    );
  }

  @override
  $SearchHistoryItemsTable createAlias(String alias) {
    return $SearchHistoryItemsTable(attachedDatabase, alias);
  }
}

class SearchHistoryItem extends DataClass
    implements Insertable<SearchHistoryItem> {
  final int id;
  final String searchText;
  final DateTime timestamp;
  const SearchHistoryItem(
      {required this.id, required this.searchText, required this.timestamp});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['search_text'] = Variable<String>(searchText);
    map['timestamp'] = Variable<DateTime>(timestamp);
    return map;
  }

  SearchHistoryItemsCompanion toCompanion(bool nullToAbsent) {
    return SearchHistoryItemsCompanion(
      id: Value(id),
      searchText: Value(searchText),
      timestamp: Value(timestamp),
    );
  }

  factory SearchHistoryItem.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SearchHistoryItem(
      id: serializer.fromJson<int>(json['id']),
      searchText: serializer.fromJson<String>(json['searchText']),
      timestamp: serializer.fromJson<DateTime>(json['timestamp']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'searchText': serializer.toJson<String>(searchText),
      'timestamp': serializer.toJson<DateTime>(timestamp),
    };
  }

  SearchHistoryItem copyWith(
          {int? id, String? searchText, DateTime? timestamp}) =>
      SearchHistoryItem(
        id: id ?? this.id,
        searchText: searchText ?? this.searchText,
        timestamp: timestamp ?? this.timestamp,
      );
  @override
  String toString() {
    return (StringBuffer('SearchHistoryItem(')
          ..write('id: $id, ')
          ..write('searchText: $searchText, ')
          ..write('timestamp: $timestamp')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, searchText, timestamp);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SearchHistoryItem &&
          other.id == this.id &&
          other.searchText == this.searchText &&
          other.timestamp == this.timestamp);
}

class SearchHistoryItemsCompanion extends UpdateCompanion<SearchHistoryItem> {
  final Value<int> id;
  final Value<String> searchText;
  final Value<DateTime> timestamp;
  const SearchHistoryItemsCompanion({
    this.id = const Value.absent(),
    this.searchText = const Value.absent(),
    this.timestamp = const Value.absent(),
  });
  SearchHistoryItemsCompanion.insert({
    this.id = const Value.absent(),
    required String searchText,
    this.timestamp = const Value.absent(),
  }) : searchText = Value(searchText);
  static Insertable<SearchHistoryItem> custom({
    Expression<int>? id,
    Expression<String>? searchText,
    Expression<DateTime>? timestamp,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (searchText != null) 'search_text': searchText,
      if (timestamp != null) 'timestamp': timestamp,
    });
  }

  SearchHistoryItemsCompanion copyWith(
      {Value<int>? id, Value<String>? searchText, Value<DateTime>? timestamp}) {
    return SearchHistoryItemsCompanion(
      id: id ?? this.id,
      searchText: searchText ?? this.searchText,
      timestamp: timestamp ?? this.timestamp,
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
    if (timestamp.present) {
      map['timestamp'] = Variable<DateTime>(timestamp.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SearchHistoryItemsCompanion(')
          ..write('id: $id, ')
          ..write('searchText: $searchText, ')
          ..write('timestamp: $timestamp')
          ..write(')'))
        .toString();
  }
}

class $RadicalsTable extends Radicals with TableInfo<$RadicalsTable, Radical> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RadicalsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _radicalMeta =
      const VerificationMeta('radical');
  @override
  late final GeneratedColumn<String> radical = GeneratedColumn<String>(
      'radical', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _kangxiIdMeta =
      const VerificationMeta('kangxiId');
  @override
  late final GeneratedColumn<int> kangxiId = GeneratedColumn<int>(
      'kangxi_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _strokeCountMeta =
      const VerificationMeta('strokeCount');
  @override
  late final GeneratedColumn<int> strokeCount = GeneratedColumn<int>(
      'stroke_count', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _meaningMeta =
      const VerificationMeta('meaning');
  @override
  late final GeneratedColumn<String> meaning = GeneratedColumn<String>(
      'meaning', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _readingMeta =
      const VerificationMeta('reading');
  @override
  late final GeneratedColumn<String> reading = GeneratedColumn<String>(
      'reading', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _positionMeta =
      const VerificationMeta('position');
  @override
  late final GeneratedColumnWithTypeConverter<RadicalPosition?, int> position =
      GeneratedColumn<int>('position', aliasedName, true,
              type: DriftSqlType.int, requiredDuringInsert: false)
          .withConverter<RadicalPosition?>($RadicalsTable.$converterpositionn);
  static const VerificationMeta _importanceMeta =
      const VerificationMeta('importance');
  @override
  late final GeneratedColumnWithTypeConverter<RadicalImportance?, int>
      importance = GeneratedColumn<int>('importance', aliasedName, true,
              type: DriftSqlType.int, requiredDuringInsert: false)
          .withConverter<RadicalImportance?>(
              $RadicalsTable.$converterimportancen);
  static const VerificationMeta _strokesMeta =
      const VerificationMeta('strokes');
  @override
  late final GeneratedColumnWithTypeConverter<List<String>?, String> strokes =
      GeneratedColumn<String>('strokes', aliasedName, true,
              type: DriftSqlType.string, requiredDuringInsert: false)
          .withConverter<List<String>?>($RadicalsTable.$converterstrokesn);
  static const VerificationMeta _variantsMeta =
      const VerificationMeta('variants');
  @override
  late final GeneratedColumnWithTypeConverter<List<String>?, String> variants =
      GeneratedColumn<String>('variants', aliasedName, true,
              type: DriftSqlType.string, requiredDuringInsert: false)
          .withConverter<List<String>?>($RadicalsTable.$convertervariantsn);
  static const VerificationMeta _variantOfMeta =
      const VerificationMeta('variantOf');
  @override
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
  VerificationContext validateIntegrity(Insertable<Radical> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('radical')) {
      context.handle(_radicalMeta,
          radical.isAcceptableOrUnknown(data['radical']!, _radicalMeta));
    } else if (isInserting) {
      context.missing(_radicalMeta);
    }
    if (data.containsKey('kangxi_id')) {
      context.handle(_kangxiIdMeta,
          kangxiId.isAcceptableOrUnknown(data['kangxi_id']!, _kangxiIdMeta));
    }
    if (data.containsKey('stroke_count')) {
      context.handle(
          _strokeCountMeta,
          strokeCount.isAcceptableOrUnknown(
              data['stroke_count']!, _strokeCountMeta));
    } else if (isInserting) {
      context.missing(_strokeCountMeta);
    }
    if (data.containsKey('meaning')) {
      context.handle(_meaningMeta,
          meaning.isAcceptableOrUnknown(data['meaning']!, _meaningMeta));
    } else if (isInserting) {
      context.missing(_meaningMeta);
    }
    if (data.containsKey('reading')) {
      context.handle(_readingMeta,
          reading.isAcceptableOrUnknown(data['reading']!, _readingMeta));
    } else if (isInserting) {
      context.missing(_readingMeta);
    }
    context.handle(_positionMeta, const VerificationResult.success());
    context.handle(_importanceMeta, const VerificationResult.success());
    context.handle(_strokesMeta, const VerificationResult.success());
    context.handle(_variantsMeta, const VerificationResult.success());
    if (data.containsKey('variant_of')) {
      context.handle(_variantOfMeta,
          variantOf.isAcceptableOrUnknown(data['variant_of']!, _variantOfMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Radical map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Radical(
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
      position: $RadicalsTable.$converterpositionn.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}position'])),
      importance: $RadicalsTable.$converterimportancen.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}importance'])),
      strokes: $RadicalsTable.$converterstrokesn.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}strokes'])),
      variants: $RadicalsTable.$convertervariantsn.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}variants'])),
      variantOf: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}variant_of']),
    );
  }

  @override
  $RadicalsTable createAlias(String alias) {
    return $RadicalsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<RadicalPosition, int, int> $converterposition =
      const EnumIndexConverter<RadicalPosition>(RadicalPosition.values);
  static JsonTypeConverter2<RadicalPosition?, int?, int?> $converterpositionn =
      JsonTypeConverter2.asNullable($converterposition);
  static JsonTypeConverter2<RadicalImportance, int, int> $converterimportance =
      const EnumIndexConverter<RadicalImportance>(RadicalImportance.values);
  static JsonTypeConverter2<RadicalImportance?, int?, int?>
      $converterimportancen =
      JsonTypeConverter2.asNullable($converterimportance);
  static TypeConverter<List<String>, String> $converterstrokes =
      const StringListConverter();
  static TypeConverter<List<String>?, String?> $converterstrokesn =
      NullAwareTypeConverter.wrap($converterstrokes);
  static TypeConverter<List<String>, String> $convertervariants =
      const StringListConverter();
  static TypeConverter<List<String>?, String?> $convertervariantsn =
      NullAwareTypeConverter.wrap($convertervariants);
}

class Radical extends DataClass implements Insertable<Radical> {
  final int id;
  final String radical;
  final int? kangxiId;
  final int strokeCount;
  final String meaning;
  final String reading;
  final RadicalPosition? position;
  final RadicalImportance? importance;
  final List<String>? strokes;
  final List<String>? variants;
  final String? variantOf;
  const Radical(
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
      map['position'] =
          Variable<int>($RadicalsTable.$converterpositionn.toSql(position));
    }
    if (!nullToAbsent || importance != null) {
      map['importance'] =
          Variable<int>($RadicalsTable.$converterimportancen.toSql(importance));
    }
    if (!nullToAbsent || strokes != null) {
      map['strokes'] =
          Variable<String>($RadicalsTable.$converterstrokesn.toSql(strokes));
    }
    if (!nullToAbsent || variants != null) {
      map['variants'] =
          Variable<String>($RadicalsTable.$convertervariantsn.toSql(variants));
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

  factory Radical.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Radical(
      id: serializer.fromJson<int>(json['id']),
      radical: serializer.fromJson<String>(json['radical']),
      kangxiId: serializer.fromJson<int?>(json['kangxiId']),
      strokeCount: serializer.fromJson<int>(json['strokeCount']),
      meaning: serializer.fromJson<String>(json['meaning']),
      reading: serializer.fromJson<String>(json['reading']),
      position: $RadicalsTable.$converterpositionn
          .fromJson(serializer.fromJson<int?>(json['position'])),
      importance: $RadicalsTable.$converterimportancen
          .fromJson(serializer.fromJson<int?>(json['importance'])),
      strokes: serializer.fromJson<List<String>?>(json['strokes']),
      variants: serializer.fromJson<List<String>?>(json['variants']),
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
      'position': serializer
          .toJson<int?>($RadicalsTable.$converterpositionn.toJson(position)),
      'importance': serializer.toJson<int?>(
          $RadicalsTable.$converterimportancen.toJson(importance)),
      'strokes': serializer.toJson<List<String>?>(strokes),
      'variants': serializer.toJson<List<String>?>(variants),
      'variantOf': serializer.toJson<String?>(variantOf),
    };
  }

  Radical copyWith(
          {int? id,
          String? radical,
          Value<int?> kangxiId = const Value.absent(),
          int? strokeCount,
          String? meaning,
          String? reading,
          Value<RadicalPosition?> position = const Value.absent(),
          Value<RadicalImportance?> importance = const Value.absent(),
          Value<List<String>?> strokes = const Value.absent(),
          Value<List<String>?> variants = const Value.absent(),
          Value<String?> variantOf = const Value.absent()}) =>
      Radical(
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
  @override
  String toString() {
    return (StringBuffer('Radical(')
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
      (other is Radical &&
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

class RadicalsCompanion extends UpdateCompanion<Radical> {
  final Value<int> id;
  final Value<String> radical;
  final Value<int?> kangxiId;
  final Value<int> strokeCount;
  final Value<String> meaning;
  final Value<String> reading;
  final Value<RadicalPosition?> position;
  final Value<RadicalImportance?> importance;
  final Value<List<String>?> strokes;
  final Value<List<String>?> variants;
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
  static Insertable<Radical> custom({
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
      Value<RadicalPosition?>? position,
      Value<RadicalImportance?>? importance,
      Value<List<String>?>? strokes,
      Value<List<String>?>? variants,
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
      map['position'] = Variable<int>(
          $RadicalsTable.$converterpositionn.toSql(position.value));
    }
    if (importance.present) {
      map['importance'] = Variable<int>(
          $RadicalsTable.$converterimportancen.toSql(importance.value));
    }
    if (strokes.present) {
      map['strokes'] = Variable<String>(
          $RadicalsTable.$converterstrokesn.toSql(strokes.value));
    }
    if (variants.present) {
      map['variants'] = Variable<String>(
          $RadicalsTable.$convertervariantsn.toSql(variants.value));
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

class $ProperNounsTable extends ProperNouns
    with TableInfo<$ProperNounsTable, ProperNoun> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProperNounsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _writingMeta =
      const VerificationMeta('writing');
  @override
  late final GeneratedColumn<String> writing = GeneratedColumn<String>(
      'writing', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _writingSearchFormMeta =
      const VerificationMeta('writingSearchForm');
  @override
  late final GeneratedColumn<String> writingSearchForm =
      GeneratedColumn<String>('writing_search_form', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _readingMeta =
      const VerificationMeta('reading');
  @override
  late final GeneratedColumn<String> reading = GeneratedColumn<String>(
      'reading', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _readingSearchFormMeta =
      const VerificationMeta('readingSearchForm');
  @override
  late final GeneratedColumn<String> readingSearchForm =
      GeneratedColumn<String>('reading_search_form', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _readingRomajiMeta =
      const VerificationMeta('readingRomaji');
  @override
  late final GeneratedColumn<String> readingRomaji = GeneratedColumn<String>(
      'reading_romaji', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _readingRomajiSimplifiedMeta =
      const VerificationMeta('readingRomajiSimplified');
  @override
  late final GeneratedColumn<String> readingRomajiSimplified =
      GeneratedColumn<String>('reading_romaji_simplified', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _romajiMeta = const VerificationMeta('romaji');
  @override
  late final GeneratedColumn<String> romaji = GeneratedColumn<String>(
      'romaji', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _typesMeta = const VerificationMeta('types');
  @override
  late final GeneratedColumnWithTypeConverter<List<ProperNounType>, String>
      types = GeneratedColumn<String>('types', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<List<ProperNounType>>(
              $ProperNounsTable.$convertertypes);
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
  VerificationContext validateIntegrity(Insertable<ProperNoun> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('writing')) {
      context.handle(_writingMeta,
          writing.isAcceptableOrUnknown(data['writing']!, _writingMeta));
    }
    if (data.containsKey('writing_search_form')) {
      context.handle(
          _writingSearchFormMeta,
          writingSearchForm.isAcceptableOrUnknown(
              data['writing_search_form']!, _writingSearchFormMeta));
    }
    if (data.containsKey('reading')) {
      context.handle(_readingMeta,
          reading.isAcceptableOrUnknown(data['reading']!, _readingMeta));
    } else if (isInserting) {
      context.missing(_readingMeta);
    }
    if (data.containsKey('reading_search_form')) {
      context.handle(
          _readingSearchFormMeta,
          readingSearchForm.isAcceptableOrUnknown(
              data['reading_search_form']!, _readingSearchFormMeta));
    }
    if (data.containsKey('reading_romaji')) {
      context.handle(
          _readingRomajiMeta,
          readingRomaji.isAcceptableOrUnknown(
              data['reading_romaji']!, _readingRomajiMeta));
    } else if (isInserting) {
      context.missing(_readingRomajiMeta);
    }
    if (data.containsKey('reading_romaji_simplified')) {
      context.handle(
          _readingRomajiSimplifiedMeta,
          readingRomajiSimplified.isAcceptableOrUnknown(
              data['reading_romaji_simplified']!,
              _readingRomajiSimplifiedMeta));
    }
    if (data.containsKey('romaji')) {
      context.handle(_romajiMeta,
          romaji.isAcceptableOrUnknown(data['romaji']!, _romajiMeta));
    } else if (isInserting) {
      context.missing(_romajiMeta);
    }
    context.handle(_typesMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ProperNoun map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProperNoun(
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
      types: $ProperNounsTable.$convertertypes.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}types'])!),
    );
  }

  @override
  $ProperNounsTable createAlias(String alias) {
    return $ProperNounsTable(attachedDatabase, alias);
  }

  static TypeConverter<List<ProperNounType>, String> $convertertypes =
      const ProperNounTypeConverter();
}

class ProperNounsCompanion extends UpdateCompanion<ProperNoun> {
  final Value<int> id;
  final Value<String?> writing;
  final Value<String?> writingSearchForm;
  final Value<String> reading;
  final Value<String?> readingSearchForm;
  final Value<String> readingRomaji;
  final Value<String?> readingRomajiSimplified;
  final Value<String> romaji;
  final Value<List<ProperNounType>> types;
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
    required List<ProperNounType> types,
  })  : reading = Value(reading),
        readingRomaji = Value(readingRomaji),
        romaji = Value(romaji),
        types = Value(types);
  static Insertable<ProperNoun> custom({
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
      Value<List<ProperNounType>>? types}) {
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
      map['types'] = Variable<String>(
          $ProperNounsTable.$convertertypes.toSql(types.value));
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

class $ProperNounRomajiWordsTable extends ProperNounRomajiWords
    with TableInfo<$ProperNounRomajiWordsTable, ProperNounRomajiWord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProperNounRomajiWordsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _wordMeta = const VerificationMeta('word');
  @override
  late final GeneratedColumn<String> word = GeneratedColumn<String>(
      'word', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _properNounIdMeta =
      const VerificationMeta('properNounId');
  @override
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
  VerificationContext validateIntegrity(
      Insertable<ProperNounRomajiWord> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('word')) {
      context.handle(
          _wordMeta, word.isAcceptableOrUnknown(data['word']!, _wordMeta));
    } else if (isInserting) {
      context.missing(_wordMeta);
    }
    if (data.containsKey('proper_noun_id')) {
      context.handle(
          _properNounIdMeta,
          properNounId.isAcceptableOrUnknown(
              data['proper_noun_id']!, _properNounIdMeta));
    } else if (isInserting) {
      context.missing(_properNounIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ProperNounRomajiWord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProperNounRomajiWord(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      word: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}word'])!,
      properNounId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}proper_noun_id'])!,
    );
  }

  @override
  $ProperNounRomajiWordsTable createAlias(String alias) {
    return $ProperNounRomajiWordsTable(attachedDatabase, alias);
  }
}

class ProperNounRomajiWord extends DataClass
    implements Insertable<ProperNounRomajiWord> {
  final int id;
  final String word;
  final int properNounId;
  const ProperNounRomajiWord(
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

  factory ProperNounRomajiWord.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProperNounRomajiWord(
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

  ProperNounRomajiWord copyWith({int? id, String? word, int? properNounId}) =>
      ProperNounRomajiWord(
        id: id ?? this.id,
        word: word ?? this.word,
        properNounId: properNounId ?? this.properNounId,
      );
  @override
  String toString() {
    return (StringBuffer('ProperNounRomajiWord(')
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
      (other is ProperNounRomajiWord &&
          other.id == this.id &&
          other.word == this.word &&
          other.properNounId == this.properNounId);
}

class ProperNounRomajiWordsCompanion
    extends UpdateCompanion<ProperNounRomajiWord> {
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
  static Insertable<ProperNounRomajiWord> custom({
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

class $PredefinedDictionaryListsTable extends PredefinedDictionaryLists
    with TableInfo<$PredefinedDictionaryListsTable, PredefinedDictionaryList> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PredefinedDictionaryListsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      check: () => name.length.isBiggerThan(Constant(0)),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _vocabMeta = const VerificationMeta('vocab');
  @override
  late final GeneratedColumnWithTypeConverter<List<int>, String> vocab =
      GeneratedColumn<String>('vocab', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<List<int>>(
              $PredefinedDictionaryListsTable.$convertervocab);
  static const VerificationMeta _kanjiMeta = const VerificationMeta('kanji');
  @override
  late final GeneratedColumnWithTypeConverter<List<int>, String> kanji =
      GeneratedColumn<String>('kanji', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<List<int>>(
              $PredefinedDictionaryListsTable.$converterkanji);
  @override
  List<GeneratedColumn> get $columns => [id, name, vocab, kanji];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'predefined_dictionary_lists';
  @override
  VerificationContext validateIntegrity(
      Insertable<PredefinedDictionaryList> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    context.handle(_vocabMeta, const VerificationResult.success());
    context.handle(_kanjiMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PredefinedDictionaryList map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PredefinedDictionaryList(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      vocab: $PredefinedDictionaryListsTable.$convertervocab.fromSql(
          attachedDatabase.typeMapping
              .read(DriftSqlType.string, data['${effectivePrefix}vocab'])!),
      kanji: $PredefinedDictionaryListsTable.$converterkanji.fromSql(
          attachedDatabase.typeMapping
              .read(DriftSqlType.string, data['${effectivePrefix}kanji'])!),
    );
  }

  @override
  $PredefinedDictionaryListsTable createAlias(String alias) {
    return $PredefinedDictionaryListsTable(attachedDatabase, alias);
  }

  static TypeConverter<List<int>, String> $convertervocab =
      const IntListConverter();
  static TypeConverter<List<int>, String> $converterkanji =
      const IntListConverter();
}

class PredefinedDictionaryListsCompanion
    extends UpdateCompanion<PredefinedDictionaryList> {
  final Value<int> id;
  final Value<String> name;
  final Value<List<int>> vocab;
  final Value<List<int>> kanji;
  const PredefinedDictionaryListsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.vocab = const Value.absent(),
    this.kanji = const Value.absent(),
  });
  PredefinedDictionaryListsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required List<int> vocab,
    required List<int> kanji,
  })  : name = Value(name),
        vocab = Value(vocab),
        kanji = Value(kanji);
  static Insertable<PredefinedDictionaryList> custom({
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
      Value<List<int>>? vocab,
      Value<List<int>>? kanji}) {
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
      map['vocab'] = Variable<String>(
          $PredefinedDictionaryListsTable.$convertervocab.toSql(vocab.value));
    }
    if (kanji.present) {
      map['kanji'] = Variable<String>(
          $PredefinedDictionaryListsTable.$converterkanji.toSql(kanji.value));
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

class $MyDictionaryListsTable extends MyDictionaryLists
    with TableInfo<$MyDictionaryListsTable, MyDictionaryList> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MyDictionaryListsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      check: () => name.length.isBiggerThan(Constant(0)),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _timestampMeta =
      const VerificationMeta('timestamp');
  @override
  late final GeneratedColumn<DateTime> timestamp = GeneratedColumn<DateTime>(
      'timestamp', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [id, name, timestamp];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'my_dictionary_lists';
  @override
  VerificationContext validateIntegrity(Insertable<MyDictionaryList> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('timestamp')) {
      context.handle(_timestampMeta,
          timestamp.isAcceptableOrUnknown(data['timestamp']!, _timestampMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MyDictionaryList map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MyDictionaryList(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      timestamp: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}timestamp'])!,
    );
  }

  @override
  $MyDictionaryListsTable createAlias(String alias) {
    return $MyDictionaryListsTable(attachedDatabase, alias);
  }
}

class MyDictionaryListsCompanion extends UpdateCompanion<MyDictionaryList> {
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
  static Insertable<MyDictionaryList> custom({
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

class $MyDictionaryListItemsTable extends MyDictionaryListItems
    with TableInfo<$MyDictionaryListItemsTable, MyDictionaryListItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MyDictionaryListItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _listIdMeta = const VerificationMeta('listId');
  @override
  late final GeneratedColumn<int> listId = GeneratedColumn<int>(
      'list_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _vocabIdMeta =
      const VerificationMeta('vocabId');
  @override
  late final GeneratedColumn<int> vocabId = GeneratedColumn<int>(
      'vocab_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints:
          'NOT NULL DEFAULT 0 CHECK( IIF(vocab_id = 0, 1, 0) + IIF(kanji_id = 0, 1, 0) = 1 )');
  static const VerificationMeta _kanjiIdMeta =
      const VerificationMeta('kanjiId');
  @override
  late final GeneratedColumn<int> kanjiId = GeneratedColumn<int>(
      'kanji_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints:
          'NOT NULL DEFAULT 0 CHECK( IIF(vocab_id = 0, 1, 0) + IIF(kanji_id = 0, 1, 0) = 1 )');
  @override
  List<GeneratedColumn> get $columns => [id, listId, vocabId, kanjiId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'my_dictionary_list_items';
  @override
  VerificationContext validateIntegrity(
      Insertable<MyDictionaryListItem> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('list_id')) {
      context.handle(_listIdMeta,
          listId.isAcceptableOrUnknown(data['list_id']!, _listIdMeta));
    } else if (isInserting) {
      context.missing(_listIdMeta);
    }
    if (data.containsKey('vocab_id')) {
      context.handle(_vocabIdMeta,
          vocabId.isAcceptableOrUnknown(data['vocab_id']!, _vocabIdMeta));
    } else if (isInserting) {
      context.missing(_vocabIdMeta);
    }
    if (data.containsKey('kanji_id')) {
      context.handle(_kanjiIdMeta,
          kanjiId.isAcceptableOrUnknown(data['kanji_id']!, _kanjiIdMeta));
    } else if (isInserting) {
      context.missing(_kanjiIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
        {listId, vocabId, kanjiId},
      ];
  @override
  MyDictionaryListItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MyDictionaryListItem(
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
  $MyDictionaryListItemsTable createAlias(String alias) {
    return $MyDictionaryListItemsTable(attachedDatabase, alias);
  }
}

class MyDictionaryListItem extends DataClass
    implements Insertable<MyDictionaryListItem> {
  final int id;
  final int listId;
  final int vocabId;
  final int kanjiId;
  const MyDictionaryListItem(
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

  factory MyDictionaryListItem.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MyDictionaryListItem(
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

  MyDictionaryListItem copyWith(
          {int? id, int? listId, int? vocabId, int? kanjiId}) =>
      MyDictionaryListItem(
        id: id ?? this.id,
        listId: listId ?? this.listId,
        vocabId: vocabId ?? this.vocabId,
        kanjiId: kanjiId ?? this.kanjiId,
      );
  @override
  String toString() {
    return (StringBuffer('MyDictionaryListItem(')
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
      (other is MyDictionaryListItem &&
          other.id == this.id &&
          other.listId == this.listId &&
          other.vocabId == this.vocabId &&
          other.kanjiId == this.kanjiId);
}

class MyDictionaryListItemsCompanion
    extends UpdateCompanion<MyDictionaryListItem> {
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
    required int vocabId,
    required int kanjiId,
  })  : listId = Value(listId),
        vocabId = Value(vocabId),
        kanjiId = Value(kanjiId);
  static Insertable<MyDictionaryListItem> custom({
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

class $FlashcardSetsTable extends FlashcardSets
    with TableInfo<$FlashcardSetsTable, FlashcardSet> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FlashcardSetsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _usingSpacedRepetitionMeta =
      const VerificationMeta('usingSpacedRepetition');
  @override
  late final GeneratedColumn<bool> usingSpacedRepetition =
      GeneratedColumn<bool>('using_spaced_repetition', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintIsAlways(
              'CHECK ("using_spaced_repetition" IN (0, 1))'),
          defaultValue: const Constant(true));
  static const VerificationMeta _frontTypeMeta =
      const VerificationMeta('frontType');
  @override
  late final GeneratedColumnWithTypeConverter<FrontType, int> frontType =
      GeneratedColumn<int>('front_type', aliasedName, false,
              type: DriftSqlType.int,
              requiredDuringInsert: false,
              defaultValue: Variable(FrontType.japanese.index))
          .withConverter<FrontType>($FlashcardSetsTable.$converterfrontType);
  static const VerificationMeta _vocabShowReadingMeta =
      const VerificationMeta('vocabShowReading');
  @override
  late final GeneratedColumn<bool> vocabShowReading = GeneratedColumn<bool>(
      'vocab_show_reading', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("vocab_show_reading" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _vocabShowReadingIfRareKanjiMeta =
      const VerificationMeta('vocabShowReadingIfRareKanji');
  @override
  late final GeneratedColumn<bool> vocabShowReadingIfRareKanji =
      GeneratedColumn<bool>(
          'vocab_show_reading_if_rare_kanji', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintIsAlways(
              'CHECK ("vocab_show_reading_if_rare_kanji" IN (0, 1))'),
          defaultValue: const Constant(true));
  static const VerificationMeta _vocabShowAlternativesMeta =
      const VerificationMeta('vocabShowAlternatives');
  @override
  late final GeneratedColumn<bool> vocabShowAlternatives =
      GeneratedColumn<bool>('vocab_show_alternatives', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintIsAlways(
              'CHECK ("vocab_show_alternatives" IN (0, 1))'),
          defaultValue: const Constant(false));
  static const VerificationMeta _vocabShowPitchAccentMeta =
      const VerificationMeta('vocabShowPitchAccent');
  @override
  late final GeneratedColumn<bool> vocabShowPitchAccent = GeneratedColumn<bool>(
      'vocab_show_pitch_accent', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("vocab_show_pitch_accent" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _kanjiShowReadingMeta =
      const VerificationMeta('kanjiShowReading');
  @override
  late final GeneratedColumn<bool> kanjiShowReading = GeneratedColumn<bool>(
      'kanji_show_reading', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("kanji_show_reading" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _vocabShowPartsOfSpeechMeta =
      const VerificationMeta('vocabShowPartsOfSpeech');
  @override
  late final GeneratedColumn<bool> vocabShowPartsOfSpeech =
      GeneratedColumn<bool>('vocab_show_parts_of_speech', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintIsAlways(
              'CHECK ("vocab_show_parts_of_speech" IN (0, 1))'),
          defaultValue: const Constant(false));
  static const VerificationMeta _timestampMeta =
      const VerificationMeta('timestamp');
  @override
  late final GeneratedColumn<DateTime> timestamp = GeneratedColumn<DateTime>(
      'timestamp', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _flashcardsCompletedTodayMeta =
      const VerificationMeta('flashcardsCompletedToday');
  @override
  late final GeneratedColumn<int> flashcardsCompletedToday =
      GeneratedColumn<int>('flashcards_completed_today', aliasedName, false,
          type: DriftSqlType.int,
          requiredDuringInsert: false,
          defaultValue: const Constant(0));
  static const VerificationMeta _newFlashcardsCompletedTodayMeta =
      const VerificationMeta('newFlashcardsCompletedToday');
  @override
  late final GeneratedColumn<int> newFlashcardsCompletedToday =
      GeneratedColumn<int>('new_flashcards_completed_today', aliasedName, false,
          type: DriftSqlType.int,
          requiredDuringInsert: false,
          defaultValue: const Constant(0));
  static const VerificationMeta _predefinedDictionaryListsMeta =
      const VerificationMeta('predefinedDictionaryLists');
  @override
  late final GeneratedColumnWithTypeConverter<List<int>, String>
      predefinedDictionaryLists = GeneratedColumn<String>(
              'predefined_dictionary_lists', aliasedName, false,
              type: DriftSqlType.string,
              requiredDuringInsert: false,
              defaultValue: const Constant('[]'))
          .withConverter<List<int>>(
              $FlashcardSetsTable.$converterpredefinedDictionaryLists);
  static const VerificationMeta _myDictionaryListsMeta =
      const VerificationMeta('myDictionaryLists');
  @override
  late final GeneratedColumnWithTypeConverter<List<int>, String>
      myDictionaryLists = GeneratedColumn<String>(
              'my_dictionary_lists', aliasedName, false,
              type: DriftSqlType.string,
              requiredDuringInsert: false,
              defaultValue: const Constant('[]'))
          .withConverter<List<int>>(
              $FlashcardSetsTable.$convertermyDictionaryLists);
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
        timestamp,
        flashcardsCompletedToday,
        newFlashcardsCompletedToday,
        predefinedDictionaryLists,
        myDictionaryLists
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'flashcard_sets';
  @override
  VerificationContext validateIntegrity(Insertable<FlashcardSet> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('using_spaced_repetition')) {
      context.handle(
          _usingSpacedRepetitionMeta,
          usingSpacedRepetition.isAcceptableOrUnknown(
              data['using_spaced_repetition']!, _usingSpacedRepetitionMeta));
    }
    context.handle(_frontTypeMeta, const VerificationResult.success());
    if (data.containsKey('vocab_show_reading')) {
      context.handle(
          _vocabShowReadingMeta,
          vocabShowReading.isAcceptableOrUnknown(
              data['vocab_show_reading']!, _vocabShowReadingMeta));
    }
    if (data.containsKey('vocab_show_reading_if_rare_kanji')) {
      context.handle(
          _vocabShowReadingIfRareKanjiMeta,
          vocabShowReadingIfRareKanji.isAcceptableOrUnknown(
              data['vocab_show_reading_if_rare_kanji']!,
              _vocabShowReadingIfRareKanjiMeta));
    }
    if (data.containsKey('vocab_show_alternatives')) {
      context.handle(
          _vocabShowAlternativesMeta,
          vocabShowAlternatives.isAcceptableOrUnknown(
              data['vocab_show_alternatives']!, _vocabShowAlternativesMeta));
    }
    if (data.containsKey('vocab_show_pitch_accent')) {
      context.handle(
          _vocabShowPitchAccentMeta,
          vocabShowPitchAccent.isAcceptableOrUnknown(
              data['vocab_show_pitch_accent']!, _vocabShowPitchAccentMeta));
    }
    if (data.containsKey('kanji_show_reading')) {
      context.handle(
          _kanjiShowReadingMeta,
          kanjiShowReading.isAcceptableOrUnknown(
              data['kanji_show_reading']!, _kanjiShowReadingMeta));
    }
    if (data.containsKey('vocab_show_parts_of_speech')) {
      context.handle(
          _vocabShowPartsOfSpeechMeta,
          vocabShowPartsOfSpeech.isAcceptableOrUnknown(
              data['vocab_show_parts_of_speech']!,
              _vocabShowPartsOfSpeechMeta));
    }
    if (data.containsKey('timestamp')) {
      context.handle(_timestampMeta,
          timestamp.isAcceptableOrUnknown(data['timestamp']!, _timestampMeta));
    }
    if (data.containsKey('flashcards_completed_today')) {
      context.handle(
          _flashcardsCompletedTodayMeta,
          flashcardsCompletedToday.isAcceptableOrUnknown(
              data['flashcards_completed_today']!,
              _flashcardsCompletedTodayMeta));
    }
    if (data.containsKey('new_flashcards_completed_today')) {
      context.handle(
          _newFlashcardsCompletedTodayMeta,
          newFlashcardsCompletedToday.isAcceptableOrUnknown(
              data['new_flashcards_completed_today']!,
              _newFlashcardsCompletedTodayMeta));
    }
    context.handle(
        _predefinedDictionaryListsMeta, const VerificationResult.success());
    context.handle(_myDictionaryListsMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FlashcardSet map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FlashcardSet(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      usingSpacedRepetition: attachedDatabase.typeMapping.read(
          DriftSqlType.bool,
          data['${effectivePrefix}using_spaced_repetition'])!,
      frontType: $FlashcardSetsTable.$converterfrontType.fromSql(
          attachedDatabase.typeMapping
              .read(DriftSqlType.int, data['${effectivePrefix}front_type'])!),
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
      timestamp: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}timestamp'])!,
      flashcardsCompletedToday: attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}flashcards_completed_today'])!,
      newFlashcardsCompletedToday: attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}new_flashcards_completed_today'])!,
      predefinedDictionaryLists: $FlashcardSetsTable
          .$converterpredefinedDictionaryLists
          .fromSql(attachedDatabase.typeMapping.read(DriftSqlType.string,
              data['${effectivePrefix}predefined_dictionary_lists'])!),
      myDictionaryLists: $FlashcardSetsTable.$convertermyDictionaryLists
          .fromSql(attachedDatabase.typeMapping.read(DriftSqlType.string,
              data['${effectivePrefix}my_dictionary_lists'])!),
    );
  }

  @override
  $FlashcardSetsTable createAlias(String alias) {
    return $FlashcardSetsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<FrontType, int, int> $converterfrontType =
      const EnumIndexConverter<FrontType>(FrontType.values);
  static TypeConverter<List<int>, String> $converterpredefinedDictionaryLists =
      const IntListConverter();
  static TypeConverter<List<int>, String> $convertermyDictionaryLists =
      const IntListConverter();
}

class FlashcardSetsCompanion extends UpdateCompanion<FlashcardSet> {
  final Value<int> id;
  final Value<String> name;
  final Value<bool> usingSpacedRepetition;
  final Value<FrontType> frontType;
  final Value<bool> vocabShowReading;
  final Value<bool> vocabShowReadingIfRareKanji;
  final Value<bool> vocabShowAlternatives;
  final Value<bool> vocabShowPitchAccent;
  final Value<bool> kanjiShowReading;
  final Value<bool> vocabShowPartsOfSpeech;
  final Value<DateTime> timestamp;
  final Value<int> flashcardsCompletedToday;
  final Value<int> newFlashcardsCompletedToday;
  final Value<List<int>> predefinedDictionaryLists;
  final Value<List<int>> myDictionaryLists;
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
    this.timestamp = const Value.absent(),
    this.flashcardsCompletedToday = const Value.absent(),
    this.newFlashcardsCompletedToday = const Value.absent(),
    this.predefinedDictionaryLists = const Value.absent(),
    this.myDictionaryLists = const Value.absent(),
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
    this.timestamp = const Value.absent(),
    this.flashcardsCompletedToday = const Value.absent(),
    this.newFlashcardsCompletedToday = const Value.absent(),
    this.predefinedDictionaryLists = const Value.absent(),
    this.myDictionaryLists = const Value.absent(),
  }) : name = Value(name);
  static Insertable<FlashcardSet> custom({
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
    Expression<DateTime>? timestamp,
    Expression<int>? flashcardsCompletedToday,
    Expression<int>? newFlashcardsCompletedToday,
    Expression<String>? predefinedDictionaryLists,
    Expression<String>? myDictionaryLists,
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
      if (timestamp != null) 'timestamp': timestamp,
      if (flashcardsCompletedToday != null)
        'flashcards_completed_today': flashcardsCompletedToday,
      if (newFlashcardsCompletedToday != null)
        'new_flashcards_completed_today': newFlashcardsCompletedToday,
      if (predefinedDictionaryLists != null)
        'predefined_dictionary_lists': predefinedDictionaryLists,
      if (myDictionaryLists != null) 'my_dictionary_lists': myDictionaryLists,
    });
  }

  FlashcardSetsCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<bool>? usingSpacedRepetition,
      Value<FrontType>? frontType,
      Value<bool>? vocabShowReading,
      Value<bool>? vocabShowReadingIfRareKanji,
      Value<bool>? vocabShowAlternatives,
      Value<bool>? vocabShowPitchAccent,
      Value<bool>? kanjiShowReading,
      Value<bool>? vocabShowPartsOfSpeech,
      Value<DateTime>? timestamp,
      Value<int>? flashcardsCompletedToday,
      Value<int>? newFlashcardsCompletedToday,
      Value<List<int>>? predefinedDictionaryLists,
      Value<List<int>>? myDictionaryLists}) {
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
      timestamp: timestamp ?? this.timestamp,
      flashcardsCompletedToday:
          flashcardsCompletedToday ?? this.flashcardsCompletedToday,
      newFlashcardsCompletedToday:
          newFlashcardsCompletedToday ?? this.newFlashcardsCompletedToday,
      predefinedDictionaryLists:
          predefinedDictionaryLists ?? this.predefinedDictionaryLists,
      myDictionaryLists: myDictionaryLists ?? this.myDictionaryLists,
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
      map['front_type'] = Variable<int>(
          $FlashcardSetsTable.$converterfrontType.toSql(frontType.value));
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
    if (timestamp.present) {
      map['timestamp'] = Variable<DateTime>(timestamp.value);
    }
    if (flashcardsCompletedToday.present) {
      map['flashcards_completed_today'] =
          Variable<int>(flashcardsCompletedToday.value);
    }
    if (newFlashcardsCompletedToday.present) {
      map['new_flashcards_completed_today'] =
          Variable<int>(newFlashcardsCompletedToday.value);
    }
    if (predefinedDictionaryLists.present) {
      map['predefined_dictionary_lists'] = Variable<String>($FlashcardSetsTable
          .$converterpredefinedDictionaryLists
          .toSql(predefinedDictionaryLists.value));
    }
    if (myDictionaryLists.present) {
      map['my_dictionary_lists'] = Variable<String>($FlashcardSetsTable
          .$convertermyDictionaryLists
          .toSql(myDictionaryLists.value));
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
          ..write('timestamp: $timestamp, ')
          ..write('flashcardsCompletedToday: $flashcardsCompletedToday, ')
          ..write('newFlashcardsCompletedToday: $newFlashcardsCompletedToday, ')
          ..write('predefinedDictionaryLists: $predefinedDictionaryLists, ')
          ..write('myDictionaryLists: $myDictionaryLists')
          ..write(')'))
        .toString();
  }
}

class $DictionaryInfosTable extends DictionaryInfos
    with TableInfo<$DictionaryInfosTable, DictionaryInfo> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DictionaryInfosTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _versionMeta =
      const VerificationMeta('version');
  @override
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
  VerificationContext validateIntegrity(Insertable<DictionaryInfo> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('version')) {
      context.handle(_versionMeta,
          version.isAcceptableOrUnknown(data['version']!, _versionMeta));
    } else if (isInserting) {
      context.missing(_versionMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  DictionaryInfo map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DictionaryInfo(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      version: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}version'])!,
    );
  }

  @override
  $DictionaryInfosTable createAlias(String alias) {
    return $DictionaryInfosTable(attachedDatabase, alias);
  }
}

class DictionaryInfo extends DataClass implements Insertable<DictionaryInfo> {
  final int id;
  final int version;
  const DictionaryInfo({required this.id, required this.version});
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

  factory DictionaryInfo.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DictionaryInfo(
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

  DictionaryInfo copyWith({int? id, int? version}) => DictionaryInfo(
        id: id ?? this.id,
        version: version ?? this.version,
      );
  @override
  String toString() {
    return (StringBuffer('DictionaryInfo(')
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
      (other is DictionaryInfo &&
          other.id == this.id &&
          other.version == this.version);
}

class DictionaryInfosCompanion extends UpdateCompanion<DictionaryInfo> {
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
  static Insertable<DictionaryInfo> custom({
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

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  _$AppDatabaseManager get managers => _$AppDatabaseManager(this);
  late final $VocabWritingsTable vocabWritings = $VocabWritingsTable(this);
  late final Index iXVocabWritingsWritingSearchForm = Index(
      'IX_vocab_writings_writing_search_form',
      'CREATE INDEX IX_vocab_writings_writing_search_form ON vocab_writings (writing_search_form) WHERE writing_search_form IS NOT NULL');
  late final $VocabReadingsTable vocabReadings = $VocabReadingsTable(this);
  late final Index iXVocabReadingsReadingSearchForm = Index(
      'IX_vocab_readings_reading_search_form',
      'CREATE INDEX IX_vocab_readings_reading_search_form ON vocab_readings (reading_search_form) WHERE reading_search_form IS NOT NULL');
  late final Index iXVocabReadingsReadingRomajiSimplified = Index(
      'IX_vocab_readings_reading_romaji_simplified',
      'CREATE INDEX IX_vocab_readings_reading_romaji_simplified ON vocab_readings (reading_romaji_simplified) WHERE reading_romaji_simplified IS NOT NULL');
  late final $VocabsTable vocabs = $VocabsTable(this);
  late final $VocabDefinitionsTable vocabDefinitions =
      $VocabDefinitionsTable(this);
  late final $VocabDefinitionWordsTable vocabDefinitionWords =
      $VocabDefinitionWordsTable(this);
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
  late final $KanjisTable kanjis = $KanjisTable(this);
  late final $KanjiReadingsTable kanjiReadings = $KanjiReadingsTable(this);
  late final $KanjiMeaningWordsTable kanjiMeaningWords =
      $KanjiMeaningWordsTable(this);
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
  late final $SpacedRepetitionDatasTable spacedRepetitionDatas =
      $SpacedRepetitionDatasTable(this);
  late final $SearchHistoryItemsTable searchHistoryItems =
      $SearchHistoryItemsTable(this);
  late final $RadicalsTable radicals = $RadicalsTable(this);
  late final Index uKRadicalsRadical = Index('UK_radicals_radical',
      'CREATE UNIQUE INDEX UK_radicals_radical ON radicals (radical)');
  late final $ProperNounsTable properNouns = $ProperNounsTable(this);
  late final $ProperNounRomajiWordsTable properNounRomajiWords =
      $ProperNounRomajiWordsTable(this);
  late final Index iXProperNounsReading = Index('IX_proper_nouns_reading',
      'CREATE INDEX IX_proper_nouns_reading ON proper_nouns (reading)');
  late final Index iXProperNounsReadingRomaji = Index(
      'IX_proper_nouns_reading_romaji',
      'CREATE INDEX IX_proper_nouns_reading_romaji ON proper_nouns (reading_romaji)');
  late final Index iXProperNounRomajiWordsWord = Index(
      'IX_proper_noun_romaji_words_word',
      'CREATE INDEX IX_proper_noun_romaji_words_word ON proper_noun_romaji_words (word)');
  late final $PredefinedDictionaryListsTable predefinedDictionaryLists =
      $PredefinedDictionaryListsTable(this);
  late final $MyDictionaryListsTable myDictionaryLists =
      $MyDictionaryListsTable(this);
  late final $MyDictionaryListItemsTable myDictionaryListItems =
      $MyDictionaryListItemsTable(this);
  late final Index iXMyDictionaryListItemsListId = Index(
      'IX_my_dictionary_list_items_list_id',
      'CREATE INDEX IX_my_dictionary_list_items_list_id ON my_dictionary_list_items (list_id)');
  late final $FlashcardSetsTable flashcardSets = $FlashcardSetsTable(this);
  late final $DictionaryInfosTable dictionaryInfos =
      $DictionaryInfosTable(this);
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
  late final DictionaryInfosDao dictionaryInfosDao =
      DictionaryInfosDao(this as AppDatabase);
  late final FlashcardSetsDao flashcardSetsDao =
      FlashcardSetsDao(this as AppDatabase);
  late final KanjisDao kanjisDao = KanjisDao(this as AppDatabase);
  late final MyDictionaryListsDao myDictionaryListsDao =
      MyDictionaryListsDao(this as AppDatabase);
  late final PredefinedDictionaryListsDao predefinedDictionaryListsDao =
      PredefinedDictionaryListsDao(this as AppDatabase);
  late final ProperNounsDao properNounsDao =
      ProperNounsDao(this as AppDatabase);
  late final RadicalsDao radicalsDao = RadicalsDao(this as AppDatabase);
  late final SearchHistoryItemsDao searchHistoryItemsDao =
      SearchHistoryItemsDao(this as AppDatabase);
  late final SpacedRepetitionDatasDao spacedRepetitionDatasDao =
      SpacedRepetitionDatasDao(this as AppDatabase);
  late final VocabsDao vocabsDao = VocabsDao(this as AppDatabase);
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
        flashcardSets,
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
}

typedef $$VocabWritingsTableInsertCompanionBuilder = VocabWritingsCompanion
    Function({
  Value<int> id,
  required int vocabId,
  required String writing,
  Value<String?> writingSearchForm,
  Value<List<WritingInfo>?> info,
});
typedef $$VocabWritingsTableUpdateCompanionBuilder = VocabWritingsCompanion
    Function({
  Value<int> id,
  Value<int> vocabId,
  Value<String> writing,
  Value<String?> writingSearchForm,
  Value<List<WritingInfo>?> info,
});

class $$VocabWritingsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $VocabWritingsTable,
    VocabWriting,
    $$VocabWritingsTableFilterComposer,
    $$VocabWritingsTableOrderingComposer,
    $$VocabWritingsTableProcessedTableManager,
    $$VocabWritingsTableInsertCompanionBuilder,
    $$VocabWritingsTableUpdateCompanionBuilder> {
  $$VocabWritingsTableTableManager(_$AppDatabase db, $VocabWritingsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$VocabWritingsTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$VocabWritingsTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$VocabWritingsTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<int> vocabId = const Value.absent(),
            Value<String> writing = const Value.absent(),
            Value<String?> writingSearchForm = const Value.absent(),
            Value<List<WritingInfo>?> info = const Value.absent(),
          }) =>
              VocabWritingsCompanion(
            id: id,
            vocabId: vocabId,
            writing: writing,
            writingSearchForm: writingSearchForm,
            info: info,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            required int vocabId,
            required String writing,
            Value<String?> writingSearchForm = const Value.absent(),
            Value<List<WritingInfo>?> info = const Value.absent(),
          }) =>
              VocabWritingsCompanion.insert(
            id: id,
            vocabId: vocabId,
            writing: writing,
            writingSearchForm: writingSearchForm,
            info: info,
          ),
        ));
}

class $$VocabWritingsTableProcessedTableManager extends ProcessedTableManager<
    _$AppDatabase,
    $VocabWritingsTable,
    VocabWriting,
    $$VocabWritingsTableFilterComposer,
    $$VocabWritingsTableOrderingComposer,
    $$VocabWritingsTableProcessedTableManager,
    $$VocabWritingsTableInsertCompanionBuilder,
    $$VocabWritingsTableUpdateCompanionBuilder> {
  $$VocabWritingsTableProcessedTableManager(super.$state);
}

class $$VocabWritingsTableFilterComposer
    extends FilterComposer<_$AppDatabase, $VocabWritingsTable> {
  $$VocabWritingsTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get vocabId => $state.composableBuilder(
      column: $state.table.vocabId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get writing => $state.composableBuilder(
      column: $state.table.writing,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get writingSearchForm => $state.composableBuilder(
      column: $state.table.writingSearchForm,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnWithTypeConverterFilters<List<WritingInfo>?, List<WritingInfo>, String>
      get info => $state.composableBuilder(
          column: $state.table.info,
          builder: (column, joinBuilders) => ColumnWithTypeConverterFilters(
              column,
              joinBuilders: joinBuilders));
}

class $$VocabWritingsTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $VocabWritingsTable> {
  $$VocabWritingsTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get vocabId => $state.composableBuilder(
      column: $state.table.vocabId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get writing => $state.composableBuilder(
      column: $state.table.writing,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get writingSearchForm => $state.composableBuilder(
      column: $state.table.writingSearchForm,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get info => $state.composableBuilder(
      column: $state.table.info,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$VocabReadingsTableInsertCompanionBuilder = VocabReadingsCompanion
    Function({
  Value<int> id,
  required int vocabId,
  required String reading,
  Value<String?> readingSearchForm,
  required String readingRomaji,
  Value<String?> readingRomajiSimplified,
  Value<List<String>?> associatedWritings,
  Value<List<ReadingInfo>?> info,
  Value<List<int>?> pitchAccents,
});
typedef $$VocabReadingsTableUpdateCompanionBuilder = VocabReadingsCompanion
    Function({
  Value<int> id,
  Value<int> vocabId,
  Value<String> reading,
  Value<String?> readingSearchForm,
  Value<String> readingRomaji,
  Value<String?> readingRomajiSimplified,
  Value<List<String>?> associatedWritings,
  Value<List<ReadingInfo>?> info,
  Value<List<int>?> pitchAccents,
});

class $$VocabReadingsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $VocabReadingsTable,
    VocabReading,
    $$VocabReadingsTableFilterComposer,
    $$VocabReadingsTableOrderingComposer,
    $$VocabReadingsTableProcessedTableManager,
    $$VocabReadingsTableInsertCompanionBuilder,
    $$VocabReadingsTableUpdateCompanionBuilder> {
  $$VocabReadingsTableTableManager(_$AppDatabase db, $VocabReadingsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$VocabReadingsTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$VocabReadingsTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$VocabReadingsTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<int> vocabId = const Value.absent(),
            Value<String> reading = const Value.absent(),
            Value<String?> readingSearchForm = const Value.absent(),
            Value<String> readingRomaji = const Value.absent(),
            Value<String?> readingRomajiSimplified = const Value.absent(),
            Value<List<String>?> associatedWritings = const Value.absent(),
            Value<List<ReadingInfo>?> info = const Value.absent(),
            Value<List<int>?> pitchAccents = const Value.absent(),
          }) =>
              VocabReadingsCompanion(
            id: id,
            vocabId: vocabId,
            reading: reading,
            readingSearchForm: readingSearchForm,
            readingRomaji: readingRomaji,
            readingRomajiSimplified: readingRomajiSimplified,
            associatedWritings: associatedWritings,
            info: info,
            pitchAccents: pitchAccents,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            required int vocabId,
            required String reading,
            Value<String?> readingSearchForm = const Value.absent(),
            required String readingRomaji,
            Value<String?> readingRomajiSimplified = const Value.absent(),
            Value<List<String>?> associatedWritings = const Value.absent(),
            Value<List<ReadingInfo>?> info = const Value.absent(),
            Value<List<int>?> pitchAccents = const Value.absent(),
          }) =>
              VocabReadingsCompanion.insert(
            id: id,
            vocabId: vocabId,
            reading: reading,
            readingSearchForm: readingSearchForm,
            readingRomaji: readingRomaji,
            readingRomajiSimplified: readingRomajiSimplified,
            associatedWritings: associatedWritings,
            info: info,
            pitchAccents: pitchAccents,
          ),
        ));
}

class $$VocabReadingsTableProcessedTableManager extends ProcessedTableManager<
    _$AppDatabase,
    $VocabReadingsTable,
    VocabReading,
    $$VocabReadingsTableFilterComposer,
    $$VocabReadingsTableOrderingComposer,
    $$VocabReadingsTableProcessedTableManager,
    $$VocabReadingsTableInsertCompanionBuilder,
    $$VocabReadingsTableUpdateCompanionBuilder> {
  $$VocabReadingsTableProcessedTableManager(super.$state);
}

class $$VocabReadingsTableFilterComposer
    extends FilterComposer<_$AppDatabase, $VocabReadingsTable> {
  $$VocabReadingsTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get vocabId => $state.composableBuilder(
      column: $state.table.vocabId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get reading => $state.composableBuilder(
      column: $state.table.reading,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get readingSearchForm => $state.composableBuilder(
      column: $state.table.readingSearchForm,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get readingRomaji => $state.composableBuilder(
      column: $state.table.readingRomaji,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get readingRomajiSimplified => $state.composableBuilder(
      column: $state.table.readingRomajiSimplified,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnWithTypeConverterFilters<List<String>?, List<String>, String>
      get associatedWritings => $state.composableBuilder(
          column: $state.table.associatedWritings,
          builder: (column, joinBuilders) => ColumnWithTypeConverterFilters(
              column,
              joinBuilders: joinBuilders));

  ColumnWithTypeConverterFilters<List<ReadingInfo>?, List<ReadingInfo>, String>
      get info => $state.composableBuilder(
          column: $state.table.info,
          builder: (column, joinBuilders) => ColumnWithTypeConverterFilters(
              column,
              joinBuilders: joinBuilders));

  ColumnWithTypeConverterFilters<List<int>?, List<int>, String>
      get pitchAccents => $state.composableBuilder(
          column: $state.table.pitchAccents,
          builder: (column, joinBuilders) => ColumnWithTypeConverterFilters(
              column,
              joinBuilders: joinBuilders));
}

class $$VocabReadingsTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $VocabReadingsTable> {
  $$VocabReadingsTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get vocabId => $state.composableBuilder(
      column: $state.table.vocabId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get reading => $state.composableBuilder(
      column: $state.table.reading,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get readingSearchForm => $state.composableBuilder(
      column: $state.table.readingSearchForm,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get readingRomaji => $state.composableBuilder(
      column: $state.table.readingRomaji,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get readingRomajiSimplified =>
      $state.composableBuilder(
          column: $state.table.readingRomajiSimplified,
          builder: (column, joinBuilders) =>
              ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get associatedWritings => $state.composableBuilder(
      column: $state.table.associatedWritings,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get info => $state.composableBuilder(
      column: $state.table.info,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get pitchAccents => $state.composableBuilder(
      column: $state.table.pitchAccents,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$VocabDefinitionsTableInsertCompanionBuilder
    = VocabDefinitionsCompanion Function({
  Value<int> id,
  required int vocabId,
  required String definition,
  Value<String?> additionalInfo,
  Value<List<PartOfSpeech>?> pos,
  Value<List<String>?> appliesTo,
  Value<List<Field>?> fields,
  Value<List<MiscellaneousInfo>?> miscInfo,
  Value<List<Dialect>?> dialects,
  Value<List<VocabExample>?> examples,
  Value<List<LanguageSource>?> languageSource,
  required bool waseieigo,
  Value<List<VocabReference>?> crossReferences,
  Value<List<VocabReference>?> antonyms,
});
typedef $$VocabDefinitionsTableUpdateCompanionBuilder
    = VocabDefinitionsCompanion Function({
  Value<int> id,
  Value<int> vocabId,
  Value<String> definition,
  Value<String?> additionalInfo,
  Value<List<PartOfSpeech>?> pos,
  Value<List<String>?> appliesTo,
  Value<List<Field>?> fields,
  Value<List<MiscellaneousInfo>?> miscInfo,
  Value<List<Dialect>?> dialects,
  Value<List<VocabExample>?> examples,
  Value<List<LanguageSource>?> languageSource,
  Value<bool> waseieigo,
  Value<List<VocabReference>?> crossReferences,
  Value<List<VocabReference>?> antonyms,
});

class $$VocabDefinitionsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $VocabDefinitionsTable,
    VocabDefinition,
    $$VocabDefinitionsTableFilterComposer,
    $$VocabDefinitionsTableOrderingComposer,
    $$VocabDefinitionsTableProcessedTableManager,
    $$VocabDefinitionsTableInsertCompanionBuilder,
    $$VocabDefinitionsTableUpdateCompanionBuilder> {
  $$VocabDefinitionsTableTableManager(
      _$AppDatabase db, $VocabDefinitionsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$VocabDefinitionsTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$VocabDefinitionsTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$VocabDefinitionsTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<int> vocabId = const Value.absent(),
            Value<String> definition = const Value.absent(),
            Value<String?> additionalInfo = const Value.absent(),
            Value<List<PartOfSpeech>?> pos = const Value.absent(),
            Value<List<String>?> appliesTo = const Value.absent(),
            Value<List<Field>?> fields = const Value.absent(),
            Value<List<MiscellaneousInfo>?> miscInfo = const Value.absent(),
            Value<List<Dialect>?> dialects = const Value.absent(),
            Value<List<VocabExample>?> examples = const Value.absent(),
            Value<List<LanguageSource>?> languageSource = const Value.absent(),
            Value<bool> waseieigo = const Value.absent(),
            Value<List<VocabReference>?> crossReferences = const Value.absent(),
            Value<List<VocabReference>?> antonyms = const Value.absent(),
          }) =>
              VocabDefinitionsCompanion(
            id: id,
            vocabId: vocabId,
            definition: definition,
            additionalInfo: additionalInfo,
            pos: pos,
            appliesTo: appliesTo,
            fields: fields,
            miscInfo: miscInfo,
            dialects: dialects,
            examples: examples,
            languageSource: languageSource,
            waseieigo: waseieigo,
            crossReferences: crossReferences,
            antonyms: antonyms,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            required int vocabId,
            required String definition,
            Value<String?> additionalInfo = const Value.absent(),
            Value<List<PartOfSpeech>?> pos = const Value.absent(),
            Value<List<String>?> appliesTo = const Value.absent(),
            Value<List<Field>?> fields = const Value.absent(),
            Value<List<MiscellaneousInfo>?> miscInfo = const Value.absent(),
            Value<List<Dialect>?> dialects = const Value.absent(),
            Value<List<VocabExample>?> examples = const Value.absent(),
            Value<List<LanguageSource>?> languageSource = const Value.absent(),
            required bool waseieigo,
            Value<List<VocabReference>?> crossReferences = const Value.absent(),
            Value<List<VocabReference>?> antonyms = const Value.absent(),
          }) =>
              VocabDefinitionsCompanion.insert(
            id: id,
            vocabId: vocabId,
            definition: definition,
            additionalInfo: additionalInfo,
            pos: pos,
            appliesTo: appliesTo,
            fields: fields,
            miscInfo: miscInfo,
            dialects: dialects,
            examples: examples,
            languageSource: languageSource,
            waseieigo: waseieigo,
            crossReferences: crossReferences,
            antonyms: antonyms,
          ),
        ));
}

class $$VocabDefinitionsTableProcessedTableManager
    extends ProcessedTableManager<
        _$AppDatabase,
        $VocabDefinitionsTable,
        VocabDefinition,
        $$VocabDefinitionsTableFilterComposer,
        $$VocabDefinitionsTableOrderingComposer,
        $$VocabDefinitionsTableProcessedTableManager,
        $$VocabDefinitionsTableInsertCompanionBuilder,
        $$VocabDefinitionsTableUpdateCompanionBuilder> {
  $$VocabDefinitionsTableProcessedTableManager(super.$state);
}

class $$VocabDefinitionsTableFilterComposer
    extends FilterComposer<_$AppDatabase, $VocabDefinitionsTable> {
  $$VocabDefinitionsTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get vocabId => $state.composableBuilder(
      column: $state.table.vocabId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get definition => $state.composableBuilder(
      column: $state.table.definition,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get additionalInfo => $state.composableBuilder(
      column: $state.table.additionalInfo,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnWithTypeConverterFilters<List<PartOfSpeech>?, List<PartOfSpeech>,
          String>
      get pos => $state.composableBuilder(
          column: $state.table.pos,
          builder: (column, joinBuilders) => ColumnWithTypeConverterFilters(
              column,
              joinBuilders: joinBuilders));

  ColumnWithTypeConverterFilters<List<String>?, List<String>, String>
      get appliesTo => $state.composableBuilder(
          column: $state.table.appliesTo,
          builder: (column, joinBuilders) => ColumnWithTypeConverterFilters(
              column,
              joinBuilders: joinBuilders));

  ColumnWithTypeConverterFilters<List<Field>?, List<Field>, String>
      get fields => $state.composableBuilder(
          column: $state.table.fields,
          builder: (column, joinBuilders) => ColumnWithTypeConverterFilters(
              column,
              joinBuilders: joinBuilders));

  ColumnWithTypeConverterFilters<List<MiscellaneousInfo>?,
          List<MiscellaneousInfo>, String>
      get miscInfo => $state.composableBuilder(
          column: $state.table.miscInfo,
          builder: (column, joinBuilders) => ColumnWithTypeConverterFilters(
              column,
              joinBuilders: joinBuilders));

  ColumnWithTypeConverterFilters<List<Dialect>?, List<Dialect>, String>
      get dialects => $state.composableBuilder(
          column: $state.table.dialects,
          builder: (column, joinBuilders) => ColumnWithTypeConverterFilters(
              column,
              joinBuilders: joinBuilders));

  ColumnWithTypeConverterFilters<List<VocabExample>?, List<VocabExample>,
          String>
      get examples => $state.composableBuilder(
          column: $state.table.examples,
          builder: (column, joinBuilders) => ColumnWithTypeConverterFilters(
              column,
              joinBuilders: joinBuilders));

  ColumnWithTypeConverterFilters<List<LanguageSource>?, List<LanguageSource>,
          String>
      get languageSource => $state.composableBuilder(
          column: $state.table.languageSource,
          builder: (column, joinBuilders) => ColumnWithTypeConverterFilters(
              column,
              joinBuilders: joinBuilders));

  ColumnFilters<bool> get waseieigo => $state.composableBuilder(
      column: $state.table.waseieigo,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnWithTypeConverterFilters<List<VocabReference>?, List<VocabReference>,
          String>
      get crossReferences => $state.composableBuilder(
          column: $state.table.crossReferences,
          builder: (column, joinBuilders) => ColumnWithTypeConverterFilters(
              column,
              joinBuilders: joinBuilders));

  ColumnWithTypeConverterFilters<List<VocabReference>?, List<VocabReference>,
          String>
      get antonyms => $state.composableBuilder(
          column: $state.table.antonyms,
          builder: (column, joinBuilders) => ColumnWithTypeConverterFilters(
              column,
              joinBuilders: joinBuilders));
}

class $$VocabDefinitionsTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $VocabDefinitionsTable> {
  $$VocabDefinitionsTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get vocabId => $state.composableBuilder(
      column: $state.table.vocabId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get definition => $state.composableBuilder(
      column: $state.table.definition,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get additionalInfo => $state.composableBuilder(
      column: $state.table.additionalInfo,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get pos => $state.composableBuilder(
      column: $state.table.pos,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get appliesTo => $state.composableBuilder(
      column: $state.table.appliesTo,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get fields => $state.composableBuilder(
      column: $state.table.fields,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get miscInfo => $state.composableBuilder(
      column: $state.table.miscInfo,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get dialects => $state.composableBuilder(
      column: $state.table.dialects,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get examples => $state.composableBuilder(
      column: $state.table.examples,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get languageSource => $state.composableBuilder(
      column: $state.table.languageSource,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get waseieigo => $state.composableBuilder(
      column: $state.table.waseieigo,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get crossReferences => $state.composableBuilder(
      column: $state.table.crossReferences,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get antonyms => $state.composableBuilder(
      column: $state.table.antonyms,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$VocabDefinitionWordsTableInsertCompanionBuilder
    = VocabDefinitionWordsCompanion Function({
  required String word,
  required int vocabId,
  Value<int> rowid,
});
typedef $$VocabDefinitionWordsTableUpdateCompanionBuilder
    = VocabDefinitionWordsCompanion Function({
  Value<String> word,
  Value<int> vocabId,
  Value<int> rowid,
});

class $$VocabDefinitionWordsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $VocabDefinitionWordsTable,
    VocabDefinitionWord,
    $$VocabDefinitionWordsTableFilterComposer,
    $$VocabDefinitionWordsTableOrderingComposer,
    $$VocabDefinitionWordsTableProcessedTableManager,
    $$VocabDefinitionWordsTableInsertCompanionBuilder,
    $$VocabDefinitionWordsTableUpdateCompanionBuilder> {
  $$VocabDefinitionWordsTableTableManager(
      _$AppDatabase db, $VocabDefinitionWordsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer: $$VocabDefinitionWordsTableFilterComposer(
              ComposerState(db, table)),
          orderingComposer: $$VocabDefinitionWordsTableOrderingComposer(
              ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$VocabDefinitionWordsTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<String> word = const Value.absent(),
            Value<int> vocabId = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              VocabDefinitionWordsCompanion(
            word: word,
            vocabId: vocabId,
            rowid: rowid,
          ),
          getInsertCompanionBuilder: ({
            required String word,
            required int vocabId,
            Value<int> rowid = const Value.absent(),
          }) =>
              VocabDefinitionWordsCompanion.insert(
            word: word,
            vocabId: vocabId,
            rowid: rowid,
          ),
        ));
}

class $$VocabDefinitionWordsTableProcessedTableManager
    extends ProcessedTableManager<
        _$AppDatabase,
        $VocabDefinitionWordsTable,
        VocabDefinitionWord,
        $$VocabDefinitionWordsTableFilterComposer,
        $$VocabDefinitionWordsTableOrderingComposer,
        $$VocabDefinitionWordsTableProcessedTableManager,
        $$VocabDefinitionWordsTableInsertCompanionBuilder,
        $$VocabDefinitionWordsTableUpdateCompanionBuilder> {
  $$VocabDefinitionWordsTableProcessedTableManager(super.$state);
}

class $$VocabDefinitionWordsTableFilterComposer
    extends FilterComposer<_$AppDatabase, $VocabDefinitionWordsTable> {
  $$VocabDefinitionWordsTableFilterComposer(super.$state);
  ColumnFilters<String> get word => $state.composableBuilder(
      column: $state.table.word,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get vocabId => $state.composableBuilder(
      column: $state.table.vocabId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$VocabDefinitionWordsTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $VocabDefinitionWordsTable> {
  $$VocabDefinitionWordsTableOrderingComposer(super.$state);
  ColumnOrderings<String> get word => $state.composableBuilder(
      column: $state.table.word,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get vocabId => $state.composableBuilder(
      column: $state.table.vocabId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$KanjiMeaningWordsTableInsertCompanionBuilder
    = KanjiMeaningWordsCompanion Function({
  required String word,
  required int kanjiId,
  Value<int> rowid,
});
typedef $$KanjiMeaningWordsTableUpdateCompanionBuilder
    = KanjiMeaningWordsCompanion Function({
  Value<String> word,
  Value<int> kanjiId,
  Value<int> rowid,
});

class $$KanjiMeaningWordsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $KanjiMeaningWordsTable,
    KanjiMeaningWord,
    $$KanjiMeaningWordsTableFilterComposer,
    $$KanjiMeaningWordsTableOrderingComposer,
    $$KanjiMeaningWordsTableProcessedTableManager,
    $$KanjiMeaningWordsTableInsertCompanionBuilder,
    $$KanjiMeaningWordsTableUpdateCompanionBuilder> {
  $$KanjiMeaningWordsTableTableManager(
      _$AppDatabase db, $KanjiMeaningWordsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$KanjiMeaningWordsTableFilterComposer(ComposerState(db, table)),
          orderingComposer: $$KanjiMeaningWordsTableOrderingComposer(
              ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$KanjiMeaningWordsTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<String> word = const Value.absent(),
            Value<int> kanjiId = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              KanjiMeaningWordsCompanion(
            word: word,
            kanjiId: kanjiId,
            rowid: rowid,
          ),
          getInsertCompanionBuilder: ({
            required String word,
            required int kanjiId,
            Value<int> rowid = const Value.absent(),
          }) =>
              KanjiMeaningWordsCompanion.insert(
            word: word,
            kanjiId: kanjiId,
            rowid: rowid,
          ),
        ));
}

class $$KanjiMeaningWordsTableProcessedTableManager
    extends ProcessedTableManager<
        _$AppDatabase,
        $KanjiMeaningWordsTable,
        KanjiMeaningWord,
        $$KanjiMeaningWordsTableFilterComposer,
        $$KanjiMeaningWordsTableOrderingComposer,
        $$KanjiMeaningWordsTableProcessedTableManager,
        $$KanjiMeaningWordsTableInsertCompanionBuilder,
        $$KanjiMeaningWordsTableUpdateCompanionBuilder> {
  $$KanjiMeaningWordsTableProcessedTableManager(super.$state);
}

class $$KanjiMeaningWordsTableFilterComposer
    extends FilterComposer<_$AppDatabase, $KanjiMeaningWordsTable> {
  $$KanjiMeaningWordsTableFilterComposer(super.$state);
  ColumnFilters<String> get word => $state.composableBuilder(
      column: $state.table.word,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get kanjiId => $state.composableBuilder(
      column: $state.table.kanjiId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$KanjiMeaningWordsTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $KanjiMeaningWordsTable> {
  $$KanjiMeaningWordsTableOrderingComposer(super.$state);
  ColumnOrderings<String> get word => $state.composableBuilder(
      column: $state.table.word,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get kanjiId => $state.composableBuilder(
      column: $state.table.kanjiId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$SearchHistoryItemsTableInsertCompanionBuilder
    = SearchHistoryItemsCompanion Function({
  Value<int> id,
  required String searchText,
  Value<DateTime> timestamp,
});
typedef $$SearchHistoryItemsTableUpdateCompanionBuilder
    = SearchHistoryItemsCompanion Function({
  Value<int> id,
  Value<String> searchText,
  Value<DateTime> timestamp,
});

class $$SearchHistoryItemsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $SearchHistoryItemsTable,
    SearchHistoryItem,
    $$SearchHistoryItemsTableFilterComposer,
    $$SearchHistoryItemsTableOrderingComposer,
    $$SearchHistoryItemsTableProcessedTableManager,
    $$SearchHistoryItemsTableInsertCompanionBuilder,
    $$SearchHistoryItemsTableUpdateCompanionBuilder> {
  $$SearchHistoryItemsTableTableManager(
      _$AppDatabase db, $SearchHistoryItemsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$SearchHistoryItemsTableFilterComposer(ComposerState(db, table)),
          orderingComposer: $$SearchHistoryItemsTableOrderingComposer(
              ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$SearchHistoryItemsTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<String> searchText = const Value.absent(),
            Value<DateTime> timestamp = const Value.absent(),
          }) =>
              SearchHistoryItemsCompanion(
            id: id,
            searchText: searchText,
            timestamp: timestamp,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            required String searchText,
            Value<DateTime> timestamp = const Value.absent(),
          }) =>
              SearchHistoryItemsCompanion.insert(
            id: id,
            searchText: searchText,
            timestamp: timestamp,
          ),
        ));
}

class $$SearchHistoryItemsTableProcessedTableManager
    extends ProcessedTableManager<
        _$AppDatabase,
        $SearchHistoryItemsTable,
        SearchHistoryItem,
        $$SearchHistoryItemsTableFilterComposer,
        $$SearchHistoryItemsTableOrderingComposer,
        $$SearchHistoryItemsTableProcessedTableManager,
        $$SearchHistoryItemsTableInsertCompanionBuilder,
        $$SearchHistoryItemsTableUpdateCompanionBuilder> {
  $$SearchHistoryItemsTableProcessedTableManager(super.$state);
}

class $$SearchHistoryItemsTableFilterComposer
    extends FilterComposer<_$AppDatabase, $SearchHistoryItemsTable> {
  $$SearchHistoryItemsTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get searchText => $state.composableBuilder(
      column: $state.table.searchText,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get timestamp => $state.composableBuilder(
      column: $state.table.timestamp,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$SearchHistoryItemsTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $SearchHistoryItemsTable> {
  $$SearchHistoryItemsTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get searchText => $state.composableBuilder(
      column: $state.table.searchText,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get timestamp => $state.composableBuilder(
      column: $state.table.timestamp,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$RadicalsTableInsertCompanionBuilder = RadicalsCompanion Function({
  Value<int> id,
  required String radical,
  Value<int?> kangxiId,
  required int strokeCount,
  required String meaning,
  required String reading,
  Value<RadicalPosition?> position,
  Value<RadicalImportance?> importance,
  Value<List<String>?> strokes,
  Value<List<String>?> variants,
  Value<String?> variantOf,
});
typedef $$RadicalsTableUpdateCompanionBuilder = RadicalsCompanion Function({
  Value<int> id,
  Value<String> radical,
  Value<int?> kangxiId,
  Value<int> strokeCount,
  Value<String> meaning,
  Value<String> reading,
  Value<RadicalPosition?> position,
  Value<RadicalImportance?> importance,
  Value<List<String>?> strokes,
  Value<List<String>?> variants,
  Value<String?> variantOf,
});

class $$RadicalsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $RadicalsTable,
    Radical,
    $$RadicalsTableFilterComposer,
    $$RadicalsTableOrderingComposer,
    $$RadicalsTableProcessedTableManager,
    $$RadicalsTableInsertCompanionBuilder,
    $$RadicalsTableUpdateCompanionBuilder> {
  $$RadicalsTableTableManager(_$AppDatabase db, $RadicalsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$RadicalsTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$RadicalsTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$RadicalsTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<String> radical = const Value.absent(),
            Value<int?> kangxiId = const Value.absent(),
            Value<int> strokeCount = const Value.absent(),
            Value<String> meaning = const Value.absent(),
            Value<String> reading = const Value.absent(),
            Value<RadicalPosition?> position = const Value.absent(),
            Value<RadicalImportance?> importance = const Value.absent(),
            Value<List<String>?> strokes = const Value.absent(),
            Value<List<String>?> variants = const Value.absent(),
            Value<String?> variantOf = const Value.absent(),
          }) =>
              RadicalsCompanion(
            id: id,
            radical: radical,
            kangxiId: kangxiId,
            strokeCount: strokeCount,
            meaning: meaning,
            reading: reading,
            position: position,
            importance: importance,
            strokes: strokes,
            variants: variants,
            variantOf: variantOf,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            required String radical,
            Value<int?> kangxiId = const Value.absent(),
            required int strokeCount,
            required String meaning,
            required String reading,
            Value<RadicalPosition?> position = const Value.absent(),
            Value<RadicalImportance?> importance = const Value.absent(),
            Value<List<String>?> strokes = const Value.absent(),
            Value<List<String>?> variants = const Value.absent(),
            Value<String?> variantOf = const Value.absent(),
          }) =>
              RadicalsCompanion.insert(
            id: id,
            radical: radical,
            kangxiId: kangxiId,
            strokeCount: strokeCount,
            meaning: meaning,
            reading: reading,
            position: position,
            importance: importance,
            strokes: strokes,
            variants: variants,
            variantOf: variantOf,
          ),
        ));
}

class $$RadicalsTableProcessedTableManager extends ProcessedTableManager<
    _$AppDatabase,
    $RadicalsTable,
    Radical,
    $$RadicalsTableFilterComposer,
    $$RadicalsTableOrderingComposer,
    $$RadicalsTableProcessedTableManager,
    $$RadicalsTableInsertCompanionBuilder,
    $$RadicalsTableUpdateCompanionBuilder> {
  $$RadicalsTableProcessedTableManager(super.$state);
}

class $$RadicalsTableFilterComposer
    extends FilterComposer<_$AppDatabase, $RadicalsTable> {
  $$RadicalsTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get radical => $state.composableBuilder(
      column: $state.table.radical,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get kangxiId => $state.composableBuilder(
      column: $state.table.kangxiId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get strokeCount => $state.composableBuilder(
      column: $state.table.strokeCount,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get meaning => $state.composableBuilder(
      column: $state.table.meaning,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get reading => $state.composableBuilder(
      column: $state.table.reading,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnWithTypeConverterFilters<RadicalPosition?, RadicalPosition, int>
      get position => $state.composableBuilder(
          column: $state.table.position,
          builder: (column, joinBuilders) => ColumnWithTypeConverterFilters(
              column,
              joinBuilders: joinBuilders));

  ColumnWithTypeConverterFilters<RadicalImportance?, RadicalImportance, int>
      get importance => $state.composableBuilder(
          column: $state.table.importance,
          builder: (column, joinBuilders) => ColumnWithTypeConverterFilters(
              column,
              joinBuilders: joinBuilders));

  ColumnWithTypeConverterFilters<List<String>?, List<String>, String>
      get strokes => $state.composableBuilder(
          column: $state.table.strokes,
          builder: (column, joinBuilders) => ColumnWithTypeConverterFilters(
              column,
              joinBuilders: joinBuilders));

  ColumnWithTypeConverterFilters<List<String>?, List<String>, String>
      get variants => $state.composableBuilder(
          column: $state.table.variants,
          builder: (column, joinBuilders) => ColumnWithTypeConverterFilters(
              column,
              joinBuilders: joinBuilders));

  ColumnFilters<String> get variantOf => $state.composableBuilder(
      column: $state.table.variantOf,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$RadicalsTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $RadicalsTable> {
  $$RadicalsTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get radical => $state.composableBuilder(
      column: $state.table.radical,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get kangxiId => $state.composableBuilder(
      column: $state.table.kangxiId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get strokeCount => $state.composableBuilder(
      column: $state.table.strokeCount,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get meaning => $state.composableBuilder(
      column: $state.table.meaning,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get reading => $state.composableBuilder(
      column: $state.table.reading,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get position => $state.composableBuilder(
      column: $state.table.position,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get importance => $state.composableBuilder(
      column: $state.table.importance,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get strokes => $state.composableBuilder(
      column: $state.table.strokes,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get variants => $state.composableBuilder(
      column: $state.table.variants,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get variantOf => $state.composableBuilder(
      column: $state.table.variantOf,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$ProperNounRomajiWordsTableInsertCompanionBuilder
    = ProperNounRomajiWordsCompanion Function({
  Value<int> id,
  required String word,
  required int properNounId,
});
typedef $$ProperNounRomajiWordsTableUpdateCompanionBuilder
    = ProperNounRomajiWordsCompanion Function({
  Value<int> id,
  Value<String> word,
  Value<int> properNounId,
});

class $$ProperNounRomajiWordsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ProperNounRomajiWordsTable,
    ProperNounRomajiWord,
    $$ProperNounRomajiWordsTableFilterComposer,
    $$ProperNounRomajiWordsTableOrderingComposer,
    $$ProperNounRomajiWordsTableProcessedTableManager,
    $$ProperNounRomajiWordsTableInsertCompanionBuilder,
    $$ProperNounRomajiWordsTableUpdateCompanionBuilder> {
  $$ProperNounRomajiWordsTableTableManager(
      _$AppDatabase db, $ProperNounRomajiWordsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer: $$ProperNounRomajiWordsTableFilterComposer(
              ComposerState(db, table)),
          orderingComposer: $$ProperNounRomajiWordsTableOrderingComposer(
              ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$ProperNounRomajiWordsTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<String> word = const Value.absent(),
            Value<int> properNounId = const Value.absent(),
          }) =>
              ProperNounRomajiWordsCompanion(
            id: id,
            word: word,
            properNounId: properNounId,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            required String word,
            required int properNounId,
          }) =>
              ProperNounRomajiWordsCompanion.insert(
            id: id,
            word: word,
            properNounId: properNounId,
          ),
        ));
}

class $$ProperNounRomajiWordsTableProcessedTableManager
    extends ProcessedTableManager<
        _$AppDatabase,
        $ProperNounRomajiWordsTable,
        ProperNounRomajiWord,
        $$ProperNounRomajiWordsTableFilterComposer,
        $$ProperNounRomajiWordsTableOrderingComposer,
        $$ProperNounRomajiWordsTableProcessedTableManager,
        $$ProperNounRomajiWordsTableInsertCompanionBuilder,
        $$ProperNounRomajiWordsTableUpdateCompanionBuilder> {
  $$ProperNounRomajiWordsTableProcessedTableManager(super.$state);
}

class $$ProperNounRomajiWordsTableFilterComposer
    extends FilterComposer<_$AppDatabase, $ProperNounRomajiWordsTable> {
  $$ProperNounRomajiWordsTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get word => $state.composableBuilder(
      column: $state.table.word,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get properNounId => $state.composableBuilder(
      column: $state.table.properNounId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$ProperNounRomajiWordsTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $ProperNounRomajiWordsTable> {
  $$ProperNounRomajiWordsTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get word => $state.composableBuilder(
      column: $state.table.word,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get properNounId => $state.composableBuilder(
      column: $state.table.properNounId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$MyDictionaryListItemsTableInsertCompanionBuilder
    = MyDictionaryListItemsCompanion Function({
  Value<int> id,
  required int listId,
  required int vocabId,
  required int kanjiId,
});
typedef $$MyDictionaryListItemsTableUpdateCompanionBuilder
    = MyDictionaryListItemsCompanion Function({
  Value<int> id,
  Value<int> listId,
  Value<int> vocabId,
  Value<int> kanjiId,
});

class $$MyDictionaryListItemsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $MyDictionaryListItemsTable,
    MyDictionaryListItem,
    $$MyDictionaryListItemsTableFilterComposer,
    $$MyDictionaryListItemsTableOrderingComposer,
    $$MyDictionaryListItemsTableProcessedTableManager,
    $$MyDictionaryListItemsTableInsertCompanionBuilder,
    $$MyDictionaryListItemsTableUpdateCompanionBuilder> {
  $$MyDictionaryListItemsTableTableManager(
      _$AppDatabase db, $MyDictionaryListItemsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer: $$MyDictionaryListItemsTableFilterComposer(
              ComposerState(db, table)),
          orderingComposer: $$MyDictionaryListItemsTableOrderingComposer(
              ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$MyDictionaryListItemsTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<int> listId = const Value.absent(),
            Value<int> vocabId = const Value.absent(),
            Value<int> kanjiId = const Value.absent(),
          }) =>
              MyDictionaryListItemsCompanion(
            id: id,
            listId: listId,
            vocabId: vocabId,
            kanjiId: kanjiId,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            required int listId,
            required int vocabId,
            required int kanjiId,
          }) =>
              MyDictionaryListItemsCompanion.insert(
            id: id,
            listId: listId,
            vocabId: vocabId,
            kanjiId: kanjiId,
          ),
        ));
}

class $$MyDictionaryListItemsTableProcessedTableManager
    extends ProcessedTableManager<
        _$AppDatabase,
        $MyDictionaryListItemsTable,
        MyDictionaryListItem,
        $$MyDictionaryListItemsTableFilterComposer,
        $$MyDictionaryListItemsTableOrderingComposer,
        $$MyDictionaryListItemsTableProcessedTableManager,
        $$MyDictionaryListItemsTableInsertCompanionBuilder,
        $$MyDictionaryListItemsTableUpdateCompanionBuilder> {
  $$MyDictionaryListItemsTableProcessedTableManager(super.$state);
}

class $$MyDictionaryListItemsTableFilterComposer
    extends FilterComposer<_$AppDatabase, $MyDictionaryListItemsTable> {
  $$MyDictionaryListItemsTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get listId => $state.composableBuilder(
      column: $state.table.listId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get vocabId => $state.composableBuilder(
      column: $state.table.vocabId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get kanjiId => $state.composableBuilder(
      column: $state.table.kanjiId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$MyDictionaryListItemsTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $MyDictionaryListItemsTable> {
  $$MyDictionaryListItemsTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get listId => $state.composableBuilder(
      column: $state.table.listId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get vocabId => $state.composableBuilder(
      column: $state.table.vocabId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get kanjiId => $state.composableBuilder(
      column: $state.table.kanjiId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$DictionaryInfosTableInsertCompanionBuilder = DictionaryInfosCompanion
    Function({
  Value<int> id,
  required int version,
  Value<int> rowid,
});
typedef $$DictionaryInfosTableUpdateCompanionBuilder = DictionaryInfosCompanion
    Function({
  Value<int> id,
  Value<int> version,
  Value<int> rowid,
});

class $$DictionaryInfosTableTableManager extends RootTableManager<
    _$AppDatabase,
    $DictionaryInfosTable,
    DictionaryInfo,
    $$DictionaryInfosTableFilterComposer,
    $$DictionaryInfosTableOrderingComposer,
    $$DictionaryInfosTableProcessedTableManager,
    $$DictionaryInfosTableInsertCompanionBuilder,
    $$DictionaryInfosTableUpdateCompanionBuilder> {
  $$DictionaryInfosTableTableManager(
      _$AppDatabase db, $DictionaryInfosTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$DictionaryInfosTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$DictionaryInfosTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$DictionaryInfosTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<int> version = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              DictionaryInfosCompanion(
            id: id,
            version: version,
            rowid: rowid,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            required int version,
            Value<int> rowid = const Value.absent(),
          }) =>
              DictionaryInfosCompanion.insert(
            id: id,
            version: version,
            rowid: rowid,
          ),
        ));
}

class $$DictionaryInfosTableProcessedTableManager extends ProcessedTableManager<
    _$AppDatabase,
    $DictionaryInfosTable,
    DictionaryInfo,
    $$DictionaryInfosTableFilterComposer,
    $$DictionaryInfosTableOrderingComposer,
    $$DictionaryInfosTableProcessedTableManager,
    $$DictionaryInfosTableInsertCompanionBuilder,
    $$DictionaryInfosTableUpdateCompanionBuilder> {
  $$DictionaryInfosTableProcessedTableManager(super.$state);
}

class $$DictionaryInfosTableFilterComposer
    extends FilterComposer<_$AppDatabase, $DictionaryInfosTable> {
  $$DictionaryInfosTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get version => $state.composableBuilder(
      column: $state.table.version,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$DictionaryInfosTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $DictionaryInfosTable> {
  $$DictionaryInfosTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get version => $state.composableBuilder(
      column: $state.table.version,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class _$AppDatabaseManager {
  final _$AppDatabase _db;
  _$AppDatabaseManager(this._db);
  $$VocabWritingsTableTableManager get vocabWritings =>
      $$VocabWritingsTableTableManager(_db, _db.vocabWritings);
  $$VocabReadingsTableTableManager get vocabReadings =>
      $$VocabReadingsTableTableManager(_db, _db.vocabReadings);
  $$VocabDefinitionsTableTableManager get vocabDefinitions =>
      $$VocabDefinitionsTableTableManager(_db, _db.vocabDefinitions);
  $$VocabDefinitionWordsTableTableManager get vocabDefinitionWords =>
      $$VocabDefinitionWordsTableTableManager(_db, _db.vocabDefinitionWords);
  $$KanjiMeaningWordsTableTableManager get kanjiMeaningWords =>
      $$KanjiMeaningWordsTableTableManager(_db, _db.kanjiMeaningWords);
  $$SearchHistoryItemsTableTableManager get searchHistoryItems =>
      $$SearchHistoryItemsTableTableManager(_db, _db.searchHistoryItems);
  $$RadicalsTableTableManager get radicals =>
      $$RadicalsTableTableManager(_db, _db.radicals);
  $$ProperNounRomajiWordsTableTableManager get properNounRomajiWords =>
      $$ProperNounRomajiWordsTableTableManager(_db, _db.properNounRomajiWords);
  $$MyDictionaryListItemsTableTableManager get myDictionaryListItems =>
      $$MyDictionaryListItemsTableTableManager(_db, _db.myDictionaryListItems);
  $$DictionaryInfosTableTableManager get dictionaryInfos =>
      $$DictionaryInfosTableTableManager(_db, _db.dictionaryInfos);
}
