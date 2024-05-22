// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductImpl _$$ProductImplFromJson(Map<String, dynamic> json) =>
    _$ProductImpl(
      availableQuantity: (json['availableQuantity'] as num).toInt(),
      itemCost: (json['itemCost'] as num?)?.toDouble(),
      status: json['status'] as String,
    );

Map<String, dynamic> _$$ProductImplToJson(_$ProductImpl instance) {
  final val = <String, dynamic>{
    'availableQuantity': instance.availableQuantity,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('itemCost', instance.itemCost);
  val['status'] = instance.status;
  return val;
}
