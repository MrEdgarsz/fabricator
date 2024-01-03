import 'package:fabricator_builder/src/models/models.dart';
import 'package:fabricator_builder/src/parsers/v3/security_parser.dart';
import 'package:test/test.dart';

void main() {
  group('SecuritySchemeParser', () {
    late SecuritySchemeParser securitySchemeParser;

    setUp(() {
      securitySchemeParser = SecuritySchemeParser();
    });

    test('parse should return ApiKeySecurity for apiKey type', () {
      final securitySchemeData = {
        'apiKey': {
          'type': 'apiKey',
          'description': 'API Key',
          'in': 'header',
          'name': 'X-API-Key',
        },
      };

      final result = securitySchemeParser.parse(securitySchemeData);

      expect(result, isA<ApiKeySecurity>());
      expect(result.description, 'API Key');
      expect((result as ApiKeySecurity).location, 'header');
      expect(result.parameterName, 'X-API-Key');
      expect(result.schemaName, 'apiKey');
    });

    test('parse should return BearerTokenSecurity for http bearer type', () {
      final securitySchemeData = {
        'bearer': {
          'type': 'http',
          'scheme': 'bearer',
          'description': 'Bearer Token',
          'bearerFormat': 'JWT',
        },
      };

      final result = securitySchemeParser.parse(securitySchemeData);

      expect(result, isA<BearerTokenSecurity>());
      expect(result.description, 'Bearer Token');
      expect(result.schemaName, 'bearer');
      expect((result as BearerTokenSecurity).bearerFormat, 'JWT');
    });

    test('parse should return HttpBasicSecurity for http basic type', () {
      final securitySchemeData = {
        'basic': {
          'type': 'http',
          'scheme': 'basic',
          'description': 'Basic Authentication',
        },
      };

      final result = securitySchemeParser.parse(securitySchemeData);

      expect(result, isA<HttpBasicSecurity>());
      expect(result.description, 'Basic Authentication');
      expect(result.schemaName, 'basic');
    });

    test('parse should throw FabricatorException for unsupported type', () {
      final securitySchemeData = {
        'unsupported': {
          'type': 'unsupported',
          'scheme': 'unsupported',
        },
      };

      expect(
        () => securitySchemeParser.parse(securitySchemeData),
        throwsA(isA<FabricatorException>()),
      );
    });

    test('parse should throw FabricatorException if type is missing', () {
      final securitySchemeData = {
        'missingType': {
          'scheme': 'missingType',
        },
      };

      expect(
        () => securitySchemeParser.parse(securitySchemeData),
        throwsA(isA<FabricatorException>()),
      );
    });
  });
}
