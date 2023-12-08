import 'package:fabricator_builder/src/models/security/security_scheme.dart';

/// Represents an HTTP Basic Authentication security scheme.
class HttpBasicSecurity extends SecurityScheme {
  HttpBasicSecurity({required super.schemaName, super.description})
      : super(type: 'http');
}
