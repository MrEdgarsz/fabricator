import 'package:collection/collection.dart';
import 'package:fabricator_builder/src/models/models.dart';
import 'package:fabricator_builder/src/parsers/parsers.dart';
import 'package:test/test.dart';

import '../../../utils/utils.dart';

void main() {
  late DocumentParser documentParser;
  late SchemaParser schemaParser;
  late SecuritySchemeParser securitySchemeParser;
  late RequestParser requestParser;
  late ResponseParser responseParser;
  late HeaderParser headerParser;
  setUp(() {
    schemaParser = SchemaParser();
    securitySchemeParser = SecuritySchemeParser();
    headerParser = HeaderParser(schemaParser);
    responseParser = ResponseParser(
      schemaParser: schemaParser,
      headerParser: headerParser,
    );
    requestParser = RequestParser(
      responseParser,
      schemaParser,
    );
    documentParser = DocumentParser(
      schemaParser,
      securitySchemeParser,
      requestParser,
    );
  });
  group('DocumentParser', () {
    test('should properly parse the documentation', () {
      final sampleData = loadSampleData(SampleData.sample1);
      final document = documentParser.parse(sampleData);
      expect(document.title, 'Complex Sample API');
      expect(document.version, '1.0.0');
      expect(
        document.description,
        'A sample API to demonstrate various OpenAPI features.',
      );
      expect(document.termsOfService, isNull);
      expect(document.contact, isNull);
      expect(document.license, isNull);
      expect(document.servers, [
        Server(
          url: 'https://api.example.com/v1',
          description: 'Production server',
        ),
      ]);
      //test services
      expect(document.services.length, 2);
      //make sure that service with tag Items exitsts
      final itemsService = document.services.firstWhereOrNull(
        (element) => element.tag == 'Items',
      );
      final usersService = document.services.firstWhereOrNull(
        (element) => element.tag == 'Users',
      );
      expect(
        itemsService,
        isNotNull,
      );
      //make sure that service with tag Users exists
      expect(
        usersService,
        isNotNull,
      );
      // make sure that service with tag Items has 3 requests
      expect(
        itemsService?.requests.length,
        3,
      );
      // make sure that service with tag Users has 0 requests
      expect(
        usersService?.requests.length,
        0,
      );
      //make sure that there is a component with name Item
      expect(
        document.components['Item'],
        isNotNull,
      );
    });
    //write a test that makes sure that if a request does not have a tag it is added to the default tag
    test('should add request to default tag if no tag is provided', () {
      final sampleData = loadSampleData(SampleData.sample2);
      final document = documentParser.parse(sampleData);
      expect(document.services.length, 1);
      expect(document.services.first.tag, 'Default');
      expect(document.services.first.requests.length, 1);
      expect(document.services.first.requests.first.tags?.first, isNull);
    });
  });
}
