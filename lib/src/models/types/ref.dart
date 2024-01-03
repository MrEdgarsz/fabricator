import 'package:fabricator_builder/src/models/schema.dart';

class RefSchema extends Schema {
  RefSchema({
    super.required,
    super.description,
    required this.ref,
  }) : super();

  final String ref;
}
