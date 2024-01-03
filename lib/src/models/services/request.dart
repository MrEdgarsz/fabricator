import 'package:fabricator_builder/src/models/models.dart';

/// Represents a single API request in an OpenAPI service.
class Request {
  Request({
    required this.securityRequirements,
    required this.method,
    required this.path,
    this.tags,
    this.operationId,
    this.summary,
    this.parameters,
    this.requestBody,
    this.responses,
  });

  /// HTTP method of the request (e.g., GET, POST, PUT, DELETE).
  final String method;

  /// Path of the request.
  final String path;

  /// The tags associated with the request. Used for grouping requests into Services.
  final List<String>? tags;

  /// The operation ID of the request, helpful for generating method names.
  final String? operationId;

  /// A short summary of the request. used as documentation of purpose. Markdown is allowed.
  final String? summary;

  /// Parameters associated with the request.
  final List<Parameter>? parameters;

  /// The request body model, if applicable.
  final RequestBody? requestBody;

  /// Expected responses for this request
  final List<Response>? responses;

  /// Security requirements for this request.
  final List<SecurityRequirement>? securityRequirements;

  /// Returns the name of the method that should be generated for this request.
  // TODO(Edgar): implement this
  String get dartMethodName => throw UnimplementedError();
}
