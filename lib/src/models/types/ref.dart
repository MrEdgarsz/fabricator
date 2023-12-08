import 'package:fabricator_builder/src/models/types/parameter.dart';

class OpenAPIRefParameter extends Parameter {
  OpenAPIRefParameter({
    required super.name,
    super.required,
    super.description,
    required this.ref,
  }) : super(
          type: 'ref',
        );

  final String ref;
}
