import 'package:fabricator_builder/src/builders/component_builder.dart';
import 'package:fabricator_builder/src/models/models.dart';
import 'package:test/test.dart';

void main() {
  late ComponentBuilder componentBuilder;

  setUp(() {
    componentBuilder = ComponentBuilder();
  });
  group('ComponentBuilder', () {
    test('should build a component', () {
      final component = MapEntry(
        'Item',
        ObjectSchema(
          required: true,
          description: 'An item',
          properties: {
            'id': StringSchema(
              description: 'The id of the item',
              required: true,
            ),
            'name': StringSchema(
              description: 'The name of the item',
              required: true,
            ),
            'price': NumberSchema(
              description: 'The price of the item',
              required: true,
            ),
          },
        ),
      );
      final result = componentBuilder.build(component);
      expect(result, isNotNull);
    });
  });
}
