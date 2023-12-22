import 'package:fabricator_builder/src/models/types/parameter.dart';
import 'package:flutter/foundation.dart';

class IntegerParameter extends Parameter<int> {
  IntegerParameter({
    required super.name,
    super.required,
    super.defaultValue,
    super.description,
    this.minimum,
    this.maximum,
    this.enumValues,
    super.location,
  }) : super(
          type: 'integer',
        );
  final int? minimum;
  final int? maximum;
  final List<int>? enumValues;

  @override
  String toString() =>
      'IntegerParameter(minimum: $minimum, maximum: $maximum, enumValues: $enumValues)';

  @override
  bool operator ==(covariant IntegerParameter other) {
    if (identical(this, other)) return true;

    return other.minimum == minimum &&
        other.maximum == maximum &&
        listEquals(other.enumValues, enumValues);
  }

  @override
  int get hashCode => minimum.hashCode ^ maximum.hashCode ^ enumValues.hashCode;
}
