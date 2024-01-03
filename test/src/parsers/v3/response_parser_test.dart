import 'package:fabricator_builder/src/parsers/parsers.dart';
import 'package:test/test.dart';

void main() {
  group('ResponseParser', () {
    late ResponseParser responseParser;
    late SchemaParser schemaParser;
    late HeaderParser headerParser;

    setUp(() {
      schemaParser = SchemaParser();
      headerParser = HeaderParser(schemaParser);
      responseParser = ResponseParser(
        schemaParser: schemaParser,
        headerParser: headerParser,
      );
    });

    test('parse should return a valid Response object', () {
      final data = {
        '200': {
          'description': 'OK',
          'content': {
            'application/json': {},
          },
          'headers': {
            'Content-Type': {
              'description': 'The content type of the response body.',
              'schema': {
                'type': 'string',
              },
            },
          },
          'example': {
            'Content-Type': 'application/json',
          },
        },
      };

      final response = responseParser.parse(data);

      expect(response.statusCode, '200');
      expect(response.description, 'OK');
      expect(response.content, isNull);
      expect(response.headers, hasLength(1));
      expect(response.example, isNotNull);
    });

    test('parse should throw an exception if response description is missing',
        () {
      final data = {
        '200': {
          'content': {
            'application/json': {},
          },
        },
      };

      expect(() => responseParser.parse(data), throwsException);
    });
  });
}
