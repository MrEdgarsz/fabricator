import 'package:fabricator_builder/src/models/schema.dart';
import 'package:flutter/foundation.dart';

class EnumSchema extends Schema<String> {
  EnumSchema({
    super.required,
    super.defaultValue,
    super.description,
    required this.enumValues,
  }) : super();
  final List<String> enumValues;

  @override
  String toString() => 'OpenAPIEnumParameter(enumValues: $enumValues)';

  @override
  bool operator ==(covariant EnumSchema other) {
    if (identical(this, other)) return true;

    return listEquals(other.enumValues, enumValues);
  }

  @override
  int get hashCode => enumValues.hashCode;
}
