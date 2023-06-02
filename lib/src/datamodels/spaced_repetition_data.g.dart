// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spaced_repetition_data.dart';

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const SpacedRepetitionDataSchema = Schema(
  name: r'SpacedRepetitionData',
  id: 836221396139015002,
  properties: {
    r'dueDate': PropertySchema(
      id: 0,
      name: r'dueDate',
      type: IsarType.long,
    ),
    r'easeFactor': PropertySchema(
      id: 1,
      name: r'easeFactor',
      type: IsarType.double,
    ),
    r'interval': PropertySchema(
      id: 2,
      name: r'interval',
      type: IsarType.long,
    ),
    r'repetitions': PropertySchema(
      id: 3,
      name: r'repetitions',
      type: IsarType.long,
    ),
    r'totalAnswers': PropertySchema(
      id: 4,
      name: r'totalAnswers',
      type: IsarType.long,
    ),
    r'totalWrongAnswers': PropertySchema(
      id: 5,
      name: r'totalWrongAnswers',
      type: IsarType.long,
    )
  },
  estimateSize: _spacedRepetitionDataEstimateSize,
  serialize: _spacedRepetitionDataSerialize,
  deserialize: _spacedRepetitionDataDeserialize,
  deserializeProp: _spacedRepetitionDataDeserializeProp,
);

int _spacedRepetitionDataEstimateSize(
  SpacedRepetitionData object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _spacedRepetitionDataSerialize(
  SpacedRepetitionData object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.dueDate);
  writer.writeDouble(offsets[1], object.easeFactor);
  writer.writeLong(offsets[2], object.interval);
  writer.writeLong(offsets[3], object.repetitions);
  writer.writeLong(offsets[4], object.totalAnswers);
  writer.writeLong(offsets[5], object.totalWrongAnswers);
}

SpacedRepetitionData _spacedRepetitionDataDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = SpacedRepetitionData();
  object.dueDate = reader.readLongOrNull(offsets[0]);
  object.easeFactor = reader.readDouble(offsets[1]);
  object.interval = reader.readLong(offsets[2]);
  object.repetitions = reader.readLong(offsets[3]);
  object.totalAnswers = reader.readLong(offsets[4]);
  object.totalWrongAnswers = reader.readLong(offsets[5]);
  return object;
}

P _spacedRepetitionDataDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readDouble(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension SpacedRepetitionDataQueryFilter on QueryBuilder<SpacedRepetitionData,
    SpacedRepetitionData, QFilterCondition> {
  QueryBuilder<SpacedRepetitionData, SpacedRepetitionData,
      QAfterFilterCondition> dueDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'dueDate',
      ));
    });
  }

  QueryBuilder<SpacedRepetitionData, SpacedRepetitionData,
      QAfterFilterCondition> dueDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'dueDate',
      ));
    });
  }

  QueryBuilder<SpacedRepetitionData, SpacedRepetitionData,
      QAfterFilterCondition> dueDateEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dueDate',
        value: value,
      ));
    });
  }

  QueryBuilder<SpacedRepetitionData, SpacedRepetitionData,
      QAfterFilterCondition> dueDateGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dueDate',
        value: value,
      ));
    });
  }

  QueryBuilder<SpacedRepetitionData, SpacedRepetitionData,
      QAfterFilterCondition> dueDateLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dueDate',
        value: value,
      ));
    });
  }

  QueryBuilder<SpacedRepetitionData, SpacedRepetitionData,
      QAfterFilterCondition> dueDateBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dueDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SpacedRepetitionData, SpacedRepetitionData,
      QAfterFilterCondition> easeFactorEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'easeFactor',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SpacedRepetitionData, SpacedRepetitionData,
      QAfterFilterCondition> easeFactorGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'easeFactor',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SpacedRepetitionData, SpacedRepetitionData,
      QAfterFilterCondition> easeFactorLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'easeFactor',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SpacedRepetitionData, SpacedRepetitionData,
      QAfterFilterCondition> easeFactorBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'easeFactor',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SpacedRepetitionData, SpacedRepetitionData,
      QAfterFilterCondition> intervalEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'interval',
        value: value,
      ));
    });
  }

  QueryBuilder<SpacedRepetitionData, SpacedRepetitionData,
      QAfterFilterCondition> intervalGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'interval',
        value: value,
      ));
    });
  }

  QueryBuilder<SpacedRepetitionData, SpacedRepetitionData,
      QAfterFilterCondition> intervalLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'interval',
        value: value,
      ));
    });
  }

  QueryBuilder<SpacedRepetitionData, SpacedRepetitionData,
      QAfterFilterCondition> intervalBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'interval',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SpacedRepetitionData, SpacedRepetitionData,
      QAfterFilterCondition> repetitionsEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'repetitions',
        value: value,
      ));
    });
  }

  QueryBuilder<SpacedRepetitionData, SpacedRepetitionData,
      QAfterFilterCondition> repetitionsGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'repetitions',
        value: value,
      ));
    });
  }

  QueryBuilder<SpacedRepetitionData, SpacedRepetitionData,
      QAfterFilterCondition> repetitionsLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'repetitions',
        value: value,
      ));
    });
  }

  QueryBuilder<SpacedRepetitionData, SpacedRepetitionData,
      QAfterFilterCondition> repetitionsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'repetitions',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SpacedRepetitionData, SpacedRepetitionData,
      QAfterFilterCondition> totalAnswersEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalAnswers',
        value: value,
      ));
    });
  }

  QueryBuilder<SpacedRepetitionData, SpacedRepetitionData,
      QAfterFilterCondition> totalAnswersGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalAnswers',
        value: value,
      ));
    });
  }

  QueryBuilder<SpacedRepetitionData, SpacedRepetitionData,
      QAfterFilterCondition> totalAnswersLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalAnswers',
        value: value,
      ));
    });
  }

  QueryBuilder<SpacedRepetitionData, SpacedRepetitionData,
      QAfterFilterCondition> totalAnswersBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalAnswers',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SpacedRepetitionData, SpacedRepetitionData,
      QAfterFilterCondition> totalWrongAnswersEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalWrongAnswers',
        value: value,
      ));
    });
  }

  QueryBuilder<SpacedRepetitionData, SpacedRepetitionData,
      QAfterFilterCondition> totalWrongAnswersGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalWrongAnswers',
        value: value,
      ));
    });
  }

  QueryBuilder<SpacedRepetitionData, SpacedRepetitionData,
      QAfterFilterCondition> totalWrongAnswersLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalWrongAnswers',
        value: value,
      ));
    });
  }

  QueryBuilder<SpacedRepetitionData, SpacedRepetitionData,
      QAfterFilterCondition> totalWrongAnswersBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalWrongAnswers',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension SpacedRepetitionDataQueryObject on QueryBuilder<SpacedRepetitionData,
    SpacedRepetitionData, QFilterCondition> {}
