// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_items_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetItems200ResponseImpl _$$GetItems200ResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$GetItems200ResponseImpl(
      items: (json['items'] as List<dynamic>)
          .map((e) => Item.fromJson(e as String))
          .toList(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$GetItems200ResponseImplToJson(
        _$GetItems200ResponseImpl instance) =>
    <String, dynamic>{
      'items': instance.items,
      'runtimeType': instance.$type,
    };

_$GetItemsUnknownResponseImpl _$$GetItemsUnknownResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$GetItemsUnknownResponseImpl(
      statusCode: json['statusCode'] as int,
      data: json['data'] as Map<String, dynamic>?,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$GetItemsUnknownResponseImplToJson(
        _$GetItemsUnknownResponseImpl instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'data': instance.data,
      'runtimeType': instance.$type,
    };
