import 'package:fabricator_builder/src/mixins/supported_version_mixin.dart';
import 'package:fabricator_builder/src/models/types/parameter.dart';

/// Defines an interface for a parser that handles OpenAPI parameters.
abstract class IParameterParser with SupportedVersion {
  /// Parses a parameter object from the OpenAPI specification.
  ///
  /// [parameterData] is a map representing the parameter data in the OpenAPI spec.
  ///
  /// Returns an instance of [Parameter].
  Parameter parse(Map<String, dynamic> parameterData);
}
