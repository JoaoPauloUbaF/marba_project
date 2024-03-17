// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OfferModelImpl _$$OfferModelImplFromJson(Map<String, dynamic> json) =>
    _$OfferModelImpl(
      id: json['id'] as String,
      businessId: json['businessId'] as String,
      category:
          (json['category'] as List<dynamic>).map((e) => e as String).toSet(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      status: $enumDecode(_$OfferStatusEnumMap, json['status']),
      type: $enumDecode(_$OfferTypeEnumMap, json['type']),
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

Map<String, dynamic> _$$OfferModelImplToJson(_$OfferModelImpl instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'businessId': instance.businessId,
    'category': instance.category.toList(),
    'createdAt': instance.createdAt.toIso8601String(),
    'updatedAt': instance.updatedAt.toIso8601String(),
    'status': _$OfferStatusEnumMap[instance.status]!,
    'type': _$OfferTypeEnumMap[instance.type]!,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('offerImagesUrls', instance.offerImagesUrls?.toList());
  writeNotNull('product', instance.product?.toJson());
  writeNotNull('service', instance.service?.toJson());
  return val;
}

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
