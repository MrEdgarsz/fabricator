import 'package:fabricator_builder/src/models/exceptions/fabricator_exception.dart';
import 'package:fabricator_builder/src/models/types/types.dart';
import 'package:fabricator_builder/src/parsers/v3_0_2/parameter_parser.dart';
import 'package:test/test.dart';

void main() {
  group('ParameterParser Tests', () {
    late ParameterParser parser;

    setUp(() {
      parser = ParameterParser();
    });

    test('Should correctly parse BooleanParameter', () {
      final paramData = {
        'name': 'exampleBoolean',
        'in': 'query',
        'type': 'boolean',
        'required': false,
      };

      final parameter = parser.parse(paramData);
      expect(parameter, isA<BooleanParameter>());
      expect(parameter.name, equals('exampleBoolean'));
      expect(parameter.type, equals('boolean'));
    });

    test('Should correctly parse StringParameter', () {
      final paramData = {
        'name': 'exampleString',
        'in': 'query',
        'type': 'string',
        'required': true,
      };

      final parameter = parser.parse(paramData);
      expect(parameter, isA<StringParameter>());
      expect(parameter.name, equals('exampleString'));
      expect(parameter.type, equals('string'));
    });

    test('Should correctly parse IntegerParameter', () {
      final paramData = {
        'name': 'exampleInteger',
        'in': 'query',
        'type': 'integer',
        'required': true,
      };

      final parameter = parser.parse(paramData);
      expect(parameter, isA<IntegerParameter>());
      expect(parameter.name, equals('exampleInteger'));
      expect(parameter.type, equals('integer'));
    });

    test('Should correctly parse NumberParameter', () {
      final paramData = {
        'name': 'exampleNumber',
        'in': 'query',
        'type': 'number',
        'required': true,
      };

      final parameter = parser.parse(paramData);
      expect(parameter, isA<NumberParameter>());
      expect(parameter.name, equals('exampleNumber'));
      expect(parameter.type, equals('number'));
    });

    test('Should correctly parse ArrayParameter', () {
      final paramData = {
        'name': 'exampleArray',
        'in': 'query',
        'type': 'array',
        'required': true,
        'items': {
          'name': 'exampleString',
          'in': 'query',
          'type': 'string',
          'required': true,
        },
      };

      final parameter = parser.parse(paramData);
      expect(parameter, isA<ArrayParameter>());
      expect(parameter.name, equals('exampleArray'));
      expect(parameter.type, equals('array'));
    });

    test('Should correctly parse ObjectParameter', () {
      final paramData = {
        'name': 'exampleObject',
        'in': 'query',
        'type': 'object',
        'required': true,
        'properties': {
          'property1': {'type': 'string'},
        },
      };

      final parameter = parser.parse(paramData);
      expect(parameter, isA<ObjectParameter>());
      expect(parameter.name, equals('exampleObject'));
      expect(parameter.type, equals('object'));
    });

    test('Should correctly parse EnumParameter', () {
      final paramData = {
        'name': 'exampleEnum',
        'in': 'query',
        'type': 'string',
        'required': true,
        'enum': ['value1', 'value2', 'value3'],
      };

      final parameter = parser.parse(paramData);
      expect(parameter, isA<EnumParameter>());
      expect(parameter.name, equals('exampleEnum'));
      expect(parameter.type, equals('string'));
    });

    test('Should correctly parse FileParameter', () {
      final paramData = {
        'name': 'exampleFile',
        'in': 'formData',
        'type': 'file',
        'required': true,
      };

      final parameter = parser.parse(paramData);
      expect(parameter, isA<FileParameter>());
      expect(parameter.name, equals('exampleFile'));
      expect(parameter.type, equals('file'));
    });

    test('Should correctly parse StringParameter with additional attributes',
        () {
      final paramData = {
        'name': 'exampleString',
        'in': 'query',
        'type': 'string',
        'required': true,
        'defaultValue': 'default',
        'description': 'A string parameter',
        'minLength': 3,
        'maxLength': 10,
        'pattern': r'^[a-zA-Z]+$',
      };

      final parameter = parser.parse(paramData) as StringParameter;
      expect(parameter, isA<StringParameter>());

      expect(parameter.minLength, equals(3));
      expect(parameter.maxLength, equals(10));
      expect(parameter.pattern, equals(r'^[a-zA-Z]+$'));
    });

    test('Should correctly parse IntegerParameter with range', () {
      final paramData = {
        'name': 'exampleInteger',
        'in': 'query',
        'type': 'integer',
        'required': true,
        'minimum': 1,
        'maximum': 100,
      };

      final parameter = parser.parse(paramData) as IntegerParameter;
      expect(parameter, isA<IntegerParameter>());
      expect(parameter.minimum, equals(1));
      expect(parameter.maximum, equals(100));
    });

    test('Should correctly parse ArrayParameter with specific item type', () {
      final paramData = {
        'name': 'exampleArray',
        'in': 'query',
        'type': 'array',
        'items': {'type': 'integer'},
      };

      final parameter = parser.parse(paramData) as ArrayParameter;
      expect(parameter, isA<ArrayParameter>());
      expect(parameter.itemsType, isA<IntegerParameter>());
    });

    test('Should handle EnumParameter with invalid enum values', () {
      final paramData = {
        'name': 'exampleEnum',
        'in': 'query',
        'type': 'string',
        'enum': ['value1', 123, 'value3'],
      };

      expect(
        () => parser.parse(paramData),
        throwsA(isA<FabricatorException>()),
      );
    });

    test('Should correctly parse ObjectParameter with nested objects', () {
      final paramData = {
        'name': 'exampleObject',
        'in': 'query',
        'type': 'object',
        'properties': {
          'nestedObject': {
            'type': 'object',
            'properties': {
              'nestedProperty': {'type': 'string'},
            },
          },
        },
      };

      final parameter = parser.parse(paramData) as ObjectParameter;
      expect(parameter, isA<ObjectParameter>());
      expect(parameter.properties['nestedObject'], isA<ObjectParameter>());
      expect(
        (parameter.properties['nestedObject'] as ObjectParameter?)!
            .properties['nestedProperty'],
        isA<StringParameter>(),
      );
    });

    test('Should correctly parse FileParameter with additional attributes', () {
      final paramData = {
        'name': 'exampleFile',
        'in': 'formData',
        'type': 'file',
        'required': true,
        'description': 'A file parameter',
      };

      final parameter = parser.parse(paramData) as FileParameter;
      expect(parameter, isA<FileParameter>());
      expect(parameter.description, equals('A file parameter'));
    });
  });
}
