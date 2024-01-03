import 'package:example/fabricator_example/components/item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_items_response.freezed.dart';
part 'post_items_response.g.dart';

@freezed
class PostItemsResponse with _$PostItemsResponse {
  const factory PostItemsResponse.postItems201Response({
    required Item item,
  }) = PostItems201Response;

  const factory PostItemsResponse.postItemsUnknownResponse({
    required int statusCode,
    Map<String, dynamic>? data,
  }) = PostItemsUnknownResponse;

  factory PostItemsResponse.fromJson(Map<String, dynamic> json) =>
      _$PostItemsResponseFromJson(json);
}
