// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'service.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Service _$ServiceFromJson(Map<String, dynamic> json) {
  return _Service.fromJson(json);
}

/// @nodoc
mixin _$Service {
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  Address get address => throw _privateConstructorUsedError;
  DateTime get scheduledAt => throw _privateConstructorUsedError;
  String get serviceProfessionalName => throw _privateConstructorUsedError;
  String get contractorName => throw _privateConstructorUsedError;
  String? get additionalInfo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ServiceCopyWith<Service> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServiceCopyWith<$Res> {
  factory $ServiceCopyWith(Service value, $Res Function(Service) then) =
      _$ServiceCopyWithImpl<$Res, Service>;
  @useResult
  $Res call(
      {String title,
      String description,
      double price,
      String imageUrl,
      String status,
      Address address,
      DateTime scheduledAt,
      String serviceProfessionalName,
      String contractorName,
      String? additionalInfo});

  $AddressCopyWith<$Res> get address;
}

/// @nodoc
class _$ServiceCopyWithImpl<$Res, $Val extends Service>
    implements $ServiceCopyWith<$Res> {
  _$ServiceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
    Object? price = null,
    Object? imageUrl = null,
    Object? status = null,
    Object? address = null,
    Object? scheduledAt = null,
    Object? serviceProfessionalName = null,
    Object? contractorName = null,
    Object? additionalInfo = freezed,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as Address,
      scheduledAt: null == scheduledAt
          ? _value.scheduledAt
          : scheduledAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      serviceProfessionalName: null == serviceProfessionalName
          ? _value.serviceProfessionalName
          : serviceProfessionalName // ignore: cast_nullable_to_non_nullable
              as String,
      contractorName: null == contractorName
          ? _value.contractorName
          : contractorName // ignore: cast_nullable_to_non_nullable
              as String,
      additionalInfo: freezed == additionalInfo
          ? _value.additionalInfo
          : additionalInfo // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AddressCopyWith<$Res> get address {
    return $AddressCopyWith<$Res>(_value.address, (value) {
      return _then(_value.copyWith(address: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ServiceImplCopyWith<$Res> implements $ServiceCopyWith<$Res> {
  factory _$$ServiceImplCopyWith(
          _$ServiceImpl value, $Res Function(_$ServiceImpl) then) =
      __$$ServiceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title,
      String description,
      double price,
      String imageUrl,
      String status,
      Address address,
      DateTime scheduledAt,
      String serviceProfessionalName,
      String contractorName,
      String? additionalInfo});

  @override
  $AddressCopyWith<$Res> get address;
}

/// @nodoc
class __$$ServiceImplCopyWithImpl<$Res>
    extends _$ServiceCopyWithImpl<$Res, _$ServiceImpl>
    implements _$$ServiceImplCopyWith<$Res> {
  __$$ServiceImplCopyWithImpl(
      _$ServiceImpl _value, $Res Function(_$ServiceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
    Object? price = null,
    Object? imageUrl = null,
    Object? status = null,
    Object? address = null,
    Object? scheduledAt = null,
    Object? serviceProfessionalName = null,
    Object? contractorName = null,
    Object? additionalInfo = freezed,
  }) {
    return _then(_$ServiceImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as Address,
      scheduledAt: null == scheduledAt
          ? _value.scheduledAt
          : scheduledAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      serviceProfessionalName: null == serviceProfessionalName
          ? _value.serviceProfessionalName
          : serviceProfessionalName // ignore: cast_nullable_to_non_nullable
              as String,
      contractorName: null == contractorName
          ? _value.contractorName
          : contractorName // ignore: cast_nullable_to_non_nullable
              as String,
      additionalInfo: freezed == additionalInfo
          ? _value.additionalInfo
          : additionalInfo // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ServiceImpl implements _Service {
  _$ServiceImpl(
      {required this.title,
      required this.description,
      required this.price,
      required this.imageUrl,
      required this.status,
      required this.address,
      required this.scheduledAt,
      required this.serviceProfessionalName,
      required this.contractorName,
      required this.additionalInfo});

  factory _$ServiceImpl.fromJson(Map<String, dynamic> json) =>
      _$$ServiceImplFromJson(json);

  @override
  final String title;
  @override
  final String description;
  @override
  final double price;
  @override
  final String imageUrl;
  @override
  final String status;
  @override
  final Address address;
  @override
  final DateTime scheduledAt;
  @override
  final String serviceProfessionalName;
  @override
  final String contractorName;
  @override
  final String? additionalInfo;

  @override
  String toString() {
    return 'Service(title: $title, description: $description, price: $price, imageUrl: $imageUrl, status: $status, address: $address, scheduledAt: $scheduledAt, serviceProfessionalName: $serviceProfessionalName, contractorName: $contractorName, additionalInfo: $additionalInfo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServiceImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.scheduledAt, scheduledAt) ||
                other.scheduledAt == scheduledAt) &&
            (identical(
                    other.serviceProfessionalName, serviceProfessionalName) ||
                other.serviceProfessionalName == serviceProfessionalName) &&
            (identical(other.contractorName, contractorName) ||
                other.contractorName == contractorName) &&
            (identical(other.additionalInfo, additionalInfo) ||
                other.additionalInfo == additionalInfo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      title,
      description,
      price,
      imageUrl,
      status,
      address,
      scheduledAt,
      serviceProfessionalName,
      contractorName,
      additionalInfo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ServiceImplCopyWith<_$ServiceImpl> get copyWith =>
      __$$ServiceImplCopyWithImpl<_$ServiceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ServiceImplToJson(
      this,
    );
  }
}

abstract class _Service implements Service {
  factory _Service(
      {required final String title,
      required final String description,
      required final double price,
      required final String imageUrl,
      required final String status,
      required final Address address,
      required final DateTime scheduledAt,
      required final String serviceProfessionalName,
      required final String contractorName,
      required final String? additionalInfo}) = _$ServiceImpl;

  factory _Service.fromJson(Map<String, dynamic> json) = _$ServiceImpl.fromJson;

  @override
  String get title;
  @override
  String get description;
  @override
  double get price;
  @override
  String get imageUrl;
  @override
  String get status;
  @override
  Address get address;
  @override
  DateTime get scheduledAt;
  @override
  String get serviceProfessionalName;
  @override
  String get contractorName;
  @override
  String? get additionalInfo;
  @override
  @JsonKey(ignore: true)
  _$$ServiceImplCopyWith<_$ServiceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
