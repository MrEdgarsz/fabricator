import 'package:example/fabricator_example/securities/security.dart';

abstract class SecurityQuery extends Security {
  String get queryName;

  String get queryValue;
}
