import 'package:fabricator_builder/src/models/types/parameter.dart';

class BooleanParameter extends Parameter<bool> {
  BooleanParameter({
    required super.name,
    super.required,
    super.defaultValue,
    super.description,
    super.location,
  }) : super(
          type: 'boolean',
        );
}
