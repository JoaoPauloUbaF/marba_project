// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'business_order_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BusinessOrderItemImpl _$$BusinessOrderItemImplFromJson(
        Map<String, dynamic> json) =>
    _$BusinessOrderItemImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      imageUrl: json['imageUrl'] as String,
      price: (json['price'] as num).toDouble(),
      quantity: json['quantity'] as int,
      deliveredAt: json['deliveredAt'] == null
          ? null
          : DateTime.parse(json['deliveredAt'] as String),
      canceledAt: json['canceledAt'] == null
          ? null
          : DateTime.parse(json['canceledAt'] as String),
      scheduledAt: json['scheduledAt'] == null
          ? null
          : DateTime.parse(json['scheduledAt'] as String),
      status: $enumDecode(_$BusinessOrderItemStatusEnumMap, json['status']),
    );

Map<String, dynamic> _$$BusinessOrderItemImplToJson(
    _$BusinessOrderItemImpl instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'name': instance.name,
    'imageUrl': instance.imageUrl,
    'price': instance.price,
    'quantity': instance.quantity,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('deliveredAt', instance.deliveredAt?.toIso8601String());
  writeNotNull('canceledAt', instance.canceledAt?.toIso8601String());
  writeNotNull('scheduledAt', instance.scheduledAt?.toIso8601String());
  val['status'] = _$BusinessOrderItemStatusEnumMap[instance.status]!;
  return val;
}

const _$BusinessOrderItemStatusEnumMap = {
  BusinessOrderItemStatus.pending: 'pending',
  BusinessOrderItemStatus.preparing: 'preparing',
  BusinessOrderItemStatus.delivering: 'delivering',
  BusinessOrderItemStatus.delivered: 'delivered',
  BusinessOrderItemStatus.done: 'done',
  BusinessOrderItemStatus.canceled: 'canceled',
};
