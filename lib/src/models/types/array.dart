import 'package:fabricator_builder/src/models/schema.dart';

class ArraySchema extends Schema<List<dynamic>> {
  ArraySchema({
    super.required,
    super.description,
    required this.itemsType,
    this.minItems,
    this.maxItems,
    this.uniqueItems,
    super.defaultValue,
    this.explode = false,
  }) : super();

  final Schema itemsType;
  final int? minItems;
  final int? maxItems;
  final bool? uniqueItems;
  final bool explode;

  @override
  String toString() {
    return 'OpenAPIArrayParameter(itemsType: $itemsType, minItems: $minItems, maxItems: $maxItems, uniqueItems: $uniqueItems)';
  }

  @override
  bool operator ==(covariant ArraySchema other) {
    if (identical(this, other)) return true;

    return other.itemsType == itemsType &&
        other.minItems == minItems &&
        other.maxItems == maxItems &&
        other.uniqueItems == uniqueItems;
  }

  @override
  int get hashCode {
    return itemsType.hashCode ^
        minItems.hashCode ^
        maxItems.hashCode ^
        uniqueItems.hashCode;
  }
}
