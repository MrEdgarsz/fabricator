import 'package:fabricator_builder/src/models/types/parameter.dart';

class ArrayParameter extends Parameter {
  ArrayParameter({
    required super.name,
    super.required,
    super.description,
    required this.itemsType,
    this.minItems,
    this.maxItems,
    this.uniqueItems,
  }) : super(
          type: 'array',
        );

  final Parameter itemsType;
  final int? minItems;
  final int? maxItems;
  final bool? uniqueItems;

  @override
  String toString() {
    return 'OpenAPIArrayParameter(itemsType: $itemsType, minItems: $minItems, maxItems: $maxItems, uniqueItems: $uniqueItems)';
  }

  @override
  bool operator ==(covariant ArrayParameter other) {
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
