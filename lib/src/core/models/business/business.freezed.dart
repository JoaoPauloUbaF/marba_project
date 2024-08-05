// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'business.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BusinessModel _$BusinessModelFromJson(Map<String, dynamic> json) {
  return _BusinessModel.fromJson(json);
}

/// @nodoc
mixin _$BusinessModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  List<String>? get nameWords => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;
  AddressModel get address => throw _privateConstructorUsedError;
  BusinessStatus get status => throw _privateConstructorUsedError;
  Set<BusinessCategory> get categories => throw _privateConstructorUsedError;
  Set<String>? get categoriesWords => throw _privateConstructorUsedError;
  Set<String> get offersIds => throw _privateConstructorUsedError;
  String? get profileImageUrl => throw _privateConstructorUsedError;
  double? get minimumOrderValue => throw _privateConstructorUsedError;
  double? get deliveryFee => throw _privateConstructorUsedError;
  Set<int>? get deliveryTime => throw _privateConstructorUsedError;
  double? get baseDeliveryDistance => throw _privateConstructorUsedError;
  double? get additionalDistanceFee => throw _privateConstructorUsedError;
  Map<String, String>? get openingHours => throw _privateConstructorUsedError;
  double? get averageRating => throw _privateConstructorUsedError;
  Map<int, int>? get ratingDistribution => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BusinessModelCopyWith<BusinessModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BusinessModelCopyWith<$Res> {
  factory $BusinessModelCopyWith(
          BusinessModel value, $Res Function(BusinessModel) then) =
      _$BusinessModelCopyWithImpl<$Res, BusinessModel>;
  @useResult
  $Res call(
      {String id,
      String name,
      List<String>? nameWords,
      String email,
      String phoneNumber,
      AddressModel address,
      BusinessStatus status,
      Set<BusinessCategory> categories,
      Set<String>? categoriesWords,
      Set<String> offersIds,
      String? profileImageUrl,
      double? minimumOrderValue,
      double? deliveryFee,
      Set<int>? deliveryTime,
      double? baseDeliveryDistance,
      double? additionalDistanceFee,
      Map<String, String>? openingHours,
      double? averageRating,
      Map<int, int>? ratingDistribution});

  $AddressModelCopyWith<$Res> get address;
}

