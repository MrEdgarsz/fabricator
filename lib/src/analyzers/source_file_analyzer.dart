import 'package:fabricator_builder/src/utils/file_path_parser.dart';
import 'package:result_dart/result_dart.dart';
import 'package:source_gen/source_gen.dart';

///Analyzes the source file to make sure that the source file has valid annotations, imports and part statements
class SourceFileAnalyzer {
  Future<Result<Unit, InvalidGenerationSourceError>> analyzeContent(
      String sourceFileContent, String filePath) async {
    List<String> errorMessages = [];
    final filenameWithoutExtension =
        FilePathParser.getFilenameWithoutExtension(filePath);
    final filename = FilePathParser.getFilename(filePath);
    //check if the source file has import statements for freezed and fabricator and json_annotation
    if (!sourceFileContent.contains(
        'import \'package:freezed_annotation/freezed_annotation.dart\';')) {
      errorMessages.add(
          'import \'package:freezed_annotation/freezed_annotation.dart\';');
    }
    if (!sourceFileContent.contains(
        'import \'package:fabricator_annotations/fabricator_annotations.dart\';')) {
      errorMessages.add(
          'import \'package:fabricator_annotations/fabricator_annotations.dart\';');
    }
    if (!sourceFileContent
        .contains('import \'package:json_annotation/json_annotation.dart\';')) {
      errorMessages
          .add('import \'package:json_annotation/json_annotation.dart\';');
    }
    //check if the source file has part statement for freezed, fabricator and g.dart fille
    if (!sourceFileContent
        .contains('part \'$filenameWithoutExtension.freezed.dart\'')) {
      errorMessages.add('part \'$filenameWithoutExtension.freezed.dart\'');
    }
    if (!sourceFileContent
        .contains('part \'$filenameWithoutExtension.g.dart\'')) {
      errorMessages.add('part \'$filenameWithoutExtension.g.dart\'');
    }
    if (!sourceFileContent
        .contains('part \'$filenameWithoutExtension.fabricator.dart\'')) {
      errorMessages.add('part \'$filenameWithoutExtension.fabricator.dart\'');
    }
    if (errorMessages.isNotEmpty) {
      return Result.failure(
        InvalidGenerationSourceError(
            'The source file ($filename) is missing the following statements: \n${errorMessages.join('\n')}'),
      );
    }
    return Result.success(unit);
  }
}
