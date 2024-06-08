// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ServiceImpl _$$ServiceImplFromJson(Map<String, dynamic> json) =>
    _$ServiceImpl(
      pricingType:
          $enumDecode(_$ServicePricingTypeEnumMap, json['pricingType']),
      type: $enumDecode(_$ServiceTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$$ServiceImplToJson(_$ServiceImpl instance) =>
    <String, dynamic>{
      'pricingType': _$ServicePricingTypeEnumMap[instance.pricingType]!,
      'type': _$ServiceTypeEnumMap[instance.type]!,
    };

const _$ServicePricingTypeEnumMap = {
  ServicePricingType.fixed: 'fixed',
  ServicePricingType.hourly: 'hourly',
  ServicePricingType.daily: 'daily',
  ServicePricingType.weekly: 'weekly',
  ServicePricingType.monthly: 'monthly',
  ServicePricingType.yearly: 'yearly',
};

const _$ServiceTypeEnumMap = {
  ServiceType.atSite: 'atSite',
  ServiceType.atHome: 'atHome',
  ServiceType.online: 'online',
  ServiceType.atSiteAndAtHome: 'atSiteAndAtHome',
};
