import 'package:fabricator_builder/src/models/types/parameter.dart';
import 'package:flutter/foundation.dart';

class EnumParameter extends Parameter {
  EnumParameter({
    required super.name,
    required super.type,
    super.required,
    super.defaultValue,
    super.description,
    required this.enumValues,
  });
  final List<dynamic> enumValues;

  @override
  String toString() => 'OpenAPIEnumParameter(enumValues: $enumValues)';

  @override
  bool operator ==(covariant EnumParameter other) {
    if (identical(this, other)) return true;

    return listEquals(other.enumValues, enumValues);
  }

  @override
  int get hashCode => enumValues.hashCode;
}
