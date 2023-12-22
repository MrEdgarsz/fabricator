import 'package:fabricator_builder/src/models/types/parameter.dart';

class FileParameter extends Parameter {
  FileParameter({
    required super.name,
    super.required,
    super.description,
    super.location,
  }) : super(
          type: 'file',
        );
}
