import 'package:fabricator_builder/src/models/schema.dart';

class NumberSchema extends Schema<double> {
  NumberSchema({
    super.required,
    super.defaultValue,
    super.description,
    this.minimum,
    this.maximum,
  }) : super();

  final double? minimum;
  final double? maximum;

  @override
  String toString() => 'NumberParameter(minimum: $minimum, maximum: $maximum)';

  @override
  bool operator ==(covariant NumberSchema other) {
    if (identical(this, other)) return true;

    return other.minimum == minimum && other.maximum == maximum;
  }

  @override
  int get hashCode => minimum.hashCode ^ maximum.hashCode;
}
