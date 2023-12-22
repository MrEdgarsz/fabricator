import 'package:fabricator_builder/src/models/types/parameter.dart';

class RefParameter extends Parameter {
  RefParameter({
    required super.name,
    super.required,
    super.description,
    required this.ref,
    super.location,
  }) : super(
          type: 'ref',
        );

  final String ref;
}
