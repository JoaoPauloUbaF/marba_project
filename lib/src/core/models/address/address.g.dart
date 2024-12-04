// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AddressImpl _$$AddressImplFromJson(Map<String, dynamic> json) =>
    _$AddressImpl(
      id: json['id'] as String,
      street: json['street'] as String,
      neighborhood: json['neighborhood'] as String,
      city: json['city'] as String,
      state: json['state'] as String,
      zipCode: json['zipCode'] as String,
      number: json['number'] as String?,
      complement: json['complement'] as String?,
      nickname: json['nickname'] as String?,
    );

Map<String, dynamic> _$$AddressImplToJson(_$AddressImpl instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'street': instance.street,
    'neighborhood': instance.neighborhood,
    'city': instance.city,
    'state': instance.state,
    'zipCode': instance.zipCode,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('number', instance.number);
  writeNotNull('complement', instance.complement);
  writeNotNull('nickname', instance.nickname);
  return val;
}
