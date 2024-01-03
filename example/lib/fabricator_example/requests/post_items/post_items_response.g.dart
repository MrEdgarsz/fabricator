// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_items_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PostItems201ResponseImpl _$$PostItems201ResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$PostItems201ResponseImpl(
      item: Item.fromJson(json['item'] as String),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$PostItems201ResponseImplToJson(
        _$PostItems201ResponseImpl instance) =>
    <String, dynamic>{
      'item': instance.item,
      'runtimeType': instance.$type,
    };

_$PostItemsUnknownResponseImpl _$$PostItemsUnknownResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$PostItemsUnknownResponseImpl(
      statusCode: json['statusCode'] as int,
      data: json['data'] as Map<String, dynamic>?,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$PostItemsUnknownResponseImplToJson(
        _$PostItemsUnknownResponseImpl instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'data': instance.data,
      'runtimeType': instance.$type,
    };
