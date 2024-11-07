// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OrderModel _$OrderModelFromJson(Map<String, dynamic> json) {
  return _OrderModel.fromJson(json);
}

/// @nodoc
mixin _$OrderModel {
  String get id => throw _privateConstructorUsedError;
  String get customerId => throw _privateConstructorUsedError;
  List<String> get businessOrdersIds => throw _privateConstructorUsedError;
  double get total => throw _privateConstructorUsedError;
  double get totalDeliveryFee => throw _privateConstructorUsedError;
  double get discount => throw _privateConstructorUsedError;
  AddressModel get address => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  PaymentMethod get paymentMethod => throw _privateConstructorUsedError;
  DateTime? get paymentConfirmedAt => throw _privateConstructorUsedError;
  DateTime? get canceledAt => throw _privateConstructorUsedError;

  /// Serializes this OrderModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OrderModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderModelCopyWith<OrderModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderModelCopyWith<$Res> {
  factory $OrderModelCopyWith(
          OrderModel value, $Res Function(OrderModel) then) =
      _$OrderModelCopyWithImpl<$Res, OrderModel>;
  @useResult
  $Res call(
      {String id,
      String customerId,
      List<String> businessOrdersIds,
      double total,
      double totalDeliveryFee,
      double discount,
      AddressModel address,
      DateTime createdAt,
      DateTime updatedAt,
      PaymentMethod paymentMethod,
      DateTime? paymentConfirmedAt,
      DateTime? canceledAt});

  $AddressModelCopyWith<$Res> get address;
}

