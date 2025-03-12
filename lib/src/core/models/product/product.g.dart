// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductImpl _$$ProductImplFromJson(Map<String, dynamic> json) =>
    _$ProductImpl(
      availableQuantity: (json['availableQuantity'] as num).toInt(),
      itemCost: (json['itemCost'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$ProductImplToJson(_$ProductImpl instance) =>
    <String, dynamic>{
      'availableQuantity': instance.availableQuantity,
      if (instance.itemCost case final value?) 'itemCost': value,
    };
