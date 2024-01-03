import 'package:fabricator_builder/src/models/models.dart';
import 'package:fabricator_builder/src/parsers/parsers.dart';

class RequestParser implements IRequestParser {
  RequestParser(
    this._responseParser,
    this._schemaParser,
  );

  final ResponseParser _responseParser;
  final SchemaParser _schemaParser;

  @override
  Request parse(Map<String, dynamic> requestData) {
    //assume that the request was stripped of path and method and that was added to the value
    final path = requestData['path'] as String;
    final method = requestData['method'] as String;
    final List<SecurityRequirement> securityRequirements =
        _parseSecurityRequirements(requestData['security']);
    final List<Parameter> parameters =
        _parseParameters(requestData['parameters']);

    return Request(
      securityRequirements: securityRequirements,
      method: method,
      path: path,
      parameters: parameters,
      tags: (requestData['tags'] as List<dynamic>?)?.cast<String>(),
      requestBody: _parseRequestBody(requestData['requestBody']),
      responses: _parseResponses(requestData['responses']),
      operationId: requestData['operationId'],
      summary: requestData['summary'],
    );
  }

  RequestBody? _parseRequestBody(Map<dynamic, dynamic>? requestBodyData) {
    if (requestBodyData is! Map<String, dynamic>?) {
      return null;
    }
    if (requestBodyData == null) {
      return null;
    }
    if (requestBodyData.isEmpty) {
      return null;
    }
    if (requestBodyData['content'] == null) {
      return null;
    }
    if (requestBodyData['content'].isEmpty) {
      return null;
    }
    if (requestBodyData['content']['application/json'] == null) {
      return null;
    }
    if (requestBodyData['content']['application/json'].isEmpty) {
      return null;
    }
    final Map<String, MediaType> content = {};
    for (final mediaType in requestBodyData['content'].entries) {
      content[mediaType.key] = MediaType(
        _schemaParser.parse(mediaType.value['schema']),
        mediaType.value['example'],
      );
    }
    return RequestBody(
      required: requestBodyData['required'] ?? false,
      content: content,
    );
  }

  List<Parameter> _parseParameters(List<dynamic>? parametersData) {
    if (parametersData == null) {
      return [];
    }
    final parameters = <Parameter>[];
    for (final parameterData in parametersData) {
      if (parameterData['schema'] == null) {
        continue;
      }
      final schema = _schemaParser.parse(parameterData['schema']);
      parameters.add(
        Parameter(
          parameterData['name'],
          parameterData['in'],
          parameterData['required'],
          schema,
        ),
      );
    }

    return parameters;
  }

  List<Response> _parseResponses(
    Map<String, dynamic> responsesData,
  ) {
    final responses = <Response>[];
    for (final response in responsesData.entries) {
      responses.add(
        // TODO(Edgar): this is a hack, we need to fix this
        _responseParser.parse({response.key: response.value}),
      );
    }

    return responses;
  }

  List<SecurityRequirement> _parseSecurityRequirements(
    List<Map<String, dynamic>>? securityData,
  ) {
    final securityRequirements = <SecurityRequirement>[];
    if (securityData == null) {
      return securityRequirements;
    }
    for (final securityRequirement in securityData) {
      //check if there is more than one security requirement declared in this object, if so, only one needs to be satisfied
      if (securityRequirement.length > 1) {
        for (final schemaName in securityRequirement.keys) {
          securityRequirements.add(
            SecurityRequirement(
              schemaName: schemaName,
              isRequired: SRequired.oneOf,
              oneOf: securityRequirement.keys.toList(),
            ),
          );
        }
      } else {
        securityRequirements.add(
          SecurityRequirement(
            schemaName: securityRequirement.keys.first,
            isRequired: SRequired.required,
          ),
        );
      }
    }

    return securityRequirements;
  }

  //validate
  void validate(Map<String, dynamic> requestData) {
    if (requestData['method'] == null) {
      throw Exception('Request method is required.');
    }

    if (requestData['path'] == null) {
      throw Exception('Request path is required.');
    }

    if (requestData['responses'] == null) {
      throw Exception('Request responses are required.');
    }
  }

  @override
  // TODO: implement supportedVersion
  String get supportedVersion => throw UnimplementedError();
}
