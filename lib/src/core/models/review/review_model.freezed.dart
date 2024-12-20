// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'review_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ReviewModel _$ReviewModelFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'offer':
      return _ReviewModelOffer.fromJson(json);
    case 'business':
      return _ReviewModelBusiness.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'ReviewModel',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$ReviewModel {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get reviewerName => throw _privateConstructorUsedError;
  String get review => throw _privateConstructorUsedError;
  double get rating => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String id,
            String userId,
            String reviewerName,
            String offerId,
            String review,
            double rating,
            DateTime createdAt,
            DateTime updatedAt)
        offer,
    required TResult Function(
            String id,
            String userId,
            String businessId,
            String reviewerName,
            String review,
            double rating,
            DateTime createdAt,
            DateTime updatedAt)
        business,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String id,
            String userId,
            String reviewerName,
            String offerId,
            String review,
            double rating,
            DateTime createdAt,
            DateTime updatedAt)?
        offer,
    TResult? Function(
            String id,
            String userId,
            String businessId,
            String reviewerName,
            String review,
            double rating,
            DateTime createdAt,
            DateTime updatedAt)?
        business,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String id,
            String userId,
            String reviewerName,
            String offerId,
            String review,
            double rating,
            DateTime createdAt,
            DateTime updatedAt)?
        offer,
    TResult Function(
            String id,
            String userId,
            String businessId,
            String reviewerName,
            String review,
            double rating,
            DateTime createdAt,
            DateTime updatedAt)?
        business,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ReviewModelOffer value) offer,
    required TResult Function(_ReviewModelBusiness value) business,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ReviewModelOffer value)? offer,
    TResult? Function(_ReviewModelBusiness value)? business,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ReviewModelOffer value)? offer,
    TResult Function(_ReviewModelBusiness value)? business,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Serializes this ReviewModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReviewModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReviewModelCopyWith<ReviewModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewModelCopyWith<$Res> {
  factory $ReviewModelCopyWith(
          ReviewModel value, $Res Function(ReviewModel) then) =
      _$ReviewModelCopyWithImpl<$Res, ReviewModel>;
  @useResult
  $Res call(
      {String id,
      String userId,
      String reviewerName,
      String review,
      double rating,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class _$ReviewModelCopyWithImpl<$Res, $Val extends ReviewModel>
    implements $ReviewModelCopyWith<$Res> {
  _$ReviewModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReviewModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? reviewerName = null,
    Object? review = null,
    Object? rating = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      reviewerName: null == reviewerName
          ? _value.reviewerName
          : reviewerName // ignore: cast_nullable_to_non_nullable
              as String,
      review: null == review
          ? _value.review
          : review // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
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
abstract class _$$ReviewModelOfferImplCopyWith<$Res>
    implements $ReviewModelCopyWith<$Res> {
  factory _$$ReviewModelOfferImplCopyWith(_$ReviewModelOfferImpl value,
          $Res Function(_$ReviewModelOfferImpl) then) =
      __$$ReviewModelOfferImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String userId,
      String reviewerName,
      String offerId,
      String review,
      double rating,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class __$$ReviewModelOfferImplCopyWithImpl<$Res>
    extends _$ReviewModelCopyWithImpl<$Res, _$ReviewModelOfferImpl>
    implements _$$ReviewModelOfferImplCopyWith<$Res> {
  __$$ReviewModelOfferImplCopyWithImpl(_$ReviewModelOfferImpl _value,
      $Res Function(_$ReviewModelOfferImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReviewModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? reviewerName = null,
    Object? offerId = null,
    Object? review = null,
    Object? rating = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$ReviewModelOfferImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      reviewerName: null == reviewerName
          ? _value.reviewerName
          : reviewerName // ignore: cast_nullable_to_non_nullable
              as String,
      offerId: null == offerId
          ? _value.offerId
          : offerId // ignore: cast_nullable_to_non_nullable
              as String,
      review: null == review
          ? _value.review
          : review // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
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
class _$ReviewModelOfferImpl implements _ReviewModelOffer {
  const _$ReviewModelOfferImpl(
      {required this.id,
      required this.userId,
      required this.reviewerName,
      required this.offerId,
      required this.review,
      required this.rating,
      required this.createdAt,
      required this.updatedAt,
      final String? $type})
      : $type = $type ?? 'offer';

  factory _$ReviewModelOfferImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReviewModelOfferImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final String reviewerName;
  @override
  final String offerId;
  @override
  final String review;
  @override
  final double rating;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'ReviewModel.offer(id: $id, userId: $userId, reviewerName: $reviewerName, offerId: $offerId, review: $review, rating: $rating, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReviewModelOfferImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.reviewerName, reviewerName) ||
                other.reviewerName == reviewerName) &&
            (identical(other.offerId, offerId) || other.offerId == offerId) &&
            (identical(other.review, review) || other.review == review) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, userId, reviewerName,
      offerId, review, rating, createdAt, updatedAt);

  /// Create a copy of ReviewModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReviewModelOfferImplCopyWith<_$ReviewModelOfferImpl> get copyWith =>
      __$$ReviewModelOfferImplCopyWithImpl<_$ReviewModelOfferImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String id,
            String userId,
            String reviewerName,
            String offerId,
            String review,
            double rating,
            DateTime createdAt,
            DateTime updatedAt)
        offer,
    required TResult Function(
            String id,
            String userId,
            String businessId,
            String reviewerName,
            String review,
            double rating,
            DateTime createdAt,
            DateTime updatedAt)
        business,
  }) {
    return offer(id, userId, reviewerName, offerId, review, rating, createdAt,
        updatedAt);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String id,
            String userId,
            String reviewerName,
            String offerId,
            String review,
            double rating,
            DateTime createdAt,
            DateTime updatedAt)?
        offer,
    TResult? Function(
            String id,
            String userId,
            String businessId,
            String reviewerName,
            String review,
            double rating,
            DateTime createdAt,
            DateTime updatedAt)?
        business,
  }) {
    return offer?.call(id, userId, reviewerName, offerId, review, rating,
        createdAt, updatedAt);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String id,
            String userId,
            String reviewerName,
            String offerId,
            String review,
            double rating,
            DateTime createdAt,
            DateTime updatedAt)?
        offer,
    TResult Function(
            String id,
            String userId,
            String businessId,
            String reviewerName,
            String review,
            double rating,
            DateTime createdAt,
            DateTime updatedAt)?
        business,
    required TResult orElse(),
  }) {
    if (offer != null) {
      return offer(id, userId, reviewerName, offerId, review, rating, createdAt,
          updatedAt);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ReviewModelOffer value) offer,
    required TResult Function(_ReviewModelBusiness value) business,
  }) {
    return offer(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ReviewModelOffer value)? offer,
    TResult? Function(_ReviewModelBusiness value)? business,
  }) {
    return offer?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ReviewModelOffer value)? offer,
    TResult Function(_ReviewModelBusiness value)? business,
    required TResult orElse(),
  }) {
    if (offer != null) {
      return offer(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ReviewModelOfferImplToJson(
      this,
    );
  }
}

abstract class _ReviewModelOffer implements ReviewModel {
  const factory _ReviewModelOffer(
      {required final String id,
      required final String userId,
      required final String reviewerName,
      required final String offerId,
      required final String review,
      required final double rating,
      required final DateTime createdAt,
      required final DateTime updatedAt}) = _$ReviewModelOfferImpl;

  factory _ReviewModelOffer.fromJson(Map<String, dynamic> json) =
      _$ReviewModelOfferImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  String get reviewerName;
  String get offerId;
  @override
  String get review;
  @override
  double get rating;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;

  /// Create a copy of ReviewModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReviewModelOfferImplCopyWith<_$ReviewModelOfferImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ReviewModelBusinessImplCopyWith<$Res>
    implements $ReviewModelCopyWith<$Res> {
  factory _$$ReviewModelBusinessImplCopyWith(_$ReviewModelBusinessImpl value,
          $Res Function(_$ReviewModelBusinessImpl) then) =
      __$$ReviewModelBusinessImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String userId,
      String businessId,
      String reviewerName,
      String review,
      double rating,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class __$$ReviewModelBusinessImplCopyWithImpl<$Res>
    extends _$ReviewModelCopyWithImpl<$Res, _$ReviewModelBusinessImpl>
    implements _$$ReviewModelBusinessImplCopyWith<$Res> {
  __$$ReviewModelBusinessImplCopyWithImpl(_$ReviewModelBusinessImpl _value,
      $Res Function(_$ReviewModelBusinessImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReviewModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? businessId = null,
    Object? reviewerName = null,
    Object? review = null,
    Object? rating = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$ReviewModelBusinessImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      businessId: null == businessId
          ? _value.businessId
          : businessId // ignore: cast_nullable_to_non_nullable
              as String,
      reviewerName: null == reviewerName
          ? _value.reviewerName
          : reviewerName // ignore: cast_nullable_to_non_nullable
              as String,
      review: null == review
          ? _value.review
          : review // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
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
class _$ReviewModelBusinessImpl implements _ReviewModelBusiness {
  const _$ReviewModelBusinessImpl(
      {required this.id,
      required this.userId,
      required this.businessId,
      required this.reviewerName,
      required this.review,
      required this.rating,
      required this.createdAt,
      required this.updatedAt,
      final String? $type})
      : $type = $type ?? 'business';

  factory _$ReviewModelBusinessImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReviewModelBusinessImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final String businessId;
  @override
  final String reviewerName;
  @override
  final String review;
  @override
  final double rating;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'ReviewModel.business(id: $id, userId: $userId, businessId: $businessId, reviewerName: $reviewerName, review: $review, rating: $rating, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReviewModelBusinessImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.businessId, businessId) ||
                other.businessId == businessId) &&
            (identical(other.reviewerName, reviewerName) ||
                other.reviewerName == reviewerName) &&
            (identical(other.review, review) || other.review == review) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, userId, businessId,
      reviewerName, review, rating, createdAt, updatedAt);

  /// Create a copy of ReviewModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReviewModelBusinessImplCopyWith<_$ReviewModelBusinessImpl> get copyWith =>
      __$$ReviewModelBusinessImplCopyWithImpl<_$ReviewModelBusinessImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String id,
            String userId,
            String reviewerName,
            String offerId,
            String review,
            double rating,
            DateTime createdAt,
            DateTime updatedAt)
        offer,
    required TResult Function(
            String id,
            String userId,
            String businessId,
            String reviewerName,
            String review,
            double rating,
            DateTime createdAt,
            DateTime updatedAt)
        business,
  }) {
    return business(id, userId, businessId, reviewerName, review, rating,
        createdAt, updatedAt);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String id,
            String userId,
            String reviewerName,
            String offerId,
            String review,
            double rating,
            DateTime createdAt,
            DateTime updatedAt)?
        offer,
    TResult? Function(
            String id,
            String userId,
            String businessId,
            String reviewerName,
            String review,
            double rating,
            DateTime createdAt,
            DateTime updatedAt)?
        business,
  }) {
    return business?.call(id, userId, businessId, reviewerName, review, rating,
        createdAt, updatedAt);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String id,
            String userId,
            String reviewerName,
            String offerId,
            String review,
            double rating,
            DateTime createdAt,
            DateTime updatedAt)?
        offer,
    TResult Function(
            String id,
            String userId,
            String businessId,
            String reviewerName,
            String review,
            double rating,
            DateTime createdAt,
            DateTime updatedAt)?
        business,
    required TResult orElse(),
  }) {
    if (business != null) {
      return business(id, userId, businessId, reviewerName, review, rating,
          createdAt, updatedAt);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ReviewModelOffer value) offer,
    required TResult Function(_ReviewModelBusiness value) business,
  }) {
    return business(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ReviewModelOffer value)? offer,
    TResult? Function(_ReviewModelBusiness value)? business,
  }) {
    return business?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ReviewModelOffer value)? offer,
    TResult Function(_ReviewModelBusiness value)? business,
    required TResult orElse(),
  }) {
    if (business != null) {
      return business(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ReviewModelBusinessImplToJson(
      this,
    );
  }
}

abstract class _ReviewModelBusiness implements ReviewModel {
  const factory _ReviewModelBusiness(
      {required final String id,
      required final String userId,
      required final String businessId,
      required final String reviewerName,
      required final String review,
      required final double rating,
      required final DateTime createdAt,
      required final DateTime updatedAt}) = _$ReviewModelBusinessImpl;

  factory _ReviewModelBusiness.fromJson(Map<String, dynamic> json) =
      _$ReviewModelBusinessImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  String get businessId;
  @override
  String get reviewerName;
  @override
  String get review;
  @override
  double get rating;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;

  /// Create a copy of ReviewModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReviewModelBusinessImplCopyWith<_$ReviewModelBusinessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
