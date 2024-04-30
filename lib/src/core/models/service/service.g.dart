// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ServiceImpl _$$ServiceImplFromJson(Map<String, dynamic> json) =>
    _$ServiceImpl(
      status: json['status'] as String,
      pricingType:
          $enumDecode(_$ServicePricingTypeEnumMap, json['pricingType']),
    );

Map<String, dynamic> _$$ServiceImplToJson(_$ServiceImpl instance) =>
    <String, dynamic>{
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
