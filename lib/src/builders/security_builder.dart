import 'package:fabricator_builder/src/models/security/security_scheme.dart';

class SecurityBuilder {
  String build(SecurityScheme securityScheme) {
    if (securityScheme is ApiKeySecurity) {
      return buildApiKeySecurity(securityScheme);
    } else if (securityScheme is BearerTokenSecurity) {
      return buildBearerTokenSecurity(securityScheme);
    } else if (securityScheme is HttpBasicSecurity) {
      return buildHttpBasicSecurity(securityScheme);
    } else if (securityScheme is HttpSecurity) {
      return buildHttpSecurity(securityScheme);
    } else if (securityScheme is OAuth2Security) {
      return buildOAuth2Security(securityScheme);
    } else if (securityScheme is OpenIdConnectSecurity) {
      return buildOpenIdConnectSecurity(securityScheme);
    } else {
      throw Exception('Unknown security scheme type');
    }
  }
}
