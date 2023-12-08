import 'package:fabricator_builder/src/models/model.dart';
import 'package:fabricator_builder/src/models/security/security_requirement.dart';
import 'package:fabricator_builder/src/models/services/response.dart';
import 'package:fabricator_builder/src/models/types/parameter.dart';

/// Represents a single API request in an OpenAPI service.
class Request {
  Request({
    required this.securityRequirements,
    required this.method,
    required this.path,
    this.parameters,
    this.requestBody,
    this.responses,
  });

  /// HTTP method of the request (e.g., GET, POST, PUT, DELETE).
  final String method;

  /// Path of the request.
  final String path;

  /// Parameters associated with the request.
  final List<Parameter>? parameters;

  /// The request body model, if applicable.
  final Model? requestBody;

  /// Expected responses for this request, mapped by their HTTP status codes.
  final Map<String, Response>? responses;

  /// Security requirements for this request.
  final List<SecurityRequirement>? securityRequirements;

  /// Returns the name of the method that should be generated for this request.
  // TODO(Edgar): implement this
  String get dartMethodName => throw UnimplementedError();
}
