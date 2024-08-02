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
  String get email => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;
  AddressModel get address => throw _privateConstructorUsedError;
  BusinessStatus get status => throw _privateConstructorUsedError;
  Set<BusinessCategory> get categories => throw _privateConstructorUsedError;
  Set<String> get offersIds => throw _privateConstructorUsedError;
  double? get deliveryFee => throw _privateConstructorUsedError;
  double? get minimumOrderValue => throw _privateConstructorUsedError;
  Set<double>? get deliveryTime => throw _privateConstructorUsedError;
  Map<String, String>? get openingHours => throw _privateConstructorUsedError;
  String? get profileImageUrl => throw _privateConstructorUsedError;
  Set<String>? get categoriesWords => throw _privateConstructorUsedError;
  List<String>? get nameWords => throw _privateConstructorUsedError;
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
      String email,
      String phoneNumber,
      AddressModel address,
      BusinessStatus status,
      Set<BusinessCategory> categories,
      Set<String> offersIds,
      double? deliveryFee,
      double? minimumOrderValue,
      Set<double>? deliveryTime,
      Map<String, String>? openingHours,
      String? profileImageUrl,
      Set<String>? categoriesWords,
      List<String>? nameWords,
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
    Object? email = null,
    Object? phoneNumber = null,
    Object? address = null,
    Object? status = null,
    Object? categories = null,
    Object? offersIds = null,
    Object? deliveryFee = freezed,
    Object? minimumOrderValue = freezed,
    Object? deliveryTime = freezed,
    Object? openingHours = freezed,
    Object? profileImageUrl = freezed,
    Object? categoriesWords = freezed,
    Object? nameWords = freezed,
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
      offersIds: null == offersIds
          ? _value.offersIds
          : offersIds // ignore: cast_nullable_to_non_nullable
              as Set<String>,
      deliveryFee: freezed == deliveryFee
          ? _value.deliveryFee
          : deliveryFee // ignore: cast_nullable_to_non_nullable
              as double?,
      minimumOrderValue: freezed == minimumOrderValue
          ? _value.minimumOrderValue
          : minimumOrderValue // ignore: cast_nullable_to_non_nullable
              as double?,
      deliveryTime: freezed == deliveryTime
          ? _value.deliveryTime
          : deliveryTime // ignore: cast_nullable_to_non_nullable
              as Set<double>?,
      openingHours: freezed == openingHours
          ? _value.openingHours
          : openingHours // ignore: cast_nullable_to_non_nullable
              as Map<String, String>?,
      profileImageUrl: freezed == profileImageUrl
          ? _value.profileImageUrl
          : profileImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      categoriesWords: freezed == categoriesWords
          ? _value.categoriesWords
          : categoriesWords // ignore: cast_nullable_to_non_nullable
              as Set<String>?,
      nameWords: freezed == nameWords
          ? _value.nameWords
          : nameWords // ignore: cast_nullable_to_non_nullable
              as List<String>?,
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
      String email,
      String phoneNumber,
      AddressModel address,
      BusinessStatus status,
      Set<BusinessCategory> categories,
      Set<String> offersIds,
      double? deliveryFee,
      double? minimumOrderValue,
      Set<double>? deliveryTime,
      Map<String, String>? openingHours,
      String? profileImageUrl,
      Set<String>? categoriesWords,
      List<String>? nameWords,
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
    Object? email = null,
    Object? phoneNumber = null,
    Object? address = null,
    Object? status = null,
    Object? categories = null,
    Object? offersIds = null,
    Object? deliveryFee = freezed,
    Object? minimumOrderValue = freezed,
    Object? deliveryTime = freezed,
    Object? openingHours = freezed,
    Object? profileImageUrl = freezed,
    Object? categoriesWords = freezed,
    Object? nameWords = freezed,
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
      offersIds: null == offersIds
          ? _value._offersIds
          : offersIds // ignore: cast_nullable_to_non_nullable
              as Set<String>,
      deliveryFee: freezed == deliveryFee
          ? _value.deliveryFee
          : deliveryFee // ignore: cast_nullable_to_non_nullable
              as double?,
      minimumOrderValue: freezed == minimumOrderValue
          ? _value.minimumOrderValue
          : minimumOrderValue // ignore: cast_nullable_to_non_nullable
              as double?,
      deliveryTime: freezed == deliveryTime
          ? _value._deliveryTime
          : deliveryTime // ignore: cast_nullable_to_non_nullable
              as Set<double>?,
      openingHours: freezed == openingHours
          ? _value._openingHours
          : openingHours // ignore: cast_nullable_to_non_nullable
              as Map<String, String>?,
      profileImageUrl: freezed == profileImageUrl
          ? _value.profileImageUrl
          : profileImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      categoriesWords: freezed == categoriesWords
          ? _value._categoriesWords
          : categoriesWords // ignore: cast_nullable_to_non_nullable
              as Set<String>?,
      nameWords: freezed == nameWords
          ? _value._nameWords
          : nameWords // ignore: cast_nullable_to_non_nullable
              as List<String>?,
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
      required this.email,
      required this.phoneNumber,
      required this.address,
      required this.status,
      required final Set<BusinessCategory> categories,
      required final Set<String> offersIds,
      this.deliveryFee,
      this.minimumOrderValue,
      final Set<double>? deliveryTime,
      final Map<String, String>? openingHours,
      this.profileImageUrl,
      final Set<String>? categoriesWords,
      final List<String>? nameWords,
      this.averageRating,
      final Map<int, int>? ratingDistribution})
      : _categories = categories,
        _offersIds = offersIds,
        _deliveryTime = deliveryTime,
        _openingHours = openingHours,
        _categoriesWords = categoriesWords,
        _nameWords = nameWords,
        _ratingDistribution = ratingDistribution;

  factory _$BusinessModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BusinessModelImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
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

  final Set<String> _offersIds;
  @override
  Set<String> get offersIds {
    if (_offersIds is EqualUnmodifiableSetView) return _offersIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_offersIds);
  }

  @override
  final double? deliveryFee;
  @override
  final double? minimumOrderValue;
  final Set<double>? _deliveryTime;
  @override
  Set<double>? get deliveryTime {
    final value = _deliveryTime;
    if (value == null) return null;
    if (_deliveryTime is EqualUnmodifiableSetView) return _deliveryTime;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(value);
  }

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
  final String? profileImageUrl;
  final Set<String>? _categoriesWords;
  @override
  Set<String>? get categoriesWords {
    final value = _categoriesWords;
    if (value == null) return null;
    if (_categoriesWords is EqualUnmodifiableSetView) return _categoriesWords;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(value);
  }

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
    return 'BusinessModel(id: $id, name: $name, email: $email, phoneNumber: $phoneNumber, address: $address, status: $status, categories: $categories, offersIds: $offersIds, deliveryFee: $deliveryFee, minimumOrderValue: $minimumOrderValue, deliveryTime: $deliveryTime, openingHours: $openingHours, profileImageUrl: $profileImageUrl, categoriesWords: $categoriesWords, nameWords: $nameWords, averageRating: $averageRating, ratingDistribution: $ratingDistribution)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BusinessModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            const DeepCollectionEquality()
                .equals(other._offersIds, _offersIds) &&
            (identical(other.deliveryFee, deliveryFee) ||
                other.deliveryFee == deliveryFee) &&
            (identical(other.minimumOrderValue, minimumOrderValue) ||
                other.minimumOrderValue == minimumOrderValue) &&
            const DeepCollectionEquality()
                .equals(other._deliveryTime, _deliveryTime) &&
            const DeepCollectionEquality()
                .equals(other._openingHours, _openingHours) &&
            (identical(other.profileImageUrl, profileImageUrl) ||
                other.profileImageUrl == profileImageUrl) &&
            const DeepCollectionEquality()
                .equals(other._categoriesWords, _categoriesWords) &&
            const DeepCollectionEquality()
                .equals(other._nameWords, _nameWords) &&
            (identical(other.averageRating, averageRating) ||
                other.averageRating == averageRating) &&
            const DeepCollectionEquality()
                .equals(other._ratingDistribution, _ratingDistribution));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      email,
      phoneNumber,
      address,
      status,
      const DeepCollectionEquality().hash(_categories),
      const DeepCollectionEquality().hash(_offersIds),
      deliveryFee,
      minimumOrderValue,
      const DeepCollectionEquality().hash(_deliveryTime),
      const DeepCollectionEquality().hash(_openingHours),
      profileImageUrl,
      const DeepCollectionEquality().hash(_categoriesWords),
      const DeepCollectionEquality().hash(_nameWords),
      averageRating,
      const DeepCollectionEquality().hash(_ratingDistribution));

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
      required final String email,
      required final String phoneNumber,
      required final AddressModel address,
      required final BusinessStatus status,
      required final Set<BusinessCategory> categories,
      required final Set<String> offersIds,
      final double? deliveryFee,
      final double? minimumOrderValue,
      final Set<double>? deliveryTime,
      final Map<String, String>? openingHours,
      final String? profileImageUrl,
      final Set<String>? categoriesWords,
      final List<String>? nameWords,
      final double? averageRating,
      final Map<int, int>? ratingDistribution}) = _$BusinessModelImpl;

  factory _BusinessModel.fromJson(Map<String, dynamic> json) =
      _$BusinessModelImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
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
  Set<String> get offersIds;
  @override
  double? get deliveryFee;
  @override
  double? get minimumOrderValue;
  @override
  Set<double>? get deliveryTime;
  @override
  Map<String, String>? get openingHours;
  @override
  String? get profileImageUrl;
  @override
  Set<String>? get categoriesWords;
  @override
  List<String>? get nameWords;
  @override
  double? get averageRating;
  @override
  Map<int, int>? get ratingDistribution;
  @override
  @JsonKey(ignore: true)
  _$$BusinessModelImplCopyWith<_$BusinessModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
