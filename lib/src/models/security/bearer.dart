import 'package:fabricator_builder/src/models/security/security_scheme.dart';

/// Represents a Bearer Token security scheme.
class BearerTokenSecurity extends SecurityScheme {
  BearerTokenSecurity(
      {required super.schemaName, super.description, this.bearerFormat})
      : super(
          type: 'bearer',
        );

  final String? bearerFormat;
}
