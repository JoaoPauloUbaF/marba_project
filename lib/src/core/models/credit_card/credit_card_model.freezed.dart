// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'credit_card_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CreditCardModel _$CreditCardModelFromJson(Map<String, dynamic> json) {
  return _CreditCardModel.fromJson(json);
}

/// @nodoc
mixin _$CreditCardModel {
  String get id => throw _privateConstructorUsedError;
  String get cardNumber => throw _privateConstructorUsedError;
  String get cardHolderName => throw _privateConstructorUsedError;
  String get expirationDate => throw _privateConstructorUsedError;
  String get cvv => throw _privateConstructorUsedError;
  String get brand => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this CreditCardModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreditCardModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreditCardModelCopyWith<CreditCardModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreditCardModelCopyWith<$Res> {
  factory $CreditCardModelCopyWith(
          CreditCardModel value, $Res Function(CreditCardModel) then) =
      _$CreditCardModelCopyWithImpl<$Res, CreditCardModel>;
  @useResult
  $Res call(
      {String id,
      String cardNumber,
      String cardHolderName,
      String expirationDate,
      String cvv,
      String brand,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class _$CreditCardModelCopyWithImpl<$Res, $Val extends CreditCardModel>
    implements $CreditCardModelCopyWith<$Res> {
  _$CreditCardModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreditCardModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? cardNumber = null,
    Object? cardHolderName = null,
    Object? expirationDate = null,
    Object? cvv = null,
    Object? brand = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      cardNumber: null == cardNumber
          ? _value.cardNumber
          : cardNumber // ignore: cast_nullable_to_non_nullable
              as String,
      cardHolderName: null == cardHolderName
          ? _value.cardHolderName
          : cardHolderName // ignore: cast_nullable_to_non_nullable
              as String,
      expirationDate: null == expirationDate
          ? _value.expirationDate
          : expirationDate // ignore: cast_nullable_to_non_nullable
              as String,
      cvv: null == cvv
          ? _value.cvv
          : cvv // ignore: cast_nullable_to_non_nullable
              as String,
      brand: null == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreditCardModelImplCopyWith<$Res>
    implements $CreditCardModelCopyWith<$Res> {
  factory _$$CreditCardModelImplCopyWith(_$CreditCardModelImpl value,
          $Res Function(_$CreditCardModelImpl) then) =
      __$$CreditCardModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String cardNumber,
      String cardHolderName,
      String expirationDate,
      String cvv,
      String brand,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class __$$CreditCardModelImplCopyWithImpl<$Res>
    extends _$CreditCardModelCopyWithImpl<$Res, _$CreditCardModelImpl>
    implements _$$CreditCardModelImplCopyWith<$Res> {
  __$$CreditCardModelImplCopyWithImpl(
      _$CreditCardModelImpl _value, $Res Function(_$CreditCardModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreditCardModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? cardNumber = null,
    Object? cardHolderName = null,
    Object? expirationDate = null,
    Object? cvv = null,
    Object? brand = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$CreditCardModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      cardNumber: null == cardNumber
          ? _value.cardNumber
          : cardNumber // ignore: cast_nullable_to_non_nullable
              as String,
      cardHolderName: null == cardHolderName
          ? _value.cardHolderName
          : cardHolderName // ignore: cast_nullable_to_non_nullable
              as String,
      expirationDate: null == expirationDate
          ? _value.expirationDate
          : expirationDate // ignore: cast_nullable_to_non_nullable
              as String,
      cvv: null == cvv
          ? _value.cvv
          : cvv // ignore: cast_nullable_to_non_nullable
              as String,
      brand: null == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreditCardModelImpl implements _CreditCardModel {
  _$CreditCardModelImpl(
      {required this.id,
      required this.cardNumber,
      required this.cardHolderName,
      required this.expirationDate,
      required this.cvv,
      required this.brand,
      required this.createdAt,
      required this.updatedAt});

  factory _$CreditCardModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreditCardModelImplFromJson(json);

  @override
  final String id;
  @override
  final String cardNumber;
  @override
  final String cardHolderName;
  @override
  final String expirationDate;
  @override
  final String cvv;
  @override
  final String brand;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'CreditCardModel(id: $id, cardNumber: $cardNumber, cardHolderName: $cardHolderName, expirationDate: $expirationDate, cvv: $cvv, brand: $brand, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreditCardModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.cardNumber, cardNumber) ||
                other.cardNumber == cardNumber) &&
            (identical(other.cardHolderName, cardHolderName) ||
                other.cardHolderName == cardHolderName) &&
            (identical(other.expirationDate, expirationDate) ||
                other.expirationDate == expirationDate) &&
            (identical(other.cvv, cvv) || other.cvv == cvv) &&
            (identical(other.brand, brand) || other.brand == brand) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, cardNumber, cardHolderName,
      expirationDate, cvv, brand, createdAt, updatedAt);

  /// Create a copy of CreditCardModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreditCardModelImplCopyWith<_$CreditCardModelImpl> get copyWith =>
      __$$CreditCardModelImplCopyWithImpl<_$CreditCardModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreditCardModelImplToJson(
      this,
    );
  }
}

abstract class _CreditCardModel implements CreditCardModel {
  factory _CreditCardModel(
      {required final String id,
      required final String cardNumber,
      required final String cardHolderName,
      required final String expirationDate,
      required final String cvv,
      required final String brand,
      required final DateTime createdAt,
      required final DateTime updatedAt}) = _$CreditCardModelImpl;

  factory _CreditCardModel.fromJson(Map<String, dynamic> json) =
      _$CreditCardModelImpl.fromJson;

  @override
  String get id;
  @override
  String get cardNumber;
  @override
  String get cardHolderName;
  @override
  String get expirationDate;
  @override
  String get cvv;
  @override
  String get brand;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;

  /// Create a copy of CreditCardModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreditCardModelImplCopyWith<_$CreditCardModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
