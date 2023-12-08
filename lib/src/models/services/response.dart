import 'package:fabricator_builder/src/models/model.dart';

/// Represents a single API response as per OpenAPI documentation.
class Response<T> {
  Response({
    required this.statusCode,
    required this.description,
    this.model,
    this.headers,
    this.example,
  });

  /// The HTTP status code of the response.
  final String statusCode;

  /// Description of the response.
  final String description;

  /// The model of the response data. Can be `null` if the response does not return data.
  final Model<T>? model;

  /// Optional headers for the response.
  final Map<String, dynamic>? headers;

  /// Example of the response data. Can be used for documentation or testing.
  final T? example;
}
