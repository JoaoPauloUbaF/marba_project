// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'business_order_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BusinessOrderItem _$BusinessOrderItemFromJson(Map<String, dynamic> json) {
  return _BusinessOrderItem.fromJson(json);
}

/// @nodoc
mixin _$BusinessOrderItem {
  String get id => throw _privateConstructorUsedError;
  String get businessOrderId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  double get cost => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  DateTime? get deliveredAt => throw _privateConstructorUsedError;
  DateTime? get canceledAt => throw _privateConstructorUsedError;
  DateTime? get scheduledAt => throw _privateConstructorUsedError;
  BusinessOrderItemStatus get status => throw _privateConstructorUsedError;

  /// Serializes this BusinessOrderItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BusinessOrderItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BusinessOrderItemCopyWith<BusinessOrderItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BusinessOrderItemCopyWith<$Res> {
  factory $BusinessOrderItemCopyWith(
          BusinessOrderItem value, $Res Function(BusinessOrderItem) then) =
      _$BusinessOrderItemCopyWithImpl<$Res, BusinessOrderItem>;
  @useResult
  $Res call(
      {String id,
      String businessOrderId,
      String name,
      String imageUrl,
      double price,
      double cost,
      int quantity,
      DateTime? deliveredAt,
      DateTime? canceledAt,
      DateTime? scheduledAt,
      BusinessOrderItemStatus status});
}

/// @nodoc
class _$BusinessOrderItemCopyWithImpl<$Res, $Val extends BusinessOrderItem>
    implements $BusinessOrderItemCopyWith<$Res> {
  _$BusinessOrderItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BusinessOrderItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? businessOrderId = null,
    Object? name = null,
    Object? imageUrl = null,
    Object? price = null,
    Object? cost = null,
    Object? quantity = null,
    Object? deliveredAt = freezed,
    Object? canceledAt = freezed,
    Object? scheduledAt = freezed,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      businessOrderId: null == businessOrderId
          ? _value.businessOrderId
          : businessOrderId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      cost: null == cost
          ? _value.cost
          : cost // ignore: cast_nullable_to_non_nullable
              as double,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      deliveredAt: freezed == deliveredAt
          ? _value.deliveredAt
          : deliveredAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      canceledAt: freezed == canceledAt
          ? _value.canceledAt
          : canceledAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      scheduledAt: freezed == scheduledAt
          ? _value.scheduledAt
          : scheduledAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BusinessOrderItemStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BusinessOrderItemImplCopyWith<$Res>
    implements $BusinessOrderItemCopyWith<$Res> {
  factory _$$BusinessOrderItemImplCopyWith(_$BusinessOrderItemImpl value,
          $Res Function(_$BusinessOrderItemImpl) then) =
      __$$BusinessOrderItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String businessOrderId,
      String name,
      String imageUrl,
      double price,
      double cost,
      int quantity,
      DateTime? deliveredAt,
      DateTime? canceledAt,
      DateTime? scheduledAt,
      BusinessOrderItemStatus status});
}

/// @nodoc
class __$$BusinessOrderItemImplCopyWithImpl<$Res>
    extends _$BusinessOrderItemCopyWithImpl<$Res, _$BusinessOrderItemImpl>
    implements _$$BusinessOrderItemImplCopyWith<$Res> {
  __$$BusinessOrderItemImplCopyWithImpl(_$BusinessOrderItemImpl _value,
      $Res Function(_$BusinessOrderItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of BusinessOrderItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? businessOrderId = null,
    Object? name = null,
    Object? imageUrl = null,
    Object? price = null,
    Object? cost = null,
    Object? quantity = null,
    Object? deliveredAt = freezed,
    Object? canceledAt = freezed,
    Object? scheduledAt = freezed,
    Object? status = null,
  }) {
    return _then(_$BusinessOrderItemImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      businessOrderId: null == businessOrderId
          ? _value.businessOrderId
          : businessOrderId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      cost: null == cost
          ? _value.cost
          : cost // ignore: cast_nullable_to_non_nullable
              as double,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      deliveredAt: freezed == deliveredAt
          ? _value.deliveredAt
          : deliveredAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      canceledAt: freezed == canceledAt
          ? _value.canceledAt
          : canceledAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      scheduledAt: freezed == scheduledAt
          ? _value.scheduledAt
          : scheduledAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BusinessOrderItemStatus,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BusinessOrderItemImpl implements _BusinessOrderItem {
  _$BusinessOrderItemImpl(
      {required this.id,
      required this.businessOrderId,
      required this.name,
      required this.imageUrl,
      required this.price,
      required this.cost,
      required this.quantity,
      this.deliveredAt,
      this.canceledAt,
      this.scheduledAt,
      required this.status});

  factory _$BusinessOrderItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$BusinessOrderItemImplFromJson(json);

  @override
  final String id;
  @override
  final String businessOrderId;
  @override
  final String name;
  @override
  final String imageUrl;
  @override
  final double price;
  @override
  final double cost;
  @override
  final int quantity;
  @override
  final DateTime? deliveredAt;
  @override
  final DateTime? canceledAt;
  @override
  final DateTime? scheduledAt;
  @override
  final BusinessOrderItemStatus status;

  @override
  String toString() {
    return 'BusinessOrderItem(id: $id, businessOrderId: $businessOrderId, name: $name, imageUrl: $imageUrl, price: $price, cost: $cost, quantity: $quantity, deliveredAt: $deliveredAt, canceledAt: $canceledAt, scheduledAt: $scheduledAt, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BusinessOrderItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.businessOrderId, businessOrderId) ||
                other.businessOrderId == businessOrderId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.cost, cost) || other.cost == cost) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.deliveredAt, deliveredAt) ||
                other.deliveredAt == deliveredAt) &&
            (identical(other.canceledAt, canceledAt) ||
                other.canceledAt == canceledAt) &&
            (identical(other.scheduledAt, scheduledAt) ||
                other.scheduledAt == scheduledAt) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      businessOrderId,
      name,
      imageUrl,
      price,
      cost,
      quantity,
      deliveredAt,
      canceledAt,
      scheduledAt,
      status);

  /// Create a copy of BusinessOrderItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BusinessOrderItemImplCopyWith<_$BusinessOrderItemImpl> get copyWith =>
      __$$BusinessOrderItemImplCopyWithImpl<_$BusinessOrderItemImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BusinessOrderItemImplToJson(
      this,
    );
  }
}

abstract class _BusinessOrderItem implements BusinessOrderItem {
  factory _BusinessOrderItem(
      {required final String id,
      required final String businessOrderId,
      required final String name,
      required final String imageUrl,
      required final double price,
      required final double cost,
      required final int quantity,
      final DateTime? deliveredAt,
      final DateTime? canceledAt,
      final DateTime? scheduledAt,
      required final BusinessOrderItemStatus status}) = _$BusinessOrderItemImpl;

  factory _BusinessOrderItem.fromJson(Map<String, dynamic> json) =
      _$BusinessOrderItemImpl.fromJson;

  @override
  String get id;
  @override
  String get businessOrderId;
  @override
  String get name;
  @override
  String get imageUrl;
  @override
  double get price;
  @override
  double get cost;
  @override
  int get quantity;
  @override
  DateTime? get deliveredAt;
  @override
  DateTime? get canceledAt;
  @override
  DateTime? get scheduledAt;
  @override
  BusinessOrderItemStatus get status;

  /// Create a copy of BusinessOrderItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BusinessOrderItemImplCopyWith<_$BusinessOrderItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
