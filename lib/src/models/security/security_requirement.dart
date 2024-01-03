import 'package:fabricator_builder/src/models/security/required_enum.dart';

class SecurityRequirement {
  SecurityRequirement({
    required this.schemaName,
    this.oneOf,
    this.isRequired = SRequired.notRequired,
  });

  final String schemaName;
  final List<String>? oneOf;
  final SRequired isRequired;
}
