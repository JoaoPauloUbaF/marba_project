// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'offer_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OfferModel _$OfferModelFromJson(Map<String, dynamic> json) {
  return _OfferModel.fromJson(json);
}

/// @nodoc
mixin _$OfferModel {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  List<String> get titleWords => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  List<String> get descriptionWords => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  String get businessId => throw _privateConstructorUsedError;
  Set<String> get category => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  OfferStatus get status => throw _privateConstructorUsedError;
  OfferType get type => throw _privateConstructorUsedError;
  List<ReviewModel>? get reviews => throw _privateConstructorUsedError;
  double? get rating => throw _privateConstructorUsedError;
  double? get discount => throw _privateConstructorUsedError;
  Set<String>? get offerImagesUrls => throw _privateConstructorUsedError;
  Product? get product => throw _privateConstructorUsedError;
  Service? get service => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OfferModelCopyWith<OfferModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OfferModelCopyWith<$Res> {
  factory $OfferModelCopyWith(
          OfferModel value, $Res Function(OfferModel) then) =
      _$OfferModelCopyWithImpl<$Res, OfferModel>;
  @useResult
  $Res call(
      {String id,
      String title,
      List<String> titleWords,
      String description,
      List<String> descriptionWords,
      double price,
      String imageUrl,
      String businessId,
      Set<String> category,
      DateTime createdAt,
      DateTime updatedAt,
      OfferStatus status,
      OfferType type,
      List<ReviewModel>? reviews,
      double? rating,
      double? discount,
      Set<String>? offerImagesUrls,
      Product? product,
      Service? service});

  $ProductCopyWith<$Res>? get product;
  $ServiceCopyWith<$Res>? get service;
}

/// @nodoc
class _$OfferModelCopyWithImpl<$Res, $Val extends OfferModel>
    implements $OfferModelCopyWith<$Res> {
  _$OfferModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? titleWords = null,
    Object? description = null,
    Object? descriptionWords = null,
    Object? price = null,
    Object? imageUrl = null,
    Object? businessId = null,
    Object? category = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? status = null,
    Object? type = null,
    Object? reviews = freezed,
    Object? rating = freezed,
    Object? discount = freezed,
    Object? offerImagesUrls = freezed,
    Object? product = freezed,
    Object? service = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      titleWords: null == titleWords
          ? _value.titleWords
          : titleWords // ignore: cast_nullable_to_non_nullable
              as List<String>,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      descriptionWords: null == descriptionWords
          ? _value.descriptionWords
          : descriptionWords // ignore: cast_nullable_to_non_nullable
              as List<String>,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      businessId: null == businessId
          ? _value.businessId
          : businessId // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as Set<String>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as OfferStatus,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as OfferType,
      reviews: freezed == reviews
          ? _value.reviews
          : reviews // ignore: cast_nullable_to_non_nullable
              as List<ReviewModel>?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double?,
      discount: freezed == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double?,
      offerImagesUrls: freezed == offerImagesUrls
          ? _value.offerImagesUrls
          : offerImagesUrls // ignore: cast_nullable_to_non_nullable
              as Set<String>?,
      product: freezed == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product?,
      service: freezed == service
          ? _value.service
          : service // ignore: cast_nullable_to_non_nullable
              as Service?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ProductCopyWith<$Res>? get product {
    if (_value.product == null) {
      return null;
    }

    return $ProductCopyWith<$Res>(_value.product!, (value) {
      return _then(_value.copyWith(product: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ServiceCopyWith<$Res>? get service {
    if (_value.service == null) {
      return null;
    }

    return $ServiceCopyWith<$Res>(_value.service!, (value) {
      return _then(_value.copyWith(service: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OfferModelImplCopyWith<$Res>
    implements $OfferModelCopyWith<$Res> {
  factory _$$OfferModelImplCopyWith(
          _$OfferModelImpl value, $Res Function(_$OfferModelImpl) then) =
      __$$OfferModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      List<String> titleWords,
      String description,
      List<String> descriptionWords,
      double price,
      String imageUrl,
      String businessId,
      Set<String> category,
      DateTime createdAt,
      DateTime updatedAt,
      OfferStatus status,
      OfferType type,
      List<ReviewModel>? reviews,
      double? rating,
      double? discount,
      Set<String>? offerImagesUrls,
      Product? product,
      Service? service});

  @override
  $ProductCopyWith<$Res>? get product;
  @override
  $ServiceCopyWith<$Res>? get service;
}

/// @nodoc
class __$$OfferModelImplCopyWithImpl<$Res>
    extends _$OfferModelCopyWithImpl<$Res, _$OfferModelImpl>
    implements _$$OfferModelImplCopyWith<$Res> {
  __$$OfferModelImplCopyWithImpl(
      _$OfferModelImpl _value, $Res Function(_$OfferModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? titleWords = null,
    Object? description = null,
    Object? descriptionWords = null,
    Object? price = null,
    Object? imageUrl = null,
    Object? businessId = null,
    Object? category = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? status = null,
    Object? type = null,
    Object? reviews = freezed,
    Object? rating = freezed,
    Object? discount = freezed,
    Object? offerImagesUrls = freezed,
    Object? product = freezed,
    Object? service = freezed,
  }) {
    return _then(_$OfferModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      titleWords: null == titleWords
          ? _value._titleWords
          : titleWords // ignore: cast_nullable_to_non_nullable
              as List<String>,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      descriptionWords: null == descriptionWords
          ? _value._descriptionWords
          : descriptionWords // ignore: cast_nullable_to_non_nullable
              as List<String>,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      businessId: null == businessId
          ? _value.businessId
          : businessId // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value._category
          : category // ignore: cast_nullable_to_non_nullable
              as Set<String>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as OfferStatus,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as OfferType,
      reviews: freezed == reviews
          ? _value._reviews
          : reviews // ignore: cast_nullable_to_non_nullable
              as List<ReviewModel>?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double?,
      discount: freezed == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double?,
      offerImagesUrls: freezed == offerImagesUrls
          ? _value._offerImagesUrls
          : offerImagesUrls // ignore: cast_nullable_to_non_nullable
              as Set<String>?,
      product: freezed == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product?,
      service: freezed == service
          ? _value.service
          : service // ignore: cast_nullable_to_non_nullable
              as Service?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OfferModelImpl extends _OfferModel {
  _$OfferModelImpl(
      {required this.id,
      required this.title,
      required final List<String> titleWords,
      required this.description,
      required final List<String> descriptionWords,
      required this.price,
      required this.imageUrl,
      required this.businessId,
      required final Set<String> category,
      required this.createdAt,
      required this.updatedAt,
      required this.status,
      required this.type,
      final List<ReviewModel>? reviews,
      this.rating,
      this.discount,
      final Set<String>? offerImagesUrls,
      this.product,
      this.service})
      : _titleWords = titleWords,
        _descriptionWords = descriptionWords,
        _category = category,
        _reviews = reviews,
        _offerImagesUrls = offerImagesUrls,
        super._();

  factory _$OfferModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$OfferModelImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  final List<String> _titleWords;
  @override
  List<String> get titleWords {
    if (_titleWords is EqualUnmodifiableListView) return _titleWords;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_titleWords);
  }

  @override
  final String description;
  final List<String> _descriptionWords;
  @override
  List<String> get descriptionWords {
    if (_descriptionWords is EqualUnmodifiableListView)
      return _descriptionWords;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_descriptionWords);
  }

  @override
  final double price;
  @override
  final String imageUrl;
  @override
  final String businessId;
  final Set<String> _category;
  @override
  Set<String> get category {
    if (_category is EqualUnmodifiableSetView) return _category;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_category);
  }

  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final OfferStatus status;
  @override
  final OfferType type;
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
  final double? rating;
  @override
  final double? discount;
  final Set<String>? _offerImagesUrls;
  @override
  Set<String>? get offerImagesUrls {
    final value = _offerImagesUrls;
    if (value == null) return null;
    if (_offerImagesUrls is EqualUnmodifiableSetView) return _offerImagesUrls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(value);
  }

  @override
  final Product? product;
  @override
  final Service? service;

  @override
  String toString() {
    return 'OfferModel(id: $id, title: $title, titleWords: $titleWords, description: $description, descriptionWords: $descriptionWords, price: $price, imageUrl: $imageUrl, businessId: $businessId, category: $category, createdAt: $createdAt, updatedAt: $updatedAt, status: $status, type: $type, reviews: $reviews, rating: $rating, discount: $discount, offerImagesUrls: $offerImagesUrls, product: $product, service: $service)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OfferModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality()
                .equals(other._titleWords, _titleWords) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality()
                .equals(other._descriptionWords, _descriptionWords) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.businessId, businessId) ||
                other.businessId == businessId) &&
            const DeepCollectionEquality().equals(other._category, _category) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other._reviews, _reviews) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.discount, discount) ||
                other.discount == discount) &&
            const DeepCollectionEquality()
                .equals(other._offerImagesUrls, _offerImagesUrls) &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.service, service) || other.service == service));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        title,
        const DeepCollectionEquality().hash(_titleWords),
        description,
        const DeepCollectionEquality().hash(_descriptionWords),
        price,
        imageUrl,
        businessId,
        const DeepCollectionEquality().hash(_category),
        createdAt,
        updatedAt,
        status,
        type,
        const DeepCollectionEquality().hash(_reviews),
        rating,
        discount,
        const DeepCollectionEquality().hash(_offerImagesUrls),
        product,
        service
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OfferModelImplCopyWith<_$OfferModelImpl> get copyWith =>
      __$$OfferModelImplCopyWithImpl<_$OfferModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OfferModelImplToJson(
      this,
    );
  }
}

abstract class _OfferModel extends OfferModel {
  factory _OfferModel(
      {required final String id,
      required final String title,
      required final List<String> titleWords,
      required final String description,
      required final List<String> descriptionWords,
      required final double price,
      required final String imageUrl,
      required final String businessId,
      required final Set<String> category,
      required final DateTime createdAt,
      required final DateTime updatedAt,
      required final OfferStatus status,
      required final OfferType type,
      final List<ReviewModel>? reviews,
      final double? rating,
      final double? discount,
      final Set<String>? offerImagesUrls,
      final Product? product,
      final Service? service}) = _$OfferModelImpl;
  _OfferModel._() : super._();

  factory _OfferModel.fromJson(Map<String, dynamic> json) =
      _$OfferModelImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  List<String> get titleWords;
  @override
  String get description;
  @override
  List<String> get descriptionWords;
  @override
  double get price;
  @override
  String get imageUrl;
  @override
  String get businessId;
  @override
  Set<String> get category;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  OfferStatus get status;
  @override
  OfferType get type;
  @override
  List<ReviewModel>? get reviews;
  @override
  double? get rating;
  @override
  double? get discount;
  @override
  Set<String>? get offerImagesUrls;
  @override
  Product? get product;
  @override
  Service? get service;
  @override
  @JsonKey(ignore: true)
  _$$OfferModelImplCopyWith<_$OfferModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
