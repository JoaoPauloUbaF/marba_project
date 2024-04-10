// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'business_order_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BusinessOrder _$BusinessOrderFromJson(Map<String, dynamic> json) {
  return _BusinessOrder.fromJson(json);
}

/// @nodoc
mixin _$BusinessOrder {
  String get businessId => throw _privateConstructorUsedError;
  Set<BusinessOrderItem> get items => throw _privateConstructorUsedError;
  BusinessOrderStatus get status => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  DateTime? get canceledAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BusinessOrderCopyWith<BusinessOrder> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BusinessOrderCopyWith<$Res> {
  factory $BusinessOrderCopyWith(
          BusinessOrder value, $Res Function(BusinessOrder) then) =
      _$BusinessOrderCopyWithImpl<$Res, BusinessOrder>;
  @useResult
  $Res call(
      {String businessId,
      Set<BusinessOrderItem> items,
      BusinessOrderStatus status,
      DateTime createdAt,
      DateTime updatedAt,
      DateTime? canceledAt});
}

/// @nodoc
class _$BusinessOrderCopyWithImpl<$Res, $Val extends BusinessOrder>
    implements $BusinessOrderCopyWith<$Res> {
  _$BusinessOrderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? businessId = null,
    Object? items = null,
    Object? status = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? canceledAt = freezed,
  }) {
    return _then(_value.copyWith(
      businessId: null == businessId
          ? _value.businessId
          : businessId // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as Set<BusinessOrderItem>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BusinessOrderStatus,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      canceledAt: freezed == canceledAt
          ? _value.canceledAt
          : canceledAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BusinessOrderImplCopyWith<$Res>
    implements $BusinessOrderCopyWith<$Res> {
  factory _$$BusinessOrderImplCopyWith(
          _$BusinessOrderImpl value, $Res Function(_$BusinessOrderImpl) then) =
      __$$BusinessOrderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String businessId,
      Set<BusinessOrderItem> items,
      BusinessOrderStatus status,
      DateTime createdAt,
      DateTime updatedAt,
      DateTime? canceledAt});
}

/// @nodoc
class __$$BusinessOrderImplCopyWithImpl<$Res>
    extends _$BusinessOrderCopyWithImpl<$Res, _$BusinessOrderImpl>
    implements _$$BusinessOrderImplCopyWith<$Res> {
  __$$BusinessOrderImplCopyWithImpl(
      _$BusinessOrderImpl _value, $Res Function(_$BusinessOrderImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? businessId = null,
    Object? items = null,
    Object? status = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? canceledAt = freezed,
  }) {
    return _then(_$BusinessOrderImpl(
      businessId: null == businessId
          ? _value.businessId
          : businessId // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as Set<BusinessOrderItem>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BusinessOrderStatus,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      canceledAt: freezed == canceledAt
          ? _value.canceledAt
          : canceledAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BusinessOrderImpl implements _BusinessOrder {
  _$BusinessOrderImpl(
      {required this.businessId,
      required final Set<BusinessOrderItem> items,
      required this.status,
      required this.createdAt,
      required this.updatedAt,
      this.canceledAt})
      : _items = items;

  factory _$BusinessOrderImpl.fromJson(Map<String, dynamic> json) =>
      _$$BusinessOrderImplFromJson(json);

  @override
  final String businessId;
  final Set<BusinessOrderItem> _items;
  @override
  Set<BusinessOrderItem> get items {
    if (_items is EqualUnmodifiableSetView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_items);
  }

  @override
  final BusinessOrderStatus status;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final DateTime? canceledAt;

  @override
  String toString() {
    return 'BusinessOrder(businessId: $businessId, items: $items, status: $status, createdAt: $createdAt, updatedAt: $updatedAt, canceledAt: $canceledAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BusinessOrderImpl &&
            (identical(other.businessId, businessId) ||
                other.businessId == businessId) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.canceledAt, canceledAt) ||
                other.canceledAt == canceledAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      businessId,
      const DeepCollectionEquality().hash(_items),
      status,
      createdAt,
      updatedAt,
      canceledAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BusinessOrderImplCopyWith<_$BusinessOrderImpl> get copyWith =>
      __$$BusinessOrderImplCopyWithImpl<_$BusinessOrderImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BusinessOrderImplToJson(
      this,
    );
  }
}

abstract class _BusinessOrder implements BusinessOrder {
  factory _BusinessOrder(
      {required final String businessId,
      required final Set<BusinessOrderItem> items,
      required final BusinessOrderStatus status,
      required final DateTime createdAt,
      required final DateTime updatedAt,
      final DateTime? canceledAt}) = _$BusinessOrderImpl;

  factory _BusinessOrder.fromJson(Map<String, dynamic> json) =
      _$BusinessOrderImpl.fromJson;

  @override
  String get businessId;
  @override
  Set<BusinessOrderItem> get items;
  @override
  BusinessOrderStatus get status;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  DateTime? get canceledAt;
  @override
  @JsonKey(ignore: true)
  _$$BusinessOrderImplCopyWith<_$BusinessOrderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}