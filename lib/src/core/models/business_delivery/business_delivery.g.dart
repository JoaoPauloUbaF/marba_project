// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'business_delivery.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BusinessDeliveryModelImpl _$$BusinessDeliveryModelImplFromJson(
        Map<String, dynamic> json) =>
    _$BusinessDeliveryModelImpl(
      baseDeliveryFee: json['baseDeliveryFee'] as String,
      additionalDistanceFee: json['additionalDistanceFee'] as String,
      baseDistance: json['baseDistance'] as String,
      minimumDeliveryTime: json['minimumDeliveryTime'] as String,
      maximumDeliveryTime: json['maximumDeliveryTime'] as String,
      minimumOrderValue: json['minimumOrderValue'] as String,
    );

Map<String, dynamic> _$$BusinessDeliveryModelImplToJson(
        _$BusinessDeliveryModelImpl instance) =>
    <String, dynamic>{
      'baseDeliveryFee': instance.baseDeliveryFee,
      'additionalDistanceFee': instance.additionalDistanceFee,
      'baseDistance': instance.baseDistance,
      'minimumDeliveryTime': instance.minimumDeliveryTime,
      'maximumDeliveryTime': instance.maximumDeliveryTime,
      'minimumOrderValue': instance.minimumOrderValue,
    };
