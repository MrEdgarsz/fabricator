import 'package:fabricator_builder/src/mixins/supported_version_mixin.dart';
import 'package:fabricator_builder/src/models/security/security_scheme.dart';

/// Interface for parsing security schemes in the OpenAPI specification.
abstract class ISecuritySchemeParser with SupportedVersion {
  /// Parses a security scheme object from the OpenAPI specification.
  ///
  /// [securitySchemeData] is a map representing the security scheme data in the OpenAPI spec.
  /// Returns an instance of [SecurityScheme].
  SecurityScheme parse(Map<String, dynamic> securitySchemeData);
}
