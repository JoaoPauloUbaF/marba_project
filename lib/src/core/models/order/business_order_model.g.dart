// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'business_order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BusinessOrderImpl _$$BusinessOrderImplFromJson(Map<String, dynamic> json) =>
    _$BusinessOrderImpl(
      id: json['id'] as String,
      businessId: json['businessId'] as String,
      userNickname: json['userNickname'] as String,
      address: Address.fromJson(json['address'] as Map<String, dynamic>),
      items: (json['items'] as List<dynamic>)
          .map((e) => BusinessOrderItem.fromJson(e as Map<String, dynamic>))
          .toSet(),
      status: $enumDecode(_$BusinessOrderStatusEnumMap, json['status']),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      canceledAt: json['canceledAt'] == null
          ? null
          : DateTime.parse(json['canceledAt'] as String),
    );

Map<String, dynamic> _$$BusinessOrderImplToJson(_$BusinessOrderImpl instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'businessId': instance.businessId,
    'userNickname': instance.userNickname,
    'address': instance.address.toJson(),
    'items': instance.items.map((e) => e.toJson()).toList(),
    'status': _$BusinessOrderStatusEnumMap[instance.status]!,
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

const _$BusinessOrderStatusEnumMap = {
  BusinessOrderStatus.waitingConfirmation: 'waitingConfirmation',
  BusinessOrderStatus.accepted: 'accepted',
  BusinessOrderStatus.preparing: 'preparing',
  BusinessOrderStatus.delivering: 'delivering',
  BusinessOrderStatus.delivered: 'delivered',
  BusinessOrderStatus.done: 'done',
  BusinessOrderStatus.canceled: 'canceled',
};
