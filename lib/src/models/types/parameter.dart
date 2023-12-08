abstract class Parameter {
  Parameter({
    required this.name,
    required this.type,
    this.required = false,
    this.defaultValue,
    this.description,
  });
  final String name;
  final String type;
  final bool required;
  final dynamic defaultValue;
  final String? description;

  @override
  String toString() {
    return 'Parameter(name: $name, type: $type, required: $required, defaultValue: $defaultValue, description: $description)';
  }

  @override
  bool operator ==(covariant Parameter other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.type == type &&
        other.required == required &&
        other.defaultValue == defaultValue &&
        other.description == description;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        type.hashCode ^
        required.hashCode ^
        defaultValue.hashCode ^
        description.hashCode;
  }
}