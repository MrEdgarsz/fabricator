import 'package:fabricator_builder/src/models/models.dart';
import 'package:fabricator_builder/src/parsers/parsers.dart';

class SecuritySchemeParser implements ISecuritySchemeParser {
  @override
  SecurityScheme parse(Map<String, dynamic> securitySchemeData) {
    final name = securitySchemeData.keys.first;
    final data = securitySchemeData.entries.first;
    //validate the data
    _validate(data);
    //determine the type of security scheme
    switch (data.value['type']) {
      case 'apiKey':
        return ApiKeySecurity(
          description: data.value['description'],
          location: data.value['in'],
          parameterName: data.value['name'],
          schemaName: name,
        );
      case 'http':
        if (data.value['scheme'] == 'bearer') {
          return BearerTokenSecurity(
            description: data.value['description'],
            schemaName: name,
            bearerFormat: data.value['bearerFormat'],
          );
        } else {
          return HttpBasicSecurity(
            description: data.value['description'],
            schemaName: name,
          );
        }
      default:
        throw FabricatorException(
          'The security scheme type ${data.value['type']} is not supported.',
          cause: data.value,
        );
    }
  }

  void _validate(MapEntry<String, dynamic> data) {
    //make sure that type and scheme are present
    if (!data.value.containsKey('type')) {
      throw FabricatorException(
        'The security scheme must have a type.',
        cause: data.value,
      );
    }
  }

  @override
  // TODO: implement supportedVersion
  String get supportedVersion => throw UnimplementedError();
}
