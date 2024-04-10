// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderImpl _$$OrderImplFromJson(Map<String, dynamic> json) => _$OrderImpl(
      id: json['id'] as String,
      customerId: json['customerId'] as String,
      businessOrders: (json['businessOrders'] as List<dynamic>)
          .map((e) => BusinessOrder.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: (json['total'] as num).toDouble(),
      totalDeliveryFee: (json['totalDeliveryFee'] as num).toDouble(),
      discount: (json['discount'] as num).toDouble(),
      address: json['address'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      canceledAt: json['canceledAt'] == null
          ? null
          : DateTime.parse(json['canceledAt'] as String),
    );

Map<String, dynamic> _$$OrderImplToJson(_$OrderImpl instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'customerId': instance.customerId,
    'businessOrders': instance.businessOrders.map((e) => e.toJson()).toList(),
    'total': instance.total,
    'totalDeliveryFee': instance.totalDeliveryFee,
    'discount': instance.discount,
    'address': instance.address,
    'createdAt': instance.createdAt.toIso8601String(),
    'updatedAt': instance.updatedAt.toIso8601String(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('canceledAt', instance.canceledAt?.toIso8601String());
  return val;
}
