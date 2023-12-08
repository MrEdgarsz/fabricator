import 'package:fabricator_builder/src/mixins/supported_version_mixin.dart';
import 'package:fabricator_builder/src/models/services/response.dart';

/// Interface for parsing individual responses in the OpenAPI specification.
abstract class IResponseParser with SupportedVersion {
  /// Parses a single response object from the OpenAPI specification.
  ///
  /// [responseData] is a map representing the response data in the OpenAPI spec.
  /// Returns an instance of [Response].
  Response parse(Map<String, dynamic> responseData);
}
