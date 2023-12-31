import 'package:fabricator_builder/src/mixins/supported_version_mixin.dart';
import 'package:fabricator_builder/src/models/services/request.dart';

/// Interface for parsing requests in the OpenAPI specification.
abstract class IRequestParser with SupportedVersion {
  /// Parses a request object from the OpenAPI specification.
  ///
  /// [requestData] is a map representing the request data in the OpenAPI spec.
  /// Returns an instance of [Request].
  Request parse(Map<String, dynamic> requestData);
}
