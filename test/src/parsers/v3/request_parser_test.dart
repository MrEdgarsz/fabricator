import 'package:fabricator_builder/src/parsers/parsers.dart';
import 'package:test/test.dart';

void main() {
  group('RequestParser', () {
    late RequestParser requestParser;
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
      requestParser = RequestParser(
        responseParser,
        schemaParser,
      );
    });

    test('parse should return a valid Request object', () {
      final requestData = {
        'path': '/api/users',
        'method': 'GET',
        'security': [
          {'apiKey': []},
        ],
        'parameters': [
          {
            'name': 'limit',
            'in': 'query',
            'required': true,
            'schema': {
              'type': 'integer',
            },
          },
          {
            'name': 'sort',
            'in': 'query',
            'required': false,
            'schema': {
              'type': 'string',
            },
          }
        ],
        'responses': {
          '200': {
            'description': 'OK',
            'content': {
              'application/json': {},
            },
          },
          '400': {
            'description': 'Bad Request',
            'content': {
              'application/json': {},
            },
          },
        },
        'operationId': 'getUserList',
        'summary': 'Get a list of users',
      };

      final request = requestParser.parse(requestData);

      expect(request.path, '/api/users');
      expect(request.method, 'GET');
      expect(request.securityRequirements!.length, 1);
      expect(request.parameters!.length, 2);
      expect(request.requestBody, isNull);
      expect(request.responses!.length, 2);
      expect(request.operationId, 'getUserList');
      expect(request.summary, 'Get a list of users');
    });

    test('parse should set requestBody as null if content is empty', () {
      final requestData = {
        'path': '/api/users',
        'method': 'GET',
        'security': [
          {'apiKey': []},
        ],
        'parameters': [
          {
            'name': 'limit',
            'in': 'query',
            'required': false,
            'schema': {
              'type': 'integer',
            },
          },
          {
            'name': 'sort',
            'in': 'query',
            'required': false,
            'schema': {
              'type': 'string',
            },
          }
        ],
        'requestBody': {},
        'responses': {
          '200': {
            'description': 'OK',
            'content': {
              'application/json': {},
            },
          },
          '400': {
            'description': 'Bad Request',
            'content': {
              'application/json': {},
            },
          },
        },
        'operationId': 'getUserList',
        'summary': 'Get a list of users',
      };

      final request = requestParser.parse(requestData);

      expect(request.requestBody, isNull);
    });

    test('validate should throw an exception if method is null', () {
      final requestData = {
        'path': '/api/users',
        'responses': [
          {
            '200': {'description': 'OK'},
          },
        ],
      };

      expect(() => requestParser.validate(requestData), throwsException);
    });

    test('validate should throw an exception if path is null', () {
      final requestData = {
        'method': 'GET',
        'responses': [
          {
            '200': {'description': 'OK'},
          },
        ],
      };

      expect(() => requestParser.validate(requestData), throwsException);
    });

    test('validate should throw an exception if responses is null', () {
      final requestData = {
        'method': 'GET',
        'path': '/api/users',
      };

      expect(() => requestParser.validate(requestData), throwsException);
    });
  });
}
