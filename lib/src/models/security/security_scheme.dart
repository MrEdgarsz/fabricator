/// Represents a general security scheme in the OpenAPI specification.
abstract class SecurityScheme {
  SecurityScheme({
    required this.type,
    required this.schemaName,
    this.description,
  });

  /// The type of the security scheme (e.g., "apiKey", "http", "oauth2").
  final String type;

  /// Optional description of the security scheme.
  final String? description;

  /// The name of the security scheme.
  final String schemaName;
}
