// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderModelImpl _$$OrderModelImplFromJson(Map<String, dynamic> json) =>
    _$OrderModelImpl(
      id: json['id'] as String,
      customerId: json['customerId'] as String,
      businessOrdersIds: (json['businessOrdersIds'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      total: (json['total'] as num).toDouble(),
      totalDeliveryFee: (json['totalDeliveryFee'] as num).toDouble(),
      discount: (json['discount'] as num).toDouble(),
      address: Address.fromJson(json['address'] as Map<String, dynamic>),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      paymentMethod: $enumDecode(_$PaymentMethodEnumMap, json['paymentMethod']),
      paymentConfirmedAt: json['paymentConfirmedAt'] == null
          ? null
          : DateTime.parse(json['paymentConfirmedAt'] as String),
      canceledAt: json['canceledAt'] == null
          ? null
          : DateTime.parse(json['canceledAt'] as String),
    );

Map<String, dynamic> _$$OrderModelImplToJson(_$OrderModelImpl instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'customerId': instance.customerId,
    'businessOrdersIds': instance.businessOrdersIds,
    'total': instance.total,
    'totalDeliveryFee': instance.totalDeliveryFee,
    'discount': instance.discount,
    'address': instance.address.toJson(),
    'createdAt': instance.createdAt.toIso8601String(),
    'updatedAt': instance.updatedAt.toIso8601String(),
    'paymentMethod': _$PaymentMethodEnumMap[instance.paymentMethod]!,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'paymentConfirmedAt', instance.paymentConfirmedAt?.toIso8601String());
  writeNotNull('canceledAt', instance.canceledAt?.toIso8601String());
  return val;
}

const _$PaymentMethodEnumMap = {
  PaymentMethod.creditCard: 'creditCard',
  PaymentMethod.pix: 'pix',
  PaymentMethod.boleto: 'boleto',
};
