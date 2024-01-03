// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_items_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PostItemsResponse _$PostItemsResponseFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'postItems201Response':
      return PostItems201Response.fromJson(json);
    case 'postItemsUnknownResponse':
      return PostItemsUnknownResponse.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'PostItemsResponse',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$PostItemsResponse {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Item item) postItems201Response,
    required TResult Function(int statusCode, Map<String, dynamic>? data)
        postItemsUnknownResponse,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Item item)? postItems201Response,
    TResult? Function(int statusCode, Map<String, dynamic>? data)?
        postItemsUnknownResponse,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Item item)? postItems201Response,
    TResult Function(int statusCode, Map<String, dynamic>? data)?
        postItemsUnknownResponse,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PostItems201Response value) postItems201Response,
    required TResult Function(PostItemsUnknownResponse value)
        postItemsUnknownResponse,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PostItems201Response value)? postItems201Response,
    TResult? Function(PostItemsUnknownResponse value)? postItemsUnknownResponse,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PostItems201Response value)? postItems201Response,
    TResult Function(PostItemsUnknownResponse value)? postItemsUnknownResponse,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostItemsResponseCopyWith<$Res> {
  factory $PostItemsResponseCopyWith(
          PostItemsResponse value, $Res Function(PostItemsResponse) then) =
      _$PostItemsResponseCopyWithImpl<$Res, PostItemsResponse>;
}

/// @nodoc
class _$PostItemsResponseCopyWithImpl<$Res, $Val extends PostItemsResponse>
    implements $PostItemsResponseCopyWith<$Res> {
  _$PostItemsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$PostItems201ResponseImplCopyWith<$Res> {
  factory _$$PostItems201ResponseImplCopyWith(_$PostItems201ResponseImpl value,
          $Res Function(_$PostItems201ResponseImpl) then) =
      __$$PostItems201ResponseImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Item item});
}

/// @nodoc
class __$$PostItems201ResponseImplCopyWithImpl<$Res>
    extends _$PostItemsResponseCopyWithImpl<$Res, _$PostItems201ResponseImpl>
    implements _$$PostItems201ResponseImplCopyWith<$Res> {
  __$$PostItems201ResponseImplCopyWithImpl(_$PostItems201ResponseImpl _value,
      $Res Function(_$PostItems201ResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? item = null,
  }) {
    return _then(_$PostItems201ResponseImpl(
      item: null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as Item,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PostItems201ResponseImpl implements PostItems201Response {
  const _$PostItems201ResponseImpl({required this.item, final String? $type})
      : $type = $type ?? 'postItems201Response';

  factory _$PostItems201ResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$PostItems201ResponseImplFromJson(json);

  @override
  final Item item;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'PostItemsResponse.postItems201Response(item: $item)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostItems201ResponseImpl &&
            (identical(other.item, item) || other.item == item));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, item);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PostItems201ResponseImplCopyWith<_$PostItems201ResponseImpl>
      get copyWith =>
          __$$PostItems201ResponseImplCopyWithImpl<_$PostItems201ResponseImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Item item) postItems201Response,
    required TResult Function(int statusCode, Map<String, dynamic>? data)
        postItemsUnknownResponse,
  }) {
    return postItems201Response(item);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Item item)? postItems201Response,
    TResult? Function(int statusCode, Map<String, dynamic>? data)?
        postItemsUnknownResponse,
  }) {
    return postItems201Response?.call(item);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Item item)? postItems201Response,
    TResult Function(int statusCode, Map<String, dynamic>? data)?
        postItemsUnknownResponse,
    required TResult orElse(),
  }) {
    if (postItems201Response != null) {
      return postItems201Response(item);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PostItems201Response value) postItems201Response,
    required TResult Function(PostItemsUnknownResponse value)
        postItemsUnknownResponse,
  }) {
    return postItems201Response(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PostItems201Response value)? postItems201Response,
    TResult? Function(PostItemsUnknownResponse value)? postItemsUnknownResponse,
  }) {
    return postItems201Response?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PostItems201Response value)? postItems201Response,
    TResult Function(PostItemsUnknownResponse value)? postItemsUnknownResponse,
    required TResult orElse(),
  }) {
    if (postItems201Response != null) {
      return postItems201Response(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$PostItems201ResponseImplToJson(
      this,
    );
  }
}

abstract class PostItems201Response implements PostItemsResponse {
  const factory PostItems201Response({required final Item item}) =
      _$PostItems201ResponseImpl;

  factory PostItems201Response.fromJson(Map<String, dynamic> json) =
      _$PostItems201ResponseImpl.fromJson;

  Item get item;
  @JsonKey(ignore: true)
  _$$PostItems201ResponseImplCopyWith<_$PostItems201ResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PostItemsUnknownResponseImplCopyWith<$Res> {
  factory _$$PostItemsUnknownResponseImplCopyWith(
          _$PostItemsUnknownResponseImpl value,
          $Res Function(_$PostItemsUnknownResponseImpl) then) =
      __$$PostItemsUnknownResponseImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int statusCode, Map<String, dynamic>? data});
}

