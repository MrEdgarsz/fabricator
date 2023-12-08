import 'package:fabricator_builder/src/models/security/security_requirement.dart';
import 'package:fabricator_builder/src/models/services/request.dart';

/// Represents a service in an OpenAPI specification, grouped by a tag.
class Service {
  Service({
    required this.tag,
    required this.requests,
  });

  /// The tag associated with this service.
  final String tag;

  /// A list of requests that are included under this service.
  final List<Request> requests;

  /// A list of all the security schemes used by requests in this service.
  // TODO(edgar): This needs to be optimized.
  Set<String> get securitySchemes {
    final schemes = <String>{};
    for (final request in requests) {
      for (final requirement
          in request.securityRequirements ?? <SecurityRequirement>[]) {
        schemes.add(requirement.schemaName);
      }
    }
    return schemes;
  }
}
