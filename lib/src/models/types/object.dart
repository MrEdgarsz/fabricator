import 'package:fabricator_builder/src/models/schema.dart';

class ObjectSchema extends Schema<Map<String, dynamic>> {
  ObjectSchema({
    super.required,
    super.description,
    required this.properties,
    super.defaultValue,
  }) : super();

  final Map<String, Schema> properties;
}
