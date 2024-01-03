import 'package:fabricator_builder/src/models/models.dart';

class MediaType {
  MediaType(this.schema, this.example);
  final Schema schema;
  final Object? example;

  @override
  bool operator ==(covariant MediaType other) {
    if (identical(this, other)) return true;

    return other.schema == schema && other.example == example;
  }

  @override
  int get hashCode => schema.hashCode ^ example.hashCode;

  @override
  String toString() => 'MediaType(schema: $schema, example: $example)';
}
