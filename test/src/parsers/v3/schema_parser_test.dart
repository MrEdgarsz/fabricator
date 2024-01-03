import 'package:fabricator_builder/src/models/models.dart';
import 'package:fabricator_builder/src/parsers/v3/schema_parser.dart';
import 'package:test/test.dart';

void main() {
  group('SchemaParser', () {
    late SchemaParser schemaParser;

    setUp(() {
      schemaParser = SchemaParser();
    });

    test('should parse boolean schema', () {
      final schemaData = {
        'type': 'boolean',
        'required': true,
      };

      final schema = schemaParser.parse(schemaData);

      expect(schema, isA<BooleanSchema>());
      expect(schema.required, true);
    });

    test('should parse string schema', () {
      final schemaData = {
        'type': 'string',
        'required': true,
        'defaultValue': 'default value',
        'description': 'string description',
        'minLength': 1,
        'maxLength': 10,
        'pattern': r'^[a-zA-Z]+$',
      };

      final schema = schemaParser.parse(schemaData);

      expect(schema, isA<StringSchema>());
      expect(schema.required, true);
      expect(schema.defaultValue, 'default value');
      expect(schema.description, 'string description');
      expect((schema as StringSchema).minLength, 1);
      expect(schema.maxLength, 10);
      expect(schema.pattern, r'^[a-zA-Z]+$');
    });

    // Add more test cases for other schema types...
    test('should parse array schema', () {
      final schemaData = {
        'type': 'array',
        'required': true,
        'defaultValue': ['default value'],
        'description': 'string description',
        'items': {
          'type': 'string',
        },
      };

      final schema = schemaParser.parse(schemaData);

      expect(schema, isA<ArraySchema>());
      expect(schema.required, true);
      expect(schema.defaultValue, ['default value']);
      expect(schema.description, 'string description');
      expect((schema as ArraySchema).itemsType, isA<StringSchema>());
    });

    test('should parse object schema', () {
      final schemaData = {
        'type': 'object',
        'required': true,
        'defaultValue': {'name': 'default value', 'age': 10},
        'description': 'string description',
        'properties': {
          'name': {
            'type': 'string',
          },
          'age': {
            'type': 'integer',
          },
        },
      };

      final schema = schemaParser.parse(schemaData);

      expect(schema, isA<ObjectSchema>());
      expect(schema.required, true);
      expect(schema.defaultValue, {'name': 'default value', 'age': 10});
      expect(schema.description, 'string description');
      expect((schema as ObjectSchema).properties, isA<Map<String, Schema>>());
      expect(schema.properties['name'], isA<StringSchema>());
      expect(schema.properties['age'], isA<IntegerSchema>());
    });

    test('should parse number schema', () {
      final schemaData = {
        'type': 'number',
        'required': true,
        'defaultValue': 0.10,
        'description': 'string description',
      };

      final schema = schemaParser.parse(schemaData);

      expect(schema, isA<NumberSchema>());
      expect(schema.required, true);
      expect(schema.defaultValue, 0.10);
      expect(schema.description, 'string description');
    });
    test('should parse integer schema', () {
      final schemaData = {
        'type': 'integer',
        'required': true,
        'defaultValue': 1,
        'description': 'string description integer',
      };

      final schema = schemaParser.parse(schemaData);

      expect(schema, isA<IntegerSchema>());
      expect(schema.required, true);
      expect(schema.defaultValue, 1);
      expect(schema.description, 'string description integer');
    });

    test('should throw exception when schema type is not supported', () {
      final schemaData = {
        'type': 'unsupported',
      };

      expect(() => schemaParser.parse(schemaData), throwsException);
    });

    test('should throw exception when schema type is not defined', () {
      final schemaData = <String, dynamic>{};

      expect(() => schemaParser.parse(schemaData), throwsException);
    });

    test('should throw exception when schema type is null', () {
      final schemaData = {
        'type': null,
      };

      expect(() => schemaParser.parse(schemaData), throwsException);
    });

    test('should throw exception when schema type is not a string', () {
      final schemaData = {
        'type': 1,
      };

      expect(() => schemaParser.parse(schemaData), throwsException);
    });

    test('should throw exception when schema properties is not a map', () {
      final schemaData = {
        'type': 'object',
        'properties': 1,
      };

      expect(() => schemaParser.parse(schemaData), throwsException);
    });

    test('should throw exception when schema items is not a list', () {
      final schemaData = {
        'type': 'array',
        'items': 1,
      };

      expect(() => schemaParser.parse(schemaData), throwsException);
    });

    test('should throw exception when schema items is not a map', () {
      final schemaData = {
        'type': 'array',
        'items': [1],
      };

      expect(() => schemaParser.parse(schemaData), throwsException);
    });

    test('should throw exception when schema items is not defined', () {
      final schemaData = {
        'type': 'array',
        'items': null,
      };

      expect(() => schemaParser.parse(schemaData), throwsException);
    });

    test('should throw exception when schema items type is not defined', () {
      final schemaData = {
        'type': 'array',
        'items': {},
      };

      expect(() => schemaParser.parse(schemaData), throwsException);
    });

    test('should throw exception when schema items type is not a map', () {
      final schemaData = {
        'type': 'array',
        'items': {
          'type': 1,
        },
      };

      expect(() => schemaParser.parse(schemaData), throwsException);
    });

    test('should throw exception when schema properties is not defined', () {
      final schemaData = {
        'type': 'object',
        'properties': null,
      };

      expect(() => schemaParser.parse(schemaData), throwsException);
    });

    test('should throw exception when schema properties is empty', () {
      final schemaData = {
        'type': 'object',
        'properties': {},
      };

      expect(() => schemaParser.parse(schemaData), throwsException);
    });

    test('should throw exception when schema properties is not a map', () {
      final schemaData = {
        'type': 'object',
        'properties': {
          'name': 1,
        },
      };

      expect(() => schemaParser.parse(schemaData), throwsException);
    });

    test('should throw exception when schema properties is empty', () {
      final schemaData = {
        'type': 'object',
        'properties': {
          'name': {},
        },
      };

      expect(() => schemaParser.parse(schemaData), throwsException);
    });

    test('should throw exception when schema properties is not a map', () {
      final schemaData = {
        'type': 'object',
        'properties': {
          'name': {
            'type': 1,
          },
        },
      };

      expect(() => schemaParser.parse(schemaData), throwsException);
    });

    test('should throw exception when schema properties is not a map', () {
      final schemaData = {
        'type': 'object',
        'properties': {
          'name': {
            'type': 'string',
          },
          'age': {
            'type': 1,
          },
        },
      };

      expect(() => schemaParser.parse(schemaData), throwsException);
    });
  });
}
