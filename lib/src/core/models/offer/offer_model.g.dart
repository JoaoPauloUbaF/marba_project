// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OfferModelImpl _$$OfferModelImplFromJson(Map<String, dynamic> json) =>
    _$OfferModelImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      titleWords: (json['titleWords'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      description: json['description'] as String,
      descriptionWords: (json['descriptionWords'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      price: (json['price'] as num).toDouble(),
      imageUrl: json['imageUrl'] as String,
      businessId: json['businessId'] as String,
      category:
          (json['category'] as List<dynamic>).map((e) => e as String).toSet(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      status: $enumDecode(_$OfferStatusEnumMap, json['status']),
      type: $enumDecode(_$OfferTypeEnumMap, json['type']),
      city: json['city'] as String,
      reviews: (json['reviews'] as List<dynamic>?)
          ?.map((e) => ReviewModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalSalesNumber: (json['totalSalesNumber'] as num?)?.toInt(),
      rating: (json['rating'] as num?)?.toDouble(),
      ratingDistribution:
          (json['ratingDistribution'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(int.parse(k), (e as num).toInt()),
      ),
      discount: (json['discount'] as num?)?.toDouble(),
      offerImagesUrls: (json['offerImagesUrls'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toSet(),
      product: json['product'] == null
          ? null
          : Product.fromJson(json['product'] as Map<String, dynamic>),
      service: json['service'] == null
          ? null
          : Service.fromJson(json['service'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$OfferModelImplToJson(_$OfferModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'titleWords': instance.titleWords,
      'description': instance.description,
      'descriptionWords': instance.descriptionWords,
      'price': instance.price,
      'imageUrl': instance.imageUrl,
      'businessId': instance.businessId,
      'category': instance.category.toList(),
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'status': _$OfferStatusEnumMap[instance.status]!,
      'type': _$OfferTypeEnumMap[instance.type]!,
      'city': instance.city,
      if (instance.reviews?.map((e) => e.toJson()).toList() case final value?)
        'reviews': value,
      if (instance.totalSalesNumber case final value?)
        'totalSalesNumber': value,
      if (instance.rating case final value?) 'rating': value,
      if (instance.ratingDistribution?.map((k, e) => MapEntry(k.toString(), e))
          case final value?)
        'ratingDistribution': value,
      if (instance.discount case final value?) 'discount': value,
      if (instance.offerImagesUrls?.toList() case final value?)
        'offerImagesUrls': value,
      if (instance.product?.toJson() case final value?) 'product': value,
      if (instance.service?.toJson() case final value?) 'service': value,
    };

const _$OfferStatusEnumMap = {
  OfferStatus.active: 'active',
  OfferStatus.inactive: 'inactive',
  OfferStatus.pending: 'pending',
  OfferStatus.soldOut: 'soldOut',
  OfferStatus.onDemand: 'onDemand',
};

const _$OfferTypeEnumMap = {
  OfferType.product: 'product',
  OfferType.service: 'service',
};
