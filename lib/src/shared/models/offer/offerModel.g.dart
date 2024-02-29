// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offerModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OfferModelImpl _$$OfferModelImplFromJson(Map<String, dynamic> json) =>
    _$OfferModelImpl(
      id: json['id'] as String,
      businessId: json['businessId'] as String,
      category: json['category'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
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
      'businessId': instance.businessId,
      'category': instance.category,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'product': instance.product,
      'service': instance.service,
    };
