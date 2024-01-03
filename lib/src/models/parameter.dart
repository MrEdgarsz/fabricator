import 'package:fabricator_builder/src/models/models.dart';

class Parameter {
  Parameter(this.name, this.location, this.required, this.schema);

  final String name;
  final String location; // 'query', 'path', 'header', 'cookie'
  final bool required;
  final Schema schema;

  @override
  bool operator ==(covariant Parameter other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.location == location &&
        other.required == required &&
        other.schema == schema;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        location.hashCode ^
        required.hashCode ^
        schema.hashCode;
  }

  @override
  String toString() {
    return 'Parameter(name: $name, location: $location, required: $required, schema: $schema)';
  }
}
