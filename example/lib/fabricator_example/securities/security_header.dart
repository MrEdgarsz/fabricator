import 'package:example/fabricator_example/securities/security.dart';

abstract class HeaderSecurity extends Security {
  String get headerName;

  String get headerValue;
}
