// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fabricator_builder/src/models/models.dart';
import 'package:fabricator_builder/src/parsers/interfaces/interfaces.dart';

class ResponseParser implements IResponseParser {
  ResponseParser({
    required this.schemaParser,
    required this.headerParser,
  });
  ISchemaParser schemaParser;
  IHeaderParser headerParser;

  @override
  Response parse(Map<String, dynamic> data) {
    final responseData = data.entries.first;
    final statusCode = responseData.key;
    final responseBody = responseData.value;
    _validateResponse(responseBody);
    final description = responseBody['description'];
    final content = responseBody['content'];
    Map<String, MediaType>? contents = {};

    if (content != null &&
        content.isNotEmpty &&
        content is Map<String, dynamic> &&
        content['application/json'] != null) {
      for (final MapEntry<String, dynamic> mediaType in content.entries) {
        if (mediaType.value['schema'] != null) {
          contents?[mediaType.key] = MediaType(
            schemaParser.parse(
              mediaType.value['schema'],
            ),
            mediaType.value['example'],
          );
        } else {
          contents = null;
        }
      }
    } else {
      contents = null;
    }
    final List<Header> headers = [];
    final headersData = responseBody['headers'] as Map<String, dynamic>?;
    if (headersData != null) {
      for (final header in headersData.entries) {
        headers.add(
          // TODO(Edgar): this is a hack, we need to fix this
          headerParser.parse({
            header.key: header.value,
          }),
        );
      }
    }

    return Response(
      statusCode: statusCode,
      description: description,
      content: contents,
      headers: headers,
      example: responseBody['example'],
    );
  }

  void _validateResponse(Map<String, dynamic> responseData) {
    if (responseData['description'] == null) {
      throw Exception('Response description is required.');
    }
  }

  @override
  // TODO(Edgar): implement supportedVersion
  String get supportedVersion => throw UnimplementedError();
}
