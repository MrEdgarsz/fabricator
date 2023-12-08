import 'package:fabricator_builder/src/models/security/security_scheme.dart';

/// Represents an API Key security scheme.
class ApiKeySecurity extends SecurityScheme {
  /// Constructor for API Key security scheme.
  ApiKeySecurity({
    required this.parameterName,
    required this.location,
    required super.schemaName,
    super.description,
  }) : super(type: 'apiKey');

  /// The location of the API Key (e.g., "query", "header").
  final String location;

  /// The name of the header or query parameter to be used.
  final String parameterName;
}
