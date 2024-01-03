import 'package:fabricator_builder/src/parsers/parsers.dart';
import 'package:test/test.dart';

void main() {
  final schemaParser = SchemaParser();
  final headerParser = HeaderParser(schemaParser);
  group('HeaderParser', () {
    test('should parse OpenAPI header correctly', () {
      // Mock JSON object
      final headerJson = {
        'X-Request-ID': {
          'description': 'unique request id',
          'required': true,
          'style': 'simple',
          'schema': {
            'type': 'string',
            'format': 'uuid',
          },
        },
      };

      // Parse the header
      final header = headerParser.parse(headerJson);

      // Check the parsed header
      expect(header.name, equals('X-Request-ID'));
      expect(header.description, equals('unique request id'));
      expect(header.required, equals(true));
    });

    test('should throw an exception if header description is null', () {
      // Mock JSON object
      final headerJson = {
        'X-Request-ID': {
          'required': true,
          'style': 'simple',
          'schema': {
            'type': 'string',
            'format': 'uuid',
          },
        },
      };

      // Parse the header
      expect(() => headerParser.parse(headerJson), throwsException);
    });

    test('should default required to true if not specified', () {
      // Mock JSON object
      final headerJson = {
        'X-Request-ID': {
          'description': 'unique request id',
          'style': 'simple',
          'schema': {
            'type': 'string',
            'format': 'uuid',
          },
        },
      };

      // Parse the header
      final header = headerParser.parse(headerJson);

      // Check the parsed header
      expect(header.required, equals(true));
    });
  });
}
