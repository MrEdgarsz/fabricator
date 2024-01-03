import 'package:fabricator_builder/src/mixins/mixins.dart';
import 'package:fabricator_builder/src/models/services/header.dart';

abstract class IHeaderParser with SupportedVersion {
  Header parse(Map<String, dynamic> data);
}
