import 'package:fabricator_builder/src/models/types/parameter.dart';

class Model<T> {
  Model({
    required this.name,
    required this.properties,
    this.additionalProperties,
    this.description,
    this.example,
  });

  final String name;
  final Map<String, Parameter> properties;
  final bool? additionalProperties;
  final String? description;
  final T? example;
}
