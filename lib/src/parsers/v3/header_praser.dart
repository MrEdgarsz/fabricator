import 'package:fabricator_builder/src/models/services/header.dart';
import 'package:fabricator_builder/src/parsers/parsers.dart';

class HeaderParser implements IHeaderParser {
  HeaderParser(this._schemaParser);

  final ISchemaParser _schemaParser;

  @override
  Header parse(Map<String, dynamic> data) {
    final headerData = data.entries.first;
    _validate(headerData);
    final schemaData = headerData.value['schema'] as Map<String, dynamic>?;
    // add name to schema same as header name, this is used to generate the dart class
    // TODO(Edgar): find a better way to do this
    if (schemaData != null) {
      schemaData['name'] = headerData.key;
    }
    return Header(
      name: headerData.key,
      description: headerData.value['description'],
      schema: _schemaParser.parse(headerData.value['schema']),
      required: headerData.value['required'] ?? true,
      example: headerData.value['example'],
    );
  }

  void _validate(MapEntry<String, dynamic> data) {
    //make sure that description is not null
    if (data.value['description'] == null) {
      throw Exception('Header description is required');
    }
  }

  @override
  // TODO(Edgar): implement supportedVersion
  String get supportedVersion => throw UnimplementedError();
}
