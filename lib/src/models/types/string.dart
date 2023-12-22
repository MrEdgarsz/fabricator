import 'package:fabricator_builder/src/models/types/parameter.dart';
import 'package:flutter/foundation.dart';

class StringParameter extends Parameter {
  StringParameter({
    required super.name,
    super.required,
    String? super.defaultValue,
    super.description,
    this.minLength,
    this.maxLength,
    this.pattern,
    this.enumValues,
    super.location,
  }) : super(
          type: 'string',
        );
  final int? minLength;
  final int? maxLength;
  final String? pattern;
  final List<String>? enumValues;

  @override
  String toString() {
    return 'OpenAPIStringParameter(minLength: $minLength, maxLength: $maxLength, pattern: $pattern, enumValues: $enumValues)';
  }

  @override
  bool operator ==(covariant StringParameter other) {
    if (identical(this, other)) return true;

    return other.minLength == minLength &&
        other.maxLength == maxLength &&
        other.pattern == pattern &&
        listEquals(other.enumValues, enumValues);
  }

  @override
  int get hashCode {
    return minLength.hashCode ^
        maxLength.hashCode ^
        pattern.hashCode ^
        enumValues.hashCode;
  }
}