/// @nodoc
class _$BusinessModelCopyWithImpl<$Res, $Val extends BusinessModel>
    implements $BusinessModelCopyWith<$Res> {
  _$BusinessModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? nameWords = freezed,
    Object? email = null,
    Object? phoneNumber = null,
    Object? address = null,
    Object? status = null,
    Object? categories = null,
    Object? categoriesWords = freezed,
    Object? offersIds = null,
    Object? profileImageUrl = freezed,
    Object? minimumOrderValue = freezed,
    Object? deliveryFee = freezed,
    Object? deliveryTime = freezed,
    Object? baseDeliveryDistance = freezed,
    Object? additionalDistanceFee = freezed,
    Object? openingHours = freezed,
    Object? averageRating = freezed,
    Object? ratingDistribution = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      nameWords: freezed == nameWords
          ? _value.nameWords
          : nameWords // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as AddressModel,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BusinessStatus,
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as Set<BusinessCategory>,
      categoriesWords: freezed == categoriesWords
          ? _value.categoriesWords
          : categoriesWords // ignore: cast_nullable_to_non_nullable
              as Set<String>?,
      offersIds: null == offersIds
          ? _value.offersIds
          : offersIds // ignore: cast_nullable_to_non_nullable
              as Set<String>,
      profileImageUrl: freezed == profileImageUrl
          ? _value.profileImageUrl
          : profileImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      minimumOrderValue: freezed == minimumOrderValue
          ? _value.minimumOrderValue
          : minimumOrderValue // ignore: cast_nullable_to_non_nullable
              as double?,
      deliveryFee: freezed == deliveryFee
          ? _value.deliveryFee
          : deliveryFee // ignore: cast_nullable_to_non_nullable
              as double?,
      deliveryTime: freezed == deliveryTime
          ? _value.deliveryTime
          : deliveryTime // ignore: cast_nullable_to_non_nullable
              as Set<int>?,
      baseDeliveryDistance: freezed == baseDeliveryDistance
          ? _value.baseDeliveryDistance
          : baseDeliveryDistance // ignore: cast_nullable_to_non_nullable
              as double?,
      additionalDistanceFee: freezed == additionalDistanceFee
          ? _value.additionalDistanceFee
          : additionalDistanceFee // ignore: cast_nullable_to_non_nullable
              as double?,
      openingHours: freezed == openingHours
          ? _value.openingHours
          : openingHours // ignore: cast_nullable_to_non_nullable
              as Map<String, String>?,
      averageRating: freezed == averageRating
          ? _value.averageRating
          : averageRating // ignore: cast_nullable_to_non_nullable
              as double?,
      ratingDistribution: freezed == ratingDistribution
          ? _value.ratingDistribution
          : ratingDistribution // ignore: cast_nullable_to_non_nullable
              as Map<int, int>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AddressModelCopyWith<$Res> get address {
    return $AddressModelCopyWith<$Res>(_value.address, (value) {
      return _then(_value.copyWith(address: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BusinessModelImplCopyWith<$Res>
    implements $BusinessModelCopyWith<$Res> {
  factory _$$BusinessModelImplCopyWith(
          _$BusinessModelImpl value, $Res Function(_$BusinessModelImpl) then) =
      __$$BusinessModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      List<String>? nameWords,
      String email,
      String phoneNumber,
      AddressModel address,
      BusinessStatus status,
      Set<BusinessCategory> categories,
      Set<String>? categoriesWords,
      Set<String> offersIds,
      String? profileImageUrl,
      double? minimumOrderValue,
      double? deliveryFee,
      Set<int>? deliveryTime,
      double? baseDeliveryDistance,
      double? additionalDistanceFee,
      Map<String, String>? openingHours,
      double? averageRating,
      Map<int, int>? ratingDistribution});

  @override
  $AddressModelCopyWith<$Res> get address;
}

/// @nodoc
class __$$BusinessModelImplCopyWithImpl<$Res>
    extends _$BusinessModelCopyWithImpl<$Res, _$BusinessModelImpl>
    implements _$$BusinessModelImplCopyWith<$Res> {
  __$$BusinessModelImplCopyWithImpl(
      _$BusinessModelImpl _value, $Res Function(_$BusinessModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? nameWords = freezed,
    Object? email = null,
    Object? phoneNumber = null,
    Object? address = null,
    Object? status = null,
    Object? categories = null,
    Object? categoriesWords = freezed,
    Object? offersIds = null,
    Object? profileImageUrl = freezed,
    Object? minimumOrderValue = freezed,
    Object? deliveryFee = freezed,
    Object? deliveryTime = freezed,
    Object? baseDeliveryDistance = freezed,
    Object? additionalDistanceFee = freezed,
    Object? openingHours = freezed,
    Object? averageRating = freezed,
    Object? ratingDistribution = freezed,
  }) {
    return _then(_$BusinessModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      nameWords: freezed == nameWords
          ? _value._nameWords
          : nameWords // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as AddressModel,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BusinessStatus,
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as Set<BusinessCategory>,
      categoriesWords: freezed == categoriesWords
          ? _value._categoriesWords
          : categoriesWords // ignore: cast_nullable_to_non_nullable
              as Set<String>?,
      offersIds: null == offersIds
          ? _value._offersIds
          : offersIds // ignore: cast_nullable_to_non_nullable
              as Set<String>,
      profileImageUrl: freezed == profileImageUrl
          ? _value.profileImageUrl
          : profileImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      minimumOrderValue: freezed == minimumOrderValue
          ? _value.minimumOrderValue
          : minimumOrderValue // ignore: cast_nullable_to_non_nullable
              as double?,
      deliveryFee: freezed == deliveryFee
          ? _value.deliveryFee
          : deliveryFee // ignore: cast_nullable_to_non_nullable
              as double?,
      deliveryTime: freezed == deliveryTime
          ? _value._deliveryTime
          : deliveryTime // ignore: cast_nullable_to_non_nullable
              as Set<int>?,
      baseDeliveryDistance: freezed == baseDeliveryDistance
          ? _value.baseDeliveryDistance
          : baseDeliveryDistance // ignore: cast_nullable_to_non_nullable
              as double?,
      additionalDistanceFee: freezed == additionalDistanceFee
          ? _value.additionalDistanceFee
          : additionalDistanceFee // ignore: cast_nullable_to_non_nullable
              as double?,
      openingHours: freezed == openingHours
          ? _value._openingHours
          : openingHours // ignore: cast_nullable_to_non_nullable
              as Map<String, String>?,
      averageRating: freezed == averageRating
          ? _value.averageRating
          : averageRating // ignore: cast_nullable_to_non_nullable
              as double?,
      ratingDistribution: freezed == ratingDistribution
          ? _value._ratingDistribution
          : ratingDistribution // ignore: cast_nullable_to_non_nullable
              as Map<int, int>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BusinessModelImpl implements _BusinessModel {
  _$BusinessModelImpl(
      {required this.id,
      required this.name,
      final List<String>? nameWords,
      required this.email,
      required this.phoneNumber,
      required this.address,
      required this.status,
      required final Set<BusinessCategory> categories,
      final Set<String>? categoriesWords,
      required final Set<String> offersIds,
      this.profileImageUrl,
      this.minimumOrderValue,
      this.deliveryFee,
      final Set<int>? deliveryTime,
      this.baseDeliveryDistance,
      this.additionalDistanceFee,
      final Map<String, String>? openingHours,
      this.averageRating,
      final Map<int, int>? ratingDistribution})
      : _nameWords = nameWords,
        _categories = categories,
        _categoriesWords = categoriesWords,
        _offersIds = offersIds,
        _deliveryTime = deliveryTime,
        _openingHours = openingHours,
        _ratingDistribution = ratingDistribution;

  factory _$BusinessModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BusinessModelImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  final List<String>? _nameWords;
  @override
  List<String>? get nameWords {
    final value = _nameWords;
    if (value == null) return null;
    if (_nameWords is EqualUnmodifiableListView) return _nameWords;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String email;
  @override
  final String phoneNumber;
  @override
  final AddressModel address;
  @override
  final BusinessStatus status;
  final Set<BusinessCategory> _categories;
  @override
  Set<BusinessCategory> get categories {
    if (_categories is EqualUnmodifiableSetView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_categories);
  }

  final Set<String>? _categoriesWords;
  @override
  Set<String>? get categoriesWords {
    final value = _categoriesWords;
    if (value == null) return null;
    if (_categoriesWords is EqualUnmodifiableSetView) return _categoriesWords;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(value);
  }

  final Set<String> _offersIds;
  @override
  Set<String> get offersIds {
    if (_offersIds is EqualUnmodifiableSetView) return _offersIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_offersIds);
  }

  @override
  final String? profileImageUrl;
  @override
  final double? minimumOrderValue;
  @override
  final double? deliveryFee;
  final Set<int>? _deliveryTime;
  @override
  Set<int>? get deliveryTime {
    final value = _deliveryTime;
    if (value == null) return null;
    if (_deliveryTime is EqualUnmodifiableSetView) return _deliveryTime;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(value);
  }

  @override
  final double? baseDeliveryDistance;
  @override
  final double? additionalDistanceFee;
  final Map<String, String>? _openingHours;
  @override
  Map<String, String>? get openingHours {
    final value = _openingHours;
    if (value == null) return null;
    if (_openingHours is EqualUnmodifiableMapView) return _openingHours;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final double? averageRating;
  final Map<int, int>? _ratingDistribution;
  @override
  Map<int, int>? get ratingDistribution {
    final value = _ratingDistribution;
    if (value == null) return null;
    if (_ratingDistribution is EqualUnmodifiableMapView)
      return _ratingDistribution;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'BusinessModel(id: $id, name: $name, nameWords: $nameWords, email: $email, phoneNumber: $phoneNumber, address: $address, status: $status, categories: $categories, categoriesWords: $categoriesWords, offersIds: $offersIds, profileImageUrl: $profileImageUrl, minimumOrderValue: $minimumOrderValue, deliveryFee: $deliveryFee, deliveryTime: $deliveryTime, baseDeliveryDistance: $baseDeliveryDistance, additionalDistanceFee: $additionalDistanceFee, openingHours: $openingHours, averageRating: $averageRating, ratingDistribution: $ratingDistribution)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BusinessModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality()
                .equals(other._nameWords, _nameWords) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            const DeepCollectionEquality()
                .equals(other._categoriesWords, _categoriesWords) &&
            const DeepCollectionEquality()
                .equals(other._offersIds, _offersIds) &&
            (identical(other.profileImageUrl, profileImageUrl) ||
                other.profileImageUrl == profileImageUrl) &&
            (identical(other.minimumOrderValue, minimumOrderValue) ||
                other.minimumOrderValue == minimumOrderValue) &&
            (identical(other.deliveryFee, deliveryFee) ||
                other.deliveryFee == deliveryFee) &&
            const DeepCollectionEquality()
                .equals(other._deliveryTime, _deliveryTime) &&
            (identical(other.baseDeliveryDistance, baseDeliveryDistance) ||
                other.baseDeliveryDistance == baseDeliveryDistance) &&
            (identical(other.additionalDistanceFee, additionalDistanceFee) ||
                other.additionalDistanceFee == additionalDistanceFee) &&
            const DeepCollectionEquality()
                .equals(other._openingHours, _openingHours) &&
            (identical(other.averageRating, averageRating) ||
                other.averageRating == averageRating) &&
            const DeepCollectionEquality()
                .equals(other._ratingDistribution, _ratingDistribution));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        name,
        const DeepCollectionEquality().hash(_nameWords),
        email,
        phoneNumber,
        address,
        status,
        const DeepCollectionEquality().hash(_categories),
        const DeepCollectionEquality().hash(_categoriesWords),
        const DeepCollectionEquality().hash(_offersIds),
        profileImageUrl,
        minimumOrderValue,
        deliveryFee,
        const DeepCollectionEquality().hash(_deliveryTime),
        baseDeliveryDistance,
        additionalDistanceFee,
        const DeepCollectionEquality().hash(_openingHours),
        averageRating,
        const DeepCollectionEquality().hash(_ratingDistribution)
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BusinessModelImplCopyWith<_$BusinessModelImpl> get copyWith =>
      __$$BusinessModelImplCopyWithImpl<_$BusinessModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BusinessModelImplToJson(
      this,
    );
  }
}

abstract class _BusinessModel implements BusinessModel {
  factory _BusinessModel(
      {required final String id,
      required final String name,
      final List<String>? nameWords,
      required final String email,
      required final String phoneNumber,
      required final AddressModel address,
      required final BusinessStatus status,
      required final Set<BusinessCategory> categories,
      final Set<String>? categoriesWords,
      required final Set<String> offersIds,
      final String? profileImageUrl,
      final double? minimumOrderValue,
      final double? deliveryFee,
      final Set<int>? deliveryTime,
      final double? baseDeliveryDistance,
      final double? additionalDistanceFee,
      final Map<String, String>? openingHours,
      final double? averageRating,
      final Map<int, int>? ratingDistribution}) = _$BusinessModelImpl;

  factory _BusinessModel.fromJson(Map<String, dynamic> json) =
      _$BusinessModelImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  List<String>? get nameWords;
  @override
  String get email;
  @override
  String get phoneNumber;
  @override
  AddressModel get address;
  @override
  BusinessStatus get status;
  @override
  Set<BusinessCategory> get categories;
  @override
  Set<String>? get categoriesWords;
  @override
  Set<String> get offersIds;
  @override
  String? get profileImageUrl;
  @override
  double? get minimumOrderValue;
  @override
  double? get deliveryFee;
  @override
  Set<int>? get deliveryTime;
  @override
  double? get baseDeliveryDistance;
  @override
  double? get additionalDistanceFee;
  @override
  Map<String, String>? get openingHours;
  @override
  double? get averageRating;
  @override
  Map<int, int>? get ratingDistribution;
  @override
  @JsonKey(ignore: true)
  _$$BusinessModelImplCopyWith<_$BusinessModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