/// @nodoc
class _$OrderModelCopyWithImpl<$Res, $Val extends OrderModel>
    implements $OrderModelCopyWith<$Res> {
  _$OrderModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? customerId = null,
    Object? businessOrdersIds = null,
    Object? total = null,
    Object? totalDeliveryFee = null,
    Object? discount = null,
    Object? address = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? paymentMethod = null,
    Object? paymentConfirmedAt = freezed,
    Object? canceledAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      customerId: null == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String,
      businessOrdersIds: null == businessOrdersIds
          ? _value.businessOrdersIds
          : businessOrdersIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
      totalDeliveryFee: null == totalDeliveryFee
          ? _value.totalDeliveryFee
          : totalDeliveryFee // ignore: cast_nullable_to_non_nullable
              as double,
      discount: null == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as AddressModel,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as PaymentMethod,
      paymentConfirmedAt: freezed == paymentConfirmedAt
          ? _value.paymentConfirmedAt
          : paymentConfirmedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      canceledAt: freezed == canceledAt
          ? _value.canceledAt
          : canceledAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  /// Create a copy of OrderModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AddressModelCopyWith<$Res> get address {
    return $AddressModelCopyWith<$Res>(_value.address, (value) {
      return _then(_value.copyWith(address: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OrderModelImplCopyWith<$Res>
    implements $OrderModelCopyWith<$Res> {
  factory _$$OrderModelImplCopyWith(
          _$OrderModelImpl value, $Res Function(_$OrderModelImpl) then) =
      __$$OrderModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String customerId,
      List<String> businessOrdersIds,
      double total,
      double totalDeliveryFee,
      double discount,
      AddressModel address,
      DateTime createdAt,
      DateTime updatedAt,
      PaymentMethod paymentMethod,
      DateTime? paymentConfirmedAt,
      DateTime? canceledAt});

  @override
  $AddressModelCopyWith<$Res> get address;
}

/// @nodoc
class __$$OrderModelImplCopyWithImpl<$Res>
    extends _$OrderModelCopyWithImpl<$Res, _$OrderModelImpl>
    implements _$$OrderModelImplCopyWith<$Res> {
  __$$OrderModelImplCopyWithImpl(
      _$OrderModelImpl _value, $Res Function(_$OrderModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrderModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? customerId = null,
    Object? businessOrdersIds = null,
    Object? total = null,
    Object? totalDeliveryFee = null,
    Object? discount = null,
    Object? address = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? paymentMethod = null,
    Object? paymentConfirmedAt = freezed,
    Object? canceledAt = freezed,
  }) {
    return _then(_$OrderModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      customerId: null == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String,
      businessOrdersIds: null == businessOrdersIds
          ? _value._businessOrdersIds
          : businessOrdersIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
      totalDeliveryFee: null == totalDeliveryFee
          ? _value.totalDeliveryFee
          : totalDeliveryFee // ignore: cast_nullable_to_non_nullable
              as double,
      discount: null == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as AddressModel,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as PaymentMethod,
      paymentConfirmedAt: freezed == paymentConfirmedAt
          ? _value.paymentConfirmedAt
          : paymentConfirmedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      canceledAt: freezed == canceledAt
          ? _value.canceledAt
          : canceledAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderModelImpl implements _OrderModel {
  _$OrderModelImpl(
      {required this.id,
      required this.customerId,
      required final List<String> businessOrdersIds,
      required this.total,
      required this.totalDeliveryFee,
      required this.discount,
      required this.address,
      required this.createdAt,
      required this.updatedAt,
      required this.paymentMethod,
      this.paymentConfirmedAt,
      this.canceledAt})
      : _businessOrdersIds = businessOrdersIds;

  factory _$OrderModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderModelImplFromJson(json);

  @override
  final String id;
  @override
  final String customerId;
  final List<String> _businessOrdersIds;
  @override
  List<String> get businessOrdersIds {
    if (_businessOrdersIds is EqualUnmodifiableListView)
      return _businessOrdersIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_businessOrdersIds);
  }

  @override
  final double total;
  @override
  final double totalDeliveryFee;
  @override
  final double discount;
  @override
  final AddressModel address;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final PaymentMethod paymentMethod;
  @override
  final DateTime? paymentConfirmedAt;
  @override
  final DateTime? canceledAt;

  @override
  String toString() {
    return 'OrderModel(id: $id, customerId: $customerId, businessOrdersIds: $businessOrdersIds, total: $total, totalDeliveryFee: $totalDeliveryFee, discount: $discount, address: $address, createdAt: $createdAt, updatedAt: $updatedAt, paymentMethod: $paymentMethod, paymentConfirmedAt: $paymentConfirmedAt, canceledAt: $canceledAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            const DeepCollectionEquality()
                .equals(other._businessOrdersIds, _businessOrdersIds) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.totalDeliveryFee, totalDeliveryFee) ||
                other.totalDeliveryFee == totalDeliveryFee) &&
            (identical(other.discount, discount) ||
                other.discount == discount) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.paymentConfirmedAt, paymentConfirmedAt) ||
                other.paymentConfirmedAt == paymentConfirmedAt) &&
            (identical(other.canceledAt, canceledAt) ||
                other.canceledAt == canceledAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      customerId,
      const DeepCollectionEquality().hash(_businessOrdersIds),
      total,
      totalDeliveryFee,
      discount,
      address,
      createdAt,
      updatedAt,
      paymentMethod,
      paymentConfirmedAt,
      canceledAt);

  /// Create a copy of OrderModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderModelImplCopyWith<_$OrderModelImpl> get copyWith =>
      __$$OrderModelImplCopyWithImpl<_$OrderModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderModelImplToJson(
      this,
    );
  }
}

abstract class _OrderModel implements OrderModel {
  factory _OrderModel(
      {required final String id,
      required final String customerId,
      required final List<String> businessOrdersIds,
      required final double total,
      required final double totalDeliveryFee,
      required final double discount,
      required final AddressModel address,
      required final DateTime createdAt,
      required final DateTime updatedAt,
      required final PaymentMethod paymentMethod,
      final DateTime? paymentConfirmedAt,
      final DateTime? canceledAt}) = _$OrderModelImpl;

  factory _OrderModel.fromJson(Map<String, dynamic> json) =
      _$OrderModelImpl.fromJson;

  @override
  String get id;
  @override
  String get customerId;
  @override
  List<String> get businessOrdersIds;
  @override
  double get total;
  @override
  double get totalDeliveryFee;
  @override
  double get discount;
  @override
  AddressModel get address;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  PaymentMethod get paymentMethod;
  @override
  DateTime? get paymentConfirmedAt;
  @override
  DateTime? get canceledAt;

  /// Create a copy of OrderModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderModelImplCopyWith<_$OrderModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
