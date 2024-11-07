// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return _UserModel.fromJson(json);
}

/// @nodoc
mixin _$UserModel {
  String get id => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;
  List<AddressModel>? get deliveryAddresses =>
      throw _privateConstructorUsedError;
  String? get photoUrl => throw _privateConstructorUsedError;
  bool get isBusinessOwner => throw _privateConstructorUsedError;
  Set<String>? get ownedBusinessIds => throw _privateConstructorUsedError;
  Set<String>? get favoriteOfferIds => throw _privateConstructorUsedError;
  List<String>? get searchHistory => throw _privateConstructorUsedError;
  Cart? get cart => throw _privateConstructorUsedError;
  List<CreditCardModel>? get creditCards => throw _privateConstructorUsedError;
  List<ReviewModel>? get reviews => throw _privateConstructorUsedError;

  /// Serializes this UserModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res, UserModel>;
  @useResult
  $Res call(
      {String id,
      String phoneNumber,
      List<AddressModel>? deliveryAddresses,
      String? photoUrl,
      bool isBusinessOwner,
      Set<String>? ownedBusinessIds,
      Set<String>? favoriteOfferIds,
      List<String>? searchHistory,
      Cart? cart,
      List<CreditCardModel>? creditCards,
      List<ReviewModel>? reviews});

  $CartCopyWith<$Res>? get cart;
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res, $Val extends UserModel>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? phoneNumber = null,
    Object? deliveryAddresses = freezed,
    Object? photoUrl = freezed,
    Object? isBusinessOwner = null,
    Object? ownedBusinessIds = freezed,
    Object? favoriteOfferIds = freezed,
    Object? searchHistory = freezed,
    Object? cart = freezed,
    Object? creditCards = freezed,
    Object? reviews = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryAddresses: freezed == deliveryAddresses
          ? _value.deliveryAddresses
          : deliveryAddresses // ignore: cast_nullable_to_non_nullable
              as List<AddressModel>?,
      photoUrl: freezed == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      isBusinessOwner: null == isBusinessOwner
          ? _value.isBusinessOwner
          : isBusinessOwner // ignore: cast_nullable_to_non_nullable
              as bool,
      ownedBusinessIds: freezed == ownedBusinessIds
          ? _value.ownedBusinessIds
          : ownedBusinessIds // ignore: cast_nullable_to_non_nullable
              as Set<String>?,
      favoriteOfferIds: freezed == favoriteOfferIds
          ? _value.favoriteOfferIds
          : favoriteOfferIds // ignore: cast_nullable_to_non_nullable
              as Set<String>?,
      searchHistory: freezed == searchHistory
          ? _value.searchHistory
          : searchHistory // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      cart: freezed == cart
          ? _value.cart
          : cart // ignore: cast_nullable_to_non_nullable
              as Cart?,
      creditCards: freezed == creditCards
          ? _value.creditCards
          : creditCards // ignore: cast_nullable_to_non_nullable
              as List<CreditCardModel>?,
      reviews: freezed == reviews
          ? _value.reviews
          : reviews // ignore: cast_nullable_to_non_nullable
              as List<ReviewModel>?,
    ) as $Val);
  }

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CartCopyWith<$Res>? get cart {
    if (_value.cart == null) {
      return null;
    }

    return $CartCopyWith<$Res>(_value.cart!, (value) {
      return _then(_value.copyWith(cart: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserModelImplCopyWith<$Res>
    implements $UserModelCopyWith<$Res> {
  factory _$$UserModelImplCopyWith(
          _$UserModelImpl value, $Res Function(_$UserModelImpl) then) =
      __$$UserModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String phoneNumber,
      List<AddressModel>? deliveryAddresses,
      String? photoUrl,
      bool isBusinessOwner,
      Set<String>? ownedBusinessIds,
      Set<String>? favoriteOfferIds,
      List<String>? searchHistory,
      Cart? cart,
      List<CreditCardModel>? creditCards,
      List<ReviewModel>? reviews});

  @override
  $CartCopyWith<$Res>? get cart;
}

/// @nodoc
class __$$UserModelImplCopyWithImpl<$Res>
    extends _$UserModelCopyWithImpl<$Res, _$UserModelImpl>
    implements _$$UserModelImplCopyWith<$Res> {
  __$$UserModelImplCopyWithImpl(
      _$UserModelImpl _value, $Res Function(_$UserModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? phoneNumber = null,
    Object? deliveryAddresses = freezed,
    Object? photoUrl = freezed,
    Object? isBusinessOwner = null,
    Object? ownedBusinessIds = freezed,
    Object? favoriteOfferIds = freezed,
    Object? searchHistory = freezed,
    Object? cart = freezed,
    Object? creditCards = freezed,
    Object? reviews = freezed,
  }) {
    return _then(_$UserModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryAddresses: freezed == deliveryAddresses
          ? _value._deliveryAddresses
          : deliveryAddresses // ignore: cast_nullable_to_non_nullable
              as List<AddressModel>?,
      photoUrl: freezed == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      isBusinessOwner: null == isBusinessOwner
          ? _value.isBusinessOwner
          : isBusinessOwner // ignore: cast_nullable_to_non_nullable
              as bool,
      ownedBusinessIds: freezed == ownedBusinessIds
          ? _value._ownedBusinessIds
          : ownedBusinessIds // ignore: cast_nullable_to_non_nullable
              as Set<String>?,
      favoriteOfferIds: freezed == favoriteOfferIds
          ? _value._favoriteOfferIds
          : favoriteOfferIds // ignore: cast_nullable_to_non_nullable
              as Set<String>?,
      searchHistory: freezed == searchHistory
          ? _value._searchHistory
          : searchHistory // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      cart: freezed == cart
          ? _value.cart
          : cart // ignore: cast_nullable_to_non_nullable
              as Cart?,
      creditCards: freezed == creditCards
          ? _value._creditCards
          : creditCards // ignore: cast_nullable_to_non_nullable
              as List<CreditCardModel>?,
      reviews: freezed == reviews
          ? _value._reviews
          : reviews // ignore: cast_nullable_to_non_nullable
              as List<ReviewModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserModelImpl extends _UserModel {
  const _$UserModelImpl(
      {required this.id,
      required this.phoneNumber,
      final List<AddressModel>? deliveryAddresses,
      this.photoUrl,
      this.isBusinessOwner = false,
      final Set<String>? ownedBusinessIds,
      final Set<String>? favoriteOfferIds,
      final List<String>? searchHistory,
      this.cart,
      final List<CreditCardModel>? creditCards,
      final List<ReviewModel>? reviews})
      : _deliveryAddresses = deliveryAddresses,
        _ownedBusinessIds = ownedBusinessIds,
        _favoriteOfferIds = favoriteOfferIds,
        _searchHistory = searchHistory,
        _creditCards = creditCards,
        _reviews = reviews,
        super._();

  factory _$UserModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserModelImplFromJson(json);

  @override
  final String id;
  @override
  final String phoneNumber;
  final List<AddressModel>? _deliveryAddresses;
  @override
  List<AddressModel>? get deliveryAddresses {
    final value = _deliveryAddresses;
    if (value == null) return null;
    if (_deliveryAddresses is EqualUnmodifiableListView)
      return _deliveryAddresses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? photoUrl;
  @override
  @JsonKey()
  final bool isBusinessOwner;
  final Set<String>? _ownedBusinessIds;
  @override
  Set<String>? get ownedBusinessIds {
    final value = _ownedBusinessIds;
    if (value == null) return null;
    if (_ownedBusinessIds is EqualUnmodifiableSetView) return _ownedBusinessIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(value);
  }

  final Set<String>? _favoriteOfferIds;
  @override
  Set<String>? get favoriteOfferIds {
    final value = _favoriteOfferIds;
    if (value == null) return null;
    if (_favoriteOfferIds is EqualUnmodifiableSetView) return _favoriteOfferIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(value);
  }

  final List<String>? _searchHistory;
  @override
  List<String>? get searchHistory {
    final value = _searchHistory;
    if (value == null) return null;
    if (_searchHistory is EqualUnmodifiableListView) return _searchHistory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final Cart? cart;
  final List<CreditCardModel>? _creditCards;
  @override
  List<CreditCardModel>? get creditCards {
    final value = _creditCards;
    if (value == null) return null;
    if (_creditCards is EqualUnmodifiableListView) return _creditCards;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<ReviewModel>? _reviews;
  @override
  List<ReviewModel>? get reviews {
    final value = _reviews;
    if (value == null) return null;
    if (_reviews is EqualUnmodifiableListView) return _reviews;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'UserModel(id: $id, phoneNumber: $phoneNumber, deliveryAddresses: $deliveryAddresses, photoUrl: $photoUrl, isBusinessOwner: $isBusinessOwner, ownedBusinessIds: $ownedBusinessIds, favoriteOfferIds: $favoriteOfferIds, searchHistory: $searchHistory, cart: $cart, creditCards: $creditCards, reviews: $reviews)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            const DeepCollectionEquality()
                .equals(other._deliveryAddresses, _deliveryAddresses) &&
            (identical(other.photoUrl, photoUrl) ||
                other.photoUrl == photoUrl) &&
            (identical(other.isBusinessOwner, isBusinessOwner) ||
                other.isBusinessOwner == isBusinessOwner) &&
            const DeepCollectionEquality()
                .equals(other._ownedBusinessIds, _ownedBusinessIds) &&
            const DeepCollectionEquality()
                .equals(other._favoriteOfferIds, _favoriteOfferIds) &&
            const DeepCollectionEquality()
                .equals(other._searchHistory, _searchHistory) &&
            (identical(other.cart, cart) || other.cart == cart) &&
            const DeepCollectionEquality()
                .equals(other._creditCards, _creditCards) &&
            const DeepCollectionEquality().equals(other._reviews, _reviews));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      phoneNumber,
      const DeepCollectionEquality().hash(_deliveryAddresses),
      photoUrl,
      isBusinessOwner,
      const DeepCollectionEquality().hash(_ownedBusinessIds),
      const DeepCollectionEquality().hash(_favoriteOfferIds),
      const DeepCollectionEquality().hash(_searchHistory),
      cart,
      const DeepCollectionEquality().hash(_creditCards),
      const DeepCollectionEquality().hash(_reviews));

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      __$$UserModelImplCopyWithImpl<_$UserModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserModelImplToJson(
      this,
    );
  }
}

abstract class _UserModel extends UserModel {
  const factory _UserModel(
      {required final String id,
      required final String phoneNumber,
      final List<AddressModel>? deliveryAddresses,
      final String? photoUrl,
      final bool isBusinessOwner,
      final Set<String>? ownedBusinessIds,
      final Set<String>? favoriteOfferIds,
      final List<String>? searchHistory,
      final Cart? cart,
      final List<CreditCardModel>? creditCards,
      final List<ReviewModel>? reviews}) = _$UserModelImpl;
  const _UserModel._() : super._();

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$UserModelImpl.fromJson;

  @override
  String get id;
  @override
  String get phoneNumber;
  @override
  List<AddressModel>? get deliveryAddresses;
  @override
  String? get photoUrl;
  @override
  bool get isBusinessOwner;
  @override
  Set<String>? get ownedBusinessIds;
  @override
  Set<String>? get favoriteOfferIds;
  @override
  List<String>? get searchHistory;
  @override
  Cart? get cart;
  @override
  List<CreditCardModel>? get creditCards;
  @override
  List<ReviewModel>? get reviews;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
