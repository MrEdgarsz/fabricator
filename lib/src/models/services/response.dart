import 'package:fabricator_builder/src/models/services/header.dart';
import 'package:fabricator_builder/src/models/services/media_type.dart';
import 'package:flutter/foundation.dart';

/// Represents a single API response as per OpenAPI documentation.
class Response {
  Response({
    required this.statusCode,
    required this.description,
    required this.content,
    this.headers,
    this.example,
  });

  /// The HTTP status code of the response.
  final String statusCode;

  /// Description of the response.
  final String description;

  /// The content of the response data. Can be `null` if the response does not return data.
  final Map<String, MediaType>? content;

  /// Optional headers for the response.
  final List<Header>? headers;

  /// Example of the response data. Can be used for documentation or testing.
  final Map<String, dynamic>? example;

  @override
  String toString() {
    return 'Response(statusCode: $statusCode, description: $description, content: $content, headers: $headers, example: $example)';
  }

  @override
  bool operator ==(covariant Response other) {
    if (identical(this, other)) return true;

    return other.statusCode == statusCode &&
        other.description == description &&
        mapEquals(other.content, content) &&
        listEquals(other.headers, headers) &&
        mapEquals(other.example, example);
  }

  @override
  int get hashCode {
    return statusCode.hashCode ^
        description.hashCode ^
        content.hashCode ^
        headers.hashCode ^
        example.hashCode;
  }
}
