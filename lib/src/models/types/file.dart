import 'dart:io';

import 'package:fabricator_builder/src/models/schema.dart';

class FileSchema extends Schema<File> {
  FileSchema({
    super.required,
    super.description,
    super.defaultValue,
  }) : super();
}
