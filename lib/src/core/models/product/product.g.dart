// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductImpl _$$ProductImplFromJson(Map<String, dynamic> json) =>
    _$ProductImpl(
      title: json['title'] as String,
      description: json['description'] as String,
      price: (json['price'] as num).toDouble(),
      imageUrl: json['imageUrl'] as String,
      availableQuantity: json['availableQuantity'] as int,
      itemCost: (json['itemCost'] as num?)?.toDouble(),
      status: json['status'] as String,
    );

Map<String, dynamic> _$$ProductImplToJson(_$ProductImpl instance) {
  final val = <String, dynamic>{
    'title': instance.title,
    'description': instance.description,
    'price': instance.price,
    'imageUrl': instance.imageUrl,
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
