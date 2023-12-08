// ignore_for_file: public_member_api_docs, sort_constructors_first
library fabricator;

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:fabricator_annotations/fabricator_annotations.dart';
import 'package:fabricator_builder/src/analyzers/source_file_analyzer.dart';
import 'package:source_gen/source_gen.dart';
import 'package:yaml/yaml.dart';

Builder fabricatorBuilder(BuilderOptions options) =>
    LibraryBuilder(FabricatorBuilder(), generatedExtension: '.fabricator.dart');

class FabricatorBuilder extends GeneratorForAnnotation<FabricatorClient> {
  @override
  Future<String> generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) async {
    if (element is! ClassElement) {
      throw InvalidGenerationSourceError(
          'Generator can only be applied to classes annotated with FabricatorClient.',
          element: element);
    }
    //check if the source file is valid
    final String sourceFileContent =
        await buildStep.readAsString(buildStep.inputId);
    final String sourceFileName = buildStep.inputId.path.split('/').last;

    //analyze the source file
    final sourceFileAnalyzer = SourceFileAnalyzer();
    final sourceFileAnalysisResult = await sourceFileAnalyzer.analyzeContent(
        sourceFileContent, sourceFileName.split(".").first);
    if (sourceFileAnalysisResult.isError()) {
      throw sourceFileAnalysisResult.exceptionOrNull() ??
          InvalidGenerationSourceError("Unknown error occurred");
    }

    final yamlPath = annotation.read('apiDocPath').stringValue;
    final yamlDocument = await buildStep.readAsString(AssetId(
      buildStep.inputId.package,
      yamlPath,
    ));
    final YamlMap yamlContent = loadYaml(yamlDocument);
    final targetFileContent = StringBuffer();

    targetFileContent.writeln('// ignore_for_file: invalid_annotation_target');
    //make target file a part of the source file
    targetFileContent.writeln('part of \'$sourceFileName\';');

    targetFileContent.writeln(_createModels(sourceFileName, yamlContent));

    return targetFileContent.toString();
  }

  String _createModels(String sourceFileName, YamlMap yamlContent) {
    final models = <String, dynamic>{};
    final components = yamlContent['components'];
    if (components != null) {
      final schemas = components['schemas'];
      if (schemas != null) {
        models.addAll(Map<String, dynamic>.from(schemas));
      }
    }

    final StringBuffer modelsContent = StringBuffer();

    for (var model in models.entries) {
      //data class from freezed
      final StringBuffer modelClassContent = StringBuffer();
      modelClassContent.writeln('@freezed');
      modelClassContent
          .writeln('abstract class ${model.key} with _\$${model.key} {');
      modelClassContent.writeln('const factory ${model.key}({');
      final properties = model.value['properties'];
      if (properties != null) {
        for (var property in properties.entries) {
          modelClassContent.writeln('@JsonKey(name: \'${property.key}\')');

          //check if property type isn't referencing another model
          if (property.value['\$ref'] == null) {
            modelClassContent.writeln(
                'required ${_mapToDartType(property.value['type'])} ${property.key},');
          } else {
            //if it is referencing another model, use that model as type
            final ref = property.value['\$ref'].toString().split('/').last;
            modelClassContent.writeln('required $ref ${property.key},');
          }
        }
      }
      modelClassContent.writeln('}) = _${model.key};');
      //add fromJson factory
      modelClassContent.writeln(
          'factory ${model.key}.fromJson(Map<String, dynamic> json) => _\$${model.key}FromJson(json);');
      modelClassContent.writeln('}\n');
      modelsContent.writeln(modelClassContent.toString());
    }
    //write freezed classes to file
    return modelsContent.toString();
  }

  _mapToDartType(String value) {
    //maps all yaml types to dart types
    final typeMap = <String, String>{
      'string': 'String',
      'integer': 'int',
      'number': 'double',
      'boolean': 'bool',
      'array': 'List',
      'object': 'Map<String, dynamic>',
    };
    return typeMap[value] ?? value;
  }
}
