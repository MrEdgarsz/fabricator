import 'package:fabricator_builder/src/models/models.dart';
import 'package:fabricator_builder/src/parsers/interfaces/schema_parser_interface.dart';

/// A parser for handling different types of schemas based on OpenAPI 3.0.2 specification.
class SchemaParser implements ISchemaParser {
  @override
  // TODO(edgar): implement supportedVersion
  String get supportedVersion => throw UnimplementedError();

  /// Parses the given schema data into the appropriate schema type.
  ///
  /// Throws [FabricatorException] if the schema type is unsupported or if required fields are missing.
  @override
  Schema parse(
    Map<String, dynamic> schemaData,
  ) {
    _validateRequiredFields(schemaData);
    if (schemaData['\$ref'] != null) {
      return RefSchema(
        required: schemaData['required'] ?? false,
        ref: schemaData['\$ref'],
        description: schemaData['description'],
      );
    }
    if (schemaData['enum'] != null) {
      return _enum(schemaData);
    }
    final type = schemaData['type'];
    switch (type) {
      case 'boolean':
        return _boolean(schemaData);
      case 'string':
        return _string(schemaData);
      case 'integer':
        return _integer(schemaData);
      case 'number':
        return _number(schemaData);
      case 'array':
        return _array(schemaData);
      case 'object':
        return _object(schemaData);
      case 'file':
        return _file(schemaData);
      default:
        throw FabricatorException('Unsupported schema type: $type');
    }
  }

  BooleanSchema _boolean(Map<String, dynamic> schemaData) {
    return BooleanSchema(
      required: schemaData['required'] ?? false,
      defaultValue: schemaData['defaultValue'],
      description: schemaData['description'],
    );
  }

  StringSchema _string(Map<String, dynamic> schemaData) {
    return StringSchema(
      required: schemaData['required'] ?? false,
      defaultValue: schemaData['defaultValue'],
      description: schemaData['description'],
      minLength: schemaData['minLength'],
      maxLength: schemaData['maxLength'],
      pattern: schemaData['pattern'],
    );
  }

  IntegerSchema _integer(Map<String, dynamic> schemaData) {
    return IntegerSchema(
      required: schemaData['required'] ?? false,
      minimum: schemaData['minimum'],
      maximum: schemaData['maximum'],
      defaultValue: schemaData['defaultValue'],
      description: schemaData['description'],
    );
  }

  NumberSchema _number(Map<String, dynamic> schemaData) {
    return NumberSchema(
      required: schemaData['required'] ?? false,
      minimum: schemaData['minimum'],
      maximum: schemaData['maximum'],
      defaultValue: schemaData['defaultValue'],
      description: schemaData['description'],
    );
  }

  ArraySchema _array(Map<String, dynamic> schemaData) {
    if (schemaData['items'] == null) {
      throw const FabricatorException('Missing items');
    }
    if (schemaData['items'] is! Map) {
      throw const FabricatorException('Items must be a map');
    }
    if (schemaData['items'].isEmpty) {
      throw const FabricatorException('Items must not be empty');
    }
    final itemsType = parse(schemaData['items']);
    return ArraySchema(
      description: schemaData['description'],
      defaultValue: schemaData['defaultValue'],
      required: schemaData['required'] ?? false,
      itemsType: itemsType,
      maxItems: schemaData['maxItems'],
      minItems: schemaData['minItems'],
      uniqueItems: schemaData['uniqueItems'],
      explode: schemaData['explode'] ?? false,
    );
  }

  ObjectSchema _object(Map<String, dynamic> schemaData) {
    final Map<String, Schema> properties = {};
    if (schemaData['properties'] == null) {
      throw const FabricatorException('Missing properties');
    }
    if (schemaData['properties'] is! Map) {
      throw const FabricatorException('Properties must be a map');
    }
    if (schemaData['properties'].isEmpty) {
      throw const FabricatorException('Properties must not be empty');
    }
    for (final key in schemaData['properties'].keys) {
      final property = schemaData['properties'][key];
      if (property is! Map<String, dynamic>) {
        throw const FabricatorException('Property must be a map');
      }
      if (property.isEmpty) {
        throw const FabricatorException('Property must not be empty');
      }
      properties[key] = parse(property);
    }
    return ObjectSchema(
      required: schemaData['required'] ?? false,
      properties: properties,
      defaultValue: schemaData['defaultValue'],
      description: schemaData['description'],
    );
  }

  EnumSchema _enum(Map<String, dynamic> schemaData) {
    return EnumSchema(
      required: schemaData['required'] ?? false,
      enumValues: List<String>.from(schemaData['enum']),
      description: schemaData['description'],
      defaultValue: schemaData['defaultValue'],
    );
  }

  FileSchema _file(Map<String, dynamic> schemaData) {
    return FileSchema(
      required: schemaData['required'] ?? false,
      description: schemaData['description'],
      defaultValue: schemaData['defaultValue'],
    );
  }

  /// Validates that all required fields are present in the schema data.
  ///
  /// Throws [FabricatorException] if any required field is missing.
  void _validateRequiredFields(Map<String, dynamic> schemaData) {
    if (schemaData['type'] == null && schemaData['\$ref'] == null) {
      throw const FabricatorException('Missing schema type or \$ref');
    }
  }
}
