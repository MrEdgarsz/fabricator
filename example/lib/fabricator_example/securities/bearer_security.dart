import 'package:example/fabricator_example/securities/security_header.dart';

class BearerAuth extends HeaderSecurity {
  BearerAuth(this.token);

  final String token;

  @override
  String get name => 'bearerAuth';

  @override
  String get headerName => 'Authorization';

  @override
  String get headerValue => 'Bearer $token';
}
