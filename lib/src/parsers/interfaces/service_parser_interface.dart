import 'package:fabricator_builder/src/mixins/supported_version_mixin.dart';
import 'package:fabricator_builder/src/models/services/service.dart';
import 'package:fabricator_builder/src/parsers/interfaces/request_parser_interface.dart';

/// Interface for parsing services in the OpenAPI specification.
abstract class IServiceParser with SupportedVersion {
  /// Constructor for service parser.
  IServiceParser(this.requestParser);

  /// Reference to a request parser.
  final IRequestParser requestParser;

  /// Parses a service object from the OpenAPI specification.
  ///
  /// [serviceData] is a map representing the service data in the OpenAPI spec.
  /// Returns an instance of [Service].
  Service parse(Map<String, dynamic> serviceData);
}
