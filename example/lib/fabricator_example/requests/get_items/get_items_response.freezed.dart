// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_items_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GetItemsResponse _$GetItemsResponseFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'getItems200Response':
      return GetItems200Response.fromJson(json);
    case 'getItemsUnknownResponse':
      return GetItemsUnknownResponse.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'GetItemsResponse',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$GetItemsResponse {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Item> items) getItems200Response,
    required TResult Function(int statusCode, Map<String, dynamic>? data)
        getItemsUnknownResponse,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Item> items)? getItems200Response,
    TResult? Function(int statusCode, Map<String, dynamic>? data)?
        getItemsUnknownResponse,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Item> items)? getItems200Response,
    TResult Function(int statusCode, Map<String, dynamic>? data)?
        getItemsUnknownResponse,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetItems200Response value) getItems200Response,
    required TResult Function(GetItemsUnknownResponse value)
        getItemsUnknownResponse,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetItems200Response value)? getItems200Response,
    TResult? Function(GetItemsUnknownResponse value)? getItemsUnknownResponse,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetItems200Response value)? getItems200Response,
    TResult Function(GetItemsUnknownResponse value)? getItemsUnknownResponse,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetItemsResponseCopyWith<$Res> {
  factory $GetItemsResponseCopyWith(
          GetItemsResponse value, $Res Function(GetItemsResponse) then) =
      _$GetItemsResponseCopyWithImpl<$Res, GetItemsResponse>;
}

/// @nodoc
class _$GetItemsResponseCopyWithImpl<$Res, $Val extends GetItemsResponse>
    implements $GetItemsResponseCopyWith<$Res> {
  _$GetItemsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$GetItems200ResponseImplCopyWith<$Res> {
  factory _$$GetItems200ResponseImplCopyWith(_$GetItems200ResponseImpl value,
          $Res Function(_$GetItems200ResponseImpl) then) =
      __$$GetItems200ResponseImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Item> items});
}

/// @nodoc
class __$$GetItems200ResponseImplCopyWithImpl<$Res>
    extends _$GetItemsResponseCopyWithImpl<$Res, _$GetItems200ResponseImpl>
    implements _$$GetItems200ResponseImplCopyWith<$Res> {
  __$$GetItems200ResponseImplCopyWithImpl(_$GetItems200ResponseImpl _value,
      $Res Function(_$GetItems200ResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
  }) {
    return _then(_$GetItems200ResponseImpl(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<Item>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetItems200ResponseImpl implements GetItems200Response {
  const _$GetItems200ResponseImpl(
      {required final List<Item> items, final String? $type})
      : _items = items,
        $type = $type ?? 'getItems200Response';

  factory _$GetItems200ResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetItems200ResponseImplFromJson(json);

  final List<Item> _items;
  @override
  List<Item> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'GetItemsResponse.getItems200Response(items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetItems200ResponseImpl &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetItems200ResponseImplCopyWith<_$GetItems200ResponseImpl> get copyWith =>
      __$$GetItems200ResponseImplCopyWithImpl<_$GetItems200ResponseImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Item> items) getItems200Response,
    required TResult Function(int statusCode, Map<String, dynamic>? data)
        getItemsUnknownResponse,
  }) {
    return getItems200Response(items);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Item> items)? getItems200Response,
    TResult? Function(int statusCode, Map<String, dynamic>? data)?
        getItemsUnknownResponse,
  }) {
    return getItems200Response?.call(items);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Item> items)? getItems200Response,
    TResult Function(int statusCode, Map<String, dynamic>? data)?
        getItemsUnknownResponse,
    required TResult orElse(),
  }) {
    if (getItems200Response != null) {
      return getItems200Response(items);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetItems200Response value) getItems200Response,
    required TResult Function(GetItemsUnknownResponse value)
        getItemsUnknownResponse,
  }) {
    return getItems200Response(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetItems200Response value)? getItems200Response,
    TResult? Function(GetItemsUnknownResponse value)? getItemsUnknownResponse,
  }) {
    return getItems200Response?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetItems200Response value)? getItems200Response,
    TResult Function(GetItemsUnknownResponse value)? getItemsUnknownResponse,
    required TResult orElse(),
  }) {
    if (getItems200Response != null) {
      return getItems200Response(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$GetItems200ResponseImplToJson(
      this,
    );
  }
}

abstract class GetItems200Response implements GetItemsResponse {
  const factory GetItems200Response({required final List<Item> items}) =
      _$GetItems200ResponseImpl;

  factory GetItems200Response.fromJson(Map<String, dynamic> json) =
      _$GetItems200ResponseImpl.fromJson;

  List<Item> get items;
  @JsonKey(ignore: true)
  _$$GetItems200ResponseImplCopyWith<_$GetItems200ResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetItemsUnknownResponseImplCopyWith<$Res> {
  factory _$$GetItemsUnknownResponseImplCopyWith(
          _$GetItemsUnknownResponseImpl value,
          $Res Function(_$GetItemsUnknownResponseImpl) then) =
      __$$GetItemsUnknownResponseImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int statusCode, Map<String, dynamic>? data});
}

