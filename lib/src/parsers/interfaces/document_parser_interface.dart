import 'package:fabricator_builder/src/mixins/mixins.dart';
import 'package:fabricator_builder/src/models/models.dart';

abstract class IDocumentParser with SupportedVersion {
  /// Parses a whole documentation of API in the form of OpenAPI document.
  ///
  /// [data] is a json representation the whole documentation.
  /// Returns an instance of [Document].
  /// Can throw an [FabricatorException] if the documentation is not valid.
  Document parse(Map<String, dynamic> data);
}
