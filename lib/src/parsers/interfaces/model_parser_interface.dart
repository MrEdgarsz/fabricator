import 'package:fabricator_builder/src/mixins/supported_version_mixin.dart';
import 'package:fabricator_builder/src/models/model.dart';

/// Interface for parsing models in the OpenAPI specification.
abstract class IModelParser with SupportedVersion {
  /// Parses a model object from the OpenAPI specification.
  ///
  /// [modelData] is a map representing the model data in the OpenAPI spec.
  /// Returns an instance of [Model].
  Model parse(Map<String, dynamic> modelData);
}
