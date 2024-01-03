import 'package:fabricator_builder/src/models/schema.dart';
import 'package:fabricator_builder/src/models/security/security_scheme.dart';
import 'package:fabricator_builder/src/models/server.dart';
import 'package:fabricator_builder/src/models/services/service.dart';

/// Represents the entire OpenAPI document structure.
class Document {
  /// Constructor for OpenAPIDocument.
  Document({
    required this.services,
    required this.securitySchemes,
    required this.servers,
    required this.components,
    required this.title,
    required this.version,
    this.description,
    this.termsOfService,
    this.contact,
    this.license,
  });

  /// A list of services, each corresponding to a tag in the OpenAPI specification.
  final List<Service> services;

  /// A list of global security schemes used across the API.
  final List<SecurityScheme> securitySchemes;

  /// A list of server URLs where the API is available.
  final List<Server> servers;

  /// Reusable component definitions such as schemas and responses.
  final Map<String, Schema> components;

  /// The title of the API.
  final String title;

  /// The version of the API.
  final String version;

  /// Optional description of the API.
  final String? description;

  /// Terms of service for the API.
  final String? termsOfService;

  /// Contact information for the API.
  final String? contact;

  /// License information for the API.
  final String? license;
}
