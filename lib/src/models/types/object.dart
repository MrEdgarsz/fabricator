import 'package:fabricator_builder/src/models/types/parameter.dart';

class ObjectParameter extends Parameter<Map<String, dynamic>> {
  ObjectParameter({
    required super.name,
    super.required,
    super.description,
    required this.properties,
    super.location,
    super.defaultValue,
  }) : super(
          type: 'object',
        );

  final Map<String, Parameter> properties;
}
