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
  String get displayName => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;
  AddressModel get address => throw _privateConstructorUsedError;
  List<AddressModel>? get deliveryAddresses =>
      throw _privateConstructorUsedError;
  bool get isBusinessOwner => throw _privateConstructorUsedError;
  Set<String>? get ownedBusinessIds => throw _privateConstructorUsedError;
  Set<String>? get favoriteOfferIds => throw _privateConstructorUsedError;
  List<String>? get searchHistory => throw _privateConstructorUsedError;
  Cart? get cart => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
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
      String displayName,
      String email,
      String phoneNumber,
      AddressModel address,
      List<AddressModel>? deliveryAddresses,
      bool isBusinessOwner,
      Set<String>? ownedBusinessIds,
      Set<String>? favoriteOfferIds,
      List<String>? searchHistory,
      Cart? cart});

  $AddressModelCopyWith<$Res> get address;
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

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? displayName = null,
    Object? email = null,
    Object? phoneNumber = null,
    Object? address = null,
    Object? deliveryAddresses = freezed,
    Object? isBusinessOwner = null,
    Object? ownedBusinessIds = freezed,
    Object? favoriteOfferIds = freezed,
    Object? searchHistory = freezed,
    Object? cart = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
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
      deliveryAddresses: freezed == deliveryAddresses
          ? _value.deliveryAddresses
          : deliveryAddresses // ignore: cast_nullable_to_non_nullable
              as List<AddressModel>?,
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
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AddressModelCopyWith<$Res> get address {
    return $AddressModelCopyWith<$Res>(_value.address, (value) {
      return _then(_value.copyWith(address: value) as $Val);
    });
  }

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
      String displayName,
      String email,
      String phoneNumber,
      AddressModel address,
      List<AddressModel>? deliveryAddresses,
      bool isBusinessOwner,
      Set<String>? ownedBusinessIds,
      Set<String>? favoriteOfferIds,
      List<String>? searchHistory,
      Cart? cart});

  @override
  $AddressModelCopyWith<$Res> get address;
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

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? displayName = null,
    Object? email = null,
    Object? phoneNumber = null,
    Object? address = null,
    Object? deliveryAddresses = freezed,
    Object? isBusinessOwner = null,
    Object? ownedBusinessIds = freezed,
    Object? favoriteOfferIds = freezed,
    Object? searchHistory = freezed,
    Object? cart = freezed,
  }) {
    return _then(_$UserModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
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
      deliveryAddresses: freezed == deliveryAddresses
          ? _value._deliveryAddresses
          : deliveryAddresses // ignore: cast_nullable_to_non_nullable
              as List<AddressModel>?,
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserModelImpl extends _UserModel {
  const _$UserModelImpl(
      {required this.id,
      required this.displayName,
      required this.email,
      required this.phoneNumber,
      required this.address,
      final List<AddressModel>? deliveryAddresses,
      required this.isBusinessOwner,
      final Set<String>? ownedBusinessIds,
      final Set<String>? favoriteOfferIds,
      final List<String>? searchHistory,
      this.cart})
      : _deliveryAddresses = deliveryAddresses,
        _ownedBusinessIds = ownedBusinessIds,
        _favoriteOfferIds = favoriteOfferIds,
        _searchHistory = searchHistory,
        super._();

  factory _$UserModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserModelImplFromJson(json);

  @override
  final String id;
  @override
  final String displayName;
  @override
  final String email;
  @override
  final String phoneNumber;
  @override
  final AddressModel address;
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

  @override
  String toString() {
    return 'UserModel(id: $id, displayName: $displayName, email: $email, phoneNumber: $phoneNumber, address: $address, deliveryAddresses: $deliveryAddresses, isBusinessOwner: $isBusinessOwner, ownedBusinessIds: $ownedBusinessIds, favoriteOfferIds: $favoriteOfferIds, searchHistory: $searchHistory, cart: $cart)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.address, address) || other.address == address) &&
            const DeepCollectionEquality()
                .equals(other._deliveryAddresses, _deliveryAddresses) &&
            (identical(other.isBusinessOwner, isBusinessOwner) ||
                other.isBusinessOwner == isBusinessOwner) &&
            const DeepCollectionEquality()
                .equals(other._ownedBusinessIds, _ownedBusinessIds) &&
            const DeepCollectionEquality()
                .equals(other._favoriteOfferIds, _favoriteOfferIds) &&
            const DeepCollectionEquality()
                .equals(other._searchHistory, _searchHistory) &&
            (identical(other.cart, cart) || other.cart == cart));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      displayName,
      email,
      phoneNumber,
      address,
      const DeepCollectionEquality().hash(_deliveryAddresses),
      isBusinessOwner,
      const DeepCollectionEquality().hash(_ownedBusinessIds),
      const DeepCollectionEquality().hash(_favoriteOfferIds),
      const DeepCollectionEquality().hash(_searchHistory),
      cart);

  @JsonKey(ignore: true)
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
      required final String displayName,
      required final String email,
      required final String phoneNumber,
      required final AddressModel address,
      final List<AddressModel>? deliveryAddresses,
      required final bool isBusinessOwner,
      final Set<String>? ownedBusinessIds,
      final Set<String>? favoriteOfferIds,
      final List<String>? searchHistory,
      final Cart? cart}) = _$UserModelImpl;
  const _UserModel._() : super._();

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$UserModelImpl.fromJson;

  @override
  String get id;
  @override
  String get displayName;
  @override
  String get email;
  @override
  String get phoneNumber;
  @override
  AddressModel get address;
  @override
  List<AddressModel>? get deliveryAddresses;
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
  @JsonKey(ignore: true)
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
