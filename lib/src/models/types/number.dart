import 'package:fabricator_builder/src/models/types/parameter.dart';
import 'package:flutter/foundation.dart';

class NumberParameter extends Parameter<double> {
  NumberParameter({
    required super.name,
    super.required,
    super.defaultValue,
    super.description,
    this.minimum,
    this.maximum,
    this.enumValues,
    super.location,
  }) : super(
          type: 'number',
        );

  final double? minimum;
  final double? maximum;
  final List<double>? enumValues;

  @override
  String toString() =>
      'NumberParameter(minimum: $minimum, maximum: $maximum, enumValues: $enumValues)';

  @override
  bool operator ==(covariant NumberParameter other) {
    if (identical(this, other)) return true;

    return other.minimum == minimum &&
        other.maximum == maximum &&
        listEquals(other.enumValues, enumValues);
  }

  @override
  int get hashCode => minimum.hashCode ^ maximum.hashCode ^ enumValues.hashCode;
}
