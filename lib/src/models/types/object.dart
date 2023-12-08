import 'package:fabricator_builder/src/models/types/parameter.dart';

class ObjectParameter extends Parameter {
  ObjectParameter({
    required super.name,
    super.required,
    super.description,
    required this.properties,
    this.additionalProperties,
  }) : super(
          type: 'object',
        );

  final Map<String, Parameter> properties;
  final bool? additionalProperties;
}
