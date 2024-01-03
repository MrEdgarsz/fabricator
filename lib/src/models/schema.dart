abstract class Schema<T> {
  Schema({
    this.required = false,
    this.defaultValue,
    this.description,
  });

  final bool required;
  final T? defaultValue;
  final String? description;

  @override
  String toString() {
    return 'Schema( required: $required, defaultValue: $defaultValue, description: $description)';
  }

  @override
  bool operator ==(covariant Schema other) {
    if (identical(this, other)) return true;

    return other.required == required &&
        other.defaultValue == defaultValue &&
        other.description == description;
  }

  @override
  int get hashCode {
    return required.hashCode ^ defaultValue.hashCode ^ description.hashCode;
  }
}
