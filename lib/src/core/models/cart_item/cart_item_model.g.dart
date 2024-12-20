// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CartItemModelImpl _$$CartItemModelImplFromJson(Map<String, dynamic> json) =>
    _$CartItemModelImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
      cost: (json['cost'] as num).toDouble(),
      imageUrl: json['imageUrl'] as String,
      quantity: (json['quantity'] as num).toInt(),
      businessId: json['businessId'] as String,
      offerType: $enumDecode(_$OfferTypeEnumMap, json['offerType']),
    );

Map<String, dynamic> _$$CartItemModelImplToJson(_$CartItemModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'cost': instance.cost,
      'imageUrl': instance.imageUrl,
      'quantity': instance.quantity,
      'businessId': instance.businessId,
      'offerType': _$OfferTypeEnumMap[instance.offerType]!,
    };

const _$OfferTypeEnumMap = {
  OfferType.product: 'product',
  OfferType.service: 'service',
};
