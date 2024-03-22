// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ServiceImpl _$$ServiceImplFromJson(Map<String, dynamic> json) =>
    _$ServiceImpl(
      title: json['title'] as String,
      description: json['description'] as String,
      price: (json['price'] as num).toDouble(),
      imageUrl: json['imageUrl'] as String,
      status: json['status'] as String,
      pricingType:
          $enumDecode(_$ServicePricingTypeEnumMap, json['pricingType']),
    );

Map<String, dynamic> _$$ServiceImplToJson(_$ServiceImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'price': instance.price,
      'imageUrl': instance.imageUrl,
      'status': instance.status,
      'pricingType': _$ServicePricingTypeEnumMap[instance.pricingType]!,
    };

const _$ServicePricingTypeEnumMap = {
  ServicePricingType.fixed: 'fixed',
  ServicePricingType.hourly: 'hourly',
  ServicePricingType.daily: 'daily',
  ServicePricingType.weekly: 'weekly',
  ServicePricingType.monthly: 'monthly',
  ServicePricingType.yearly: 'yearly',
};
