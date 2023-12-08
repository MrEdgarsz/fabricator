import 'package:fabricator_builder/src/models/types/parameter.dart';

class BooleanParameter extends Parameter {
  BooleanParameter({
    required super.name,
    super.required,
    bool? super.defaultValue,
    super.description,
  }) : super(
          type: 'boolean',
        );
}
