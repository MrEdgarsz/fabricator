import 'package:example/fabricator_example/components/item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_items_response.freezed.dart';
part 'get_items_response.g.dart';

@freezed
class GetItemsResponse with _$GetItemsResponse {
  const factory GetItemsResponse.getItems200Response({
    required List<Item> items,
  }) = GetItems200Response;

  const factory GetItemsResponse.getItemsUnknownResponse({
    required int statusCode,
    Map<String, dynamic>? data,
  }) = GetItemsUnknownResponse;

  factory GetItemsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetItemsResponseFromJson(json);
}
