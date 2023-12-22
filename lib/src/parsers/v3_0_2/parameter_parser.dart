import 'package:fabricator_builder/src/models/exceptions/fabricator_exception.dart';
import 'package:fabricator_builder/src/models/types/types.dart';
import 'package:fabricator_builder/src/parsers/interfaces/parameter_parser_interface.dart';

/// A parser for handling different types of parameters based on OpenAPI 3.0.2 specification.
class ParameterParser implements IParameterParser {
  @override
  // TODO: implement supportedVersion
  String get supportedVersion => throw UnimplementedError();

  /// Parses the given parameter data into the appropriate parameter type.
  ///
  /// Throws [FabricatorException] if the parameter type is unsupported or if required fields are missing.
  @override
  Parameter parse(Map<String, dynamic> paramData) {
    final String type = paramData['type'];
    switch (type) {
      case 'boolean':
        return _boolean(paramData);
      case 'string':
        return _string(paramData);
      case 'integer':
        return _integer(paramData);
      case 'number':
        return _number(paramData);
      case 'array':
        return _array(paramData);
      case 'object':
        return _object(paramData);
      case 'enum':
        return _enum(paramData);
      case 'file':
        return _file(paramData);
      default:
        throw FabricatorException('Unsupported parameter type: $type');
    }
  }

  BooleanParameter _boolean(Map<String, dynamic> paramData) {
    _validateRequiredFields(paramData, ['name', 'in', 'type']);
    return BooleanParameter(
      name: paramData['name'],
      required: paramData['required'] ?? false,
    );
  }

  StringParameter _string(Map<String, dynamic> paramData) {
    _validateRequiredFields(paramData, ['name', 'in', 'type']);
    return StringParameter(
      name: paramData['name'],
      required: paramData['required'] ?? false,
      defaultValue: paramData['defaultValue'],
      description: paramData['description'],
      minLength: paramData['minLength'],
      maxLength: paramData['maxLength'],
      pattern: paramData['pattern'],
    );
  }

  IntegerParameter _integer(Map<String, dynamic> paramData) {
    _validateRequiredFields(paramData, ['name', 'in', 'type']);
    return IntegerParameter(
      name: paramData['name'],
      required: paramData['required'] ?? false,
      minimum: paramData['minimum'],
      maximum: paramData['maximum'],
    );
  }

  NumberParameter _number(Map<String, dynamic> paramData) {
    _validateRequiredFields(paramData, ['name', 'in', 'type']);
    return NumberParameter(
      name: paramData['name'],
      required: paramData['required'] ?? false,
    );
  }

  ArrayParameter _array(Map<String, dynamic> paramData) {
    _validateRequiredFields(paramData, ['name', 'in', 'type', 'items']);
    final itemsType = parse(paramData['items']);
    return ArrayParameter(
      name: paramData['name'],
      required: paramData['required'] ?? false,
      itemsType: itemsType,
    );
  }

  ObjectParameter _object(Map<String, dynamic> paramData) {
    _validateRequiredFields(paramData, ['name', 'in', 'type', 'properties']);
    final properties = Map.from(paramData['properties'])
        .map((key, value) => MapEntry<String, Parameter>(key, parse(value)));
    return ObjectParameter(
      name: paramData['name'],
      required: paramData['required'] ?? false,
      properties: properties,
    );
  }

  EnumParameter _enum(Map<String, dynamic> paramData) {
    _validateRequiredFields(paramData, ['name', 'in', 'type', 'enum']);
    if (paramData['enum'].any((value) => value.runtimeType != String)) {
      throw const FabricatorException('Invalid enum value type');
    }
    return EnumParameter(
      name: paramData['name'],
      type: paramData['type'],
      required: paramData['required'] ?? false,
      enumValues: List<String>.from(paramData['enum']),
    );
  }

  FileParameter _file(Map<String, dynamic> paramData) {
    _validateRequiredFields(paramData, ['name', 'in', 'type']);
    return FileParameter(
      name: paramData['name'],
      required: paramData['required'] ?? false,
      description: paramData['description'],
    );
  }

  /// Validates that all required fields are present in the parameter data.
  ///
  /// Throws [FabricatorException] if any required field is missing.
  void _validateRequiredFields(
    Map<String, dynamic> paramData,
    List<String> requiredFields,
  ) {
    for (final field in requiredFields) {
      if (!paramData.containsKey(field) || paramData[field] == null) {
        throw FabricatorException('Missing required field: $field');
      }
    }
  }
}
