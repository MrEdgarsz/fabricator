import 'package:fabricator_builder/src/mixins/supported_version_mixin.dart';
import 'package:fabricator_builder/src/models/schema.dart';

/// Defines an interface for a parser that handles OpenAPI schemas.
abstract class ISchemaParser with SupportedVersion {
  /// Parses a parameter object from the OpenAPI specification.
  ///
  /// [schemaData] is a map representing the parameter data in the OpenAPI spec.
  ///
  /// Returns an instance of [Schema].
  Schema parse(Map<String, dynamic> schemaData);
}