/// @nodoc
class __$$GetItemsUnknownResponseImplCopyWithImpl<$Res>
    extends _$GetItemsResponseCopyWithImpl<$Res, _$GetItemsUnknownResponseImpl>
    implements _$$GetItemsUnknownResponseImplCopyWith<$Res> {
  __$$GetItemsUnknownResponseImplCopyWithImpl(
      _$GetItemsUnknownResponseImpl _value,
      $Res Function(_$GetItemsUnknownResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusCode = null,
    Object? data = freezed,
  }) {
    return _then(_$GetItemsUnknownResponseImpl(
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
class _$GetItemsUnknownResponseImpl implements GetItemsUnknownResponse {
  const _$GetItemsUnknownResponseImpl(
      {required this.statusCode,
      final Map<String, dynamic>? data,
      final String? $type})
      : _data = data,
        $type = $type ?? 'getItemsUnknownResponse';

  factory _$GetItemsUnknownResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetItemsUnknownResponseImplFromJson(json);

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
    return 'GetItemsResponse.getItemsUnknownResponse(statusCode: $statusCode, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetItemsUnknownResponseImpl &&
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
  _$$GetItemsUnknownResponseImplCopyWith<_$GetItemsUnknownResponseImpl>
      get copyWith => __$$GetItemsUnknownResponseImplCopyWithImpl<
          _$GetItemsUnknownResponseImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Item> items) getItems200Response,
    required TResult Function(int statusCode, Map<String, dynamic>? data)
        getItemsUnknownResponse,
  }) {
    return getItemsUnknownResponse(statusCode, data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Item> items)? getItems200Response,
    TResult? Function(int statusCode, Map<String, dynamic>? data)?
        getItemsUnknownResponse,
  }) {
    return getItemsUnknownResponse?.call(statusCode, data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Item> items)? getItems200Response,
    TResult Function(int statusCode, Map<String, dynamic>? data)?
        getItemsUnknownResponse,
    required TResult orElse(),
  }) {
    if (getItemsUnknownResponse != null) {
      return getItemsUnknownResponse(statusCode, data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetItems200Response value) getItems200Response,
    required TResult Function(GetItemsUnknownResponse value)
        getItemsUnknownResponse,
  }) {
    return getItemsUnknownResponse(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetItems200Response value)? getItems200Response,
    TResult? Function(GetItemsUnknownResponse value)? getItemsUnknownResponse,
  }) {
    return getItemsUnknownResponse?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetItems200Response value)? getItems200Response,
    TResult Function(GetItemsUnknownResponse value)? getItemsUnknownResponse,
    required TResult orElse(),
  }) {
    if (getItemsUnknownResponse != null) {
      return getItemsUnknownResponse(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$GetItemsUnknownResponseImplToJson(
      this,
    );
  }
}

abstract class GetItemsUnknownResponse implements GetItemsResponse {
  const factory GetItemsUnknownResponse(
      {required final int statusCode,
      final Map<String, dynamic>? data}) = _$GetItemsUnknownResponseImpl;

  factory GetItemsUnknownResponse.fromJson(Map<String, dynamic> json) =
      _$GetItemsUnknownResponseImpl.fromJson;

  int get statusCode;
  Map<String, dynamic>? get data;
  @JsonKey(ignore: true)
  _$$GetItemsUnknownResponseImplCopyWith<_$GetItemsUnknownResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
