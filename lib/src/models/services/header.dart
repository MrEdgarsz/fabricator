import 'package:fabricator_builder/src/models/schema.dart';
import 'package:flutter/foundation.dart';

class Header {
  Header({
    required this.name,
    required this.description,
    this.schema,
    this.required = true,
    this.example,
  });

  final String name;
  final String description;
  final Schema? schema;
  final bool required;
  final Map<String, dynamic>? example;

  Header copyWith({
    String? name,
    String? description,
    Schema? schema,
    bool? required,
    Map<String, dynamic>? example,
  }) {
    return Header(
      name: name ?? this.name,
      description: description ?? this.description,
      schema: schema ?? this.schema,
      required: required ?? this.required,
      example: example ?? this.example,
    );
  }

  @override
  String toString() {
    return 'Header(name: $name, description: $description, schema: $schema, required: $required, example: $example)';
  }

  @override
  bool operator ==(covariant Header other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.description == description &&
        other.schema == schema &&
        other.required == required &&
        mapEquals(other.example, example);
  }

  @override
  int get hashCode {
    return name.hashCode ^
        description.hashCode ^
        schema.hashCode ^
        required.hashCode ^
        example.hashCode;
  }
}
