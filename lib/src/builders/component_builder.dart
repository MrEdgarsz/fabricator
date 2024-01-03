import 'package:fabricator_builder/src/models/models.dart';

class ComponentBuilder {
  String build(MapEntry<String, ObjectSchema> componentData) {
    return '''
    @freezed
    class ${componentData.key}DTO with _\$${componentData.key}{
      const factory ${componentData.key}({
        ${componentData.value.properties.entries.map((e) => '${e.key} ${e.value.dartType[0].toUpperCase()}${e.value}').join(',\n')}
      }) = _${componentData.key};
    }
    ''';
  }
}