/// @nodoc
class __$$PostItemsUnknownResponseImplCopyWithImpl<$Res>
    extends _$PostItemsResponseCopyWithImpl<$Res,
        _$PostItemsUnknownResponseImpl>
    implements _$$PostItemsUnknownResponseImplCopyWith<$Res> {
  __$$PostItemsUnknownResponseImplCopyWithImpl(
      _$PostItemsUnknownResponseImpl _value,
      $Res Function(_$PostItemsUnknownResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusCode = null,
    Object? data = freezed,
  }) {
    return _then(_$PostItemsUnknownResponseImpl(
      statusCode: null == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int,
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PostItemsUnknownResponseImpl implements PostItemsUnknownResponse {
  const _$PostItemsUnknownResponseImpl(
      {required this.statusCode,
      final Map<String, dynamic>? data,
      final String? $type})
      : _data = data,
        $type = $type ?? 'postItemsUnknownResponse';

  factory _$PostItemsUnknownResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$PostItemsUnknownResponseImplFromJson(json);

  @override
  final int statusCode;
  final Map<String, dynamic>? _data;
  @override
  Map<String, dynamic>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableMapView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'PostItemsResponse.postItemsUnknownResponse(statusCode: $statusCode, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostItemsUnknownResponseImpl &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, statusCode, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PostItemsUnknownResponseImplCopyWith<_$PostItemsUnknownResponseImpl>
      get copyWith => __$$PostItemsUnknownResponseImplCopyWithImpl<
          _$PostItemsUnknownResponseImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Item item) postItems201Response,
    required TResult Function(int statusCode, Map<String, dynamic>? data)
        postItemsUnknownResponse,
  }) {
    return postItemsUnknownResponse(statusCode, data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Item item)? postItems201Response,
    TResult? Function(int statusCode, Map<String, dynamic>? data)?
        postItemsUnknownResponse,
  }) {
    return postItemsUnknownResponse?.call(statusCode, data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Item item)? postItems201Response,
    TResult Function(int statusCode, Map<String, dynamic>? data)?
        postItemsUnknownResponse,
    required TResult orElse(),
  }) {
    if (postItemsUnknownResponse != null) {
      return postItemsUnknownResponse(statusCode, data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PostItems201Response value) postItems201Response,
    required TResult Function(PostItemsUnknownResponse value)
        postItemsUnknownResponse,
  }) {
    return postItemsUnknownResponse(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PostItems201Response value)? postItems201Response,
    TResult? Function(PostItemsUnknownResponse value)? postItemsUnknownResponse,
  }) {
    return postItemsUnknownResponse?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PostItems201Response value)? postItems201Response,
    TResult Function(PostItemsUnknownResponse value)? postItemsUnknownResponse,
    required TResult orElse(),
  }) {
    if (postItemsUnknownResponse != null) {
      return postItemsUnknownResponse(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$PostItemsUnknownResponseImplToJson(
      this,
    );
  }
}

abstract class PostItemsUnknownResponse implements PostItemsResponse {
  const factory PostItemsUnknownResponse(
      {required final int statusCode,
      final Map<String, dynamic>? data}) = _$PostItemsUnknownResponseImpl;

  factory PostItemsUnknownResponse.fromJson(Map<String, dynamic> json) =
      _$PostItemsUnknownResponseImpl.fromJson;

  int get statusCode;
  Map<String, dynamic>? get data;
  @JsonKey(ignore: true)
  _$$PostItemsUnknownResponseImplCopyWith<_$PostItemsUnknownResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
