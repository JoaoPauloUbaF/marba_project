// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'business_delivery.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BusinessDeliveryModel _$BusinessDeliveryModelFromJson(
    Map<String, dynamic> json) {
  return _BusinessDeliveryModel.fromJson(json);
}

/// @nodoc
mixin _$BusinessDeliveryModel {
  String get baseDeliveryFee => throw _privateConstructorUsedError;
  String get additionalDistanceFee => throw _privateConstructorUsedError;
  String get baseDistance => throw _privateConstructorUsedError;
  String get minimumDeliveryTime => throw _privateConstructorUsedError;
  String get maximumDeliveryTime => throw _privateConstructorUsedError;
  String get minimumOrderValue => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BusinessDeliveryModelCopyWith<BusinessDeliveryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BusinessDeliveryModelCopyWith<$Res> {
  factory $BusinessDeliveryModelCopyWith(BusinessDeliveryModel value,
          $Res Function(BusinessDeliveryModel) then) =
      _$BusinessDeliveryModelCopyWithImpl<$Res, BusinessDeliveryModel>;
  @useResult
  $Res call(
      {String baseDeliveryFee,
      String additionalDistanceFee,
      String baseDistance,
      String minimumDeliveryTime,
      String maximumDeliveryTime,
      String minimumOrderValue});
}

/// @nodoc
class _$BusinessDeliveryModelCopyWithImpl<$Res,
        $Val extends BusinessDeliveryModel>
    implements $BusinessDeliveryModelCopyWith<$Res> {
  _$BusinessDeliveryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? baseDeliveryFee = null,
    Object? additionalDistanceFee = null,
    Object? baseDistance = null,
    Object? minimumDeliveryTime = null,
    Object? maximumDeliveryTime = null,
    Object? minimumOrderValue = null,
  }) {
    return _then(_value.copyWith(
      baseDeliveryFee: null == baseDeliveryFee
          ? _value.baseDeliveryFee
          : baseDeliveryFee // ignore: cast_nullable_to_non_nullable
              as String,
      additionalDistanceFee: null == additionalDistanceFee
          ? _value.additionalDistanceFee
          : additionalDistanceFee // ignore: cast_nullable_to_non_nullable
              as String,
      baseDistance: null == baseDistance
          ? _value.baseDistance
          : baseDistance // ignore: cast_nullable_to_non_nullable
              as String,
      minimumDeliveryTime: null == minimumDeliveryTime
          ? _value.minimumDeliveryTime
          : minimumDeliveryTime // ignore: cast_nullable_to_non_nullable
              as String,
      maximumDeliveryTime: null == maximumDeliveryTime
          ? _value.maximumDeliveryTime
          : maximumDeliveryTime // ignore: cast_nullable_to_non_nullable
              as String,
      minimumOrderValue: null == minimumOrderValue
          ? _value.minimumOrderValue
          : minimumOrderValue // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BusinessDeliveryModelImplCopyWith<$Res>
    implements $BusinessDeliveryModelCopyWith<$Res> {
  factory _$$BusinessDeliveryModelImplCopyWith(
          _$BusinessDeliveryModelImpl value,
          $Res Function(_$BusinessDeliveryModelImpl) then) =
      __$$BusinessDeliveryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String baseDeliveryFee,
      String additionalDistanceFee,
      String baseDistance,
      String minimumDeliveryTime,
      String maximumDeliveryTime,
      String minimumOrderValue});
}

/// @nodoc
class __$$BusinessDeliveryModelImplCopyWithImpl<$Res>
    extends _$BusinessDeliveryModelCopyWithImpl<$Res,
        _$BusinessDeliveryModelImpl>
    implements _$$BusinessDeliveryModelImplCopyWith<$Res> {
  __$$BusinessDeliveryModelImplCopyWithImpl(_$BusinessDeliveryModelImpl _value,
      $Res Function(_$BusinessDeliveryModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? baseDeliveryFee = null,
    Object? additionalDistanceFee = null,
    Object? baseDistance = null,
    Object? minimumDeliveryTime = null,
    Object? maximumDeliveryTime = null,
    Object? minimumOrderValue = null,
  }) {
    return _then(_$BusinessDeliveryModelImpl(
      baseDeliveryFee: null == baseDeliveryFee
          ? _value.baseDeliveryFee
          : baseDeliveryFee // ignore: cast_nullable_to_non_nullable
              as String,
      additionalDistanceFee: null == additionalDistanceFee
          ? _value.additionalDistanceFee
          : additionalDistanceFee // ignore: cast_nullable_to_non_nullable
              as String,
      baseDistance: null == baseDistance
          ? _value.baseDistance
          : baseDistance // ignore: cast_nullable_to_non_nullable
              as String,
      minimumDeliveryTime: null == minimumDeliveryTime
          ? _value.minimumDeliveryTime
          : minimumDeliveryTime // ignore: cast_nullable_to_non_nullable
              as String,
      maximumDeliveryTime: null == maximumDeliveryTime
          ? _value.maximumDeliveryTime
          : maximumDeliveryTime // ignore: cast_nullable_to_non_nullable
              as String,
      minimumOrderValue: null == minimumOrderValue
          ? _value.minimumOrderValue
          : minimumOrderValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BusinessDeliveryModelImpl implements _BusinessDeliveryModel {
  _$BusinessDeliveryModelImpl(
      {required this.baseDeliveryFee,
      required this.additionalDistanceFee,
      required this.baseDistance,
      required this.minimumDeliveryTime,
      required this.maximumDeliveryTime,
      required this.minimumOrderValue});

  factory _$BusinessDeliveryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BusinessDeliveryModelImplFromJson(json);

  @override
  final String baseDeliveryFee;
  @override
  final String additionalDistanceFee;
  @override
  final String baseDistance;
  @override
  final String minimumDeliveryTime;
  @override
  final String maximumDeliveryTime;
  @override
  final String minimumOrderValue;

  @override
  String toString() {
    return 'BusinessDeliveryModel(baseDeliveryFee: $baseDeliveryFee, additionalDistanceFee: $additionalDistanceFee, baseDistance: $baseDistance, minimumDeliveryTime: $minimumDeliveryTime, maximumDeliveryTime: $maximumDeliveryTime, minimumOrderValue: $minimumOrderValue)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BusinessDeliveryModelImpl &&
            (identical(other.baseDeliveryFee, baseDeliveryFee) ||
                other.baseDeliveryFee == baseDeliveryFee) &&
            (identical(other.additionalDistanceFee, additionalDistanceFee) ||
                other.additionalDistanceFee == additionalDistanceFee) &&
            (identical(other.baseDistance, baseDistance) ||
                other.baseDistance == baseDistance) &&
            (identical(other.minimumDeliveryTime, minimumDeliveryTime) ||
                other.minimumDeliveryTime == minimumDeliveryTime) &&
            (identical(other.maximumDeliveryTime, maximumDeliveryTime) ||
                other.maximumDeliveryTime == maximumDeliveryTime) &&
            (identical(other.minimumOrderValue, minimumOrderValue) ||
                other.minimumOrderValue == minimumOrderValue));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      baseDeliveryFee,
      additionalDistanceFee,
      baseDistance,
      minimumDeliveryTime,
      maximumDeliveryTime,
      minimumOrderValue);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BusinessDeliveryModelImplCopyWith<_$BusinessDeliveryModelImpl>
      get copyWith => __$$BusinessDeliveryModelImplCopyWithImpl<
          _$BusinessDeliveryModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BusinessDeliveryModelImplToJson(
      this,
    );
  }
}

abstract class _BusinessDeliveryModel implements BusinessDeliveryModel {
  factory _BusinessDeliveryModel(
      {required final String baseDeliveryFee,
      required final String additionalDistanceFee,
      required final String baseDistance,
      required final String minimumDeliveryTime,
      required final String maximumDeliveryTime,
      required final String minimumOrderValue}) = _$BusinessDeliveryModelImpl;

  factory _BusinessDeliveryModel.fromJson(Map<String, dynamic> json) =
      _$BusinessDeliveryModelImpl.fromJson;

  @override
  String get baseDeliveryFee;
  @override
  String get additionalDistanceFee;
  @override
  String get baseDistance;
  @override
  String get minimumDeliveryTime;
  @override
  String get maximumDeliveryTime;
  @override
  String get minimumOrderValue;
  @override
  @JsonKey(ignore: true)
  _$$BusinessDeliveryModelImplCopyWith<_$BusinessDeliveryModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
