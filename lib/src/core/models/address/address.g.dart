// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AddressImpl _$$AddressImplFromJson(Map<String, dynamic> json) =>
    _$AddressImpl(
      street: json['street'] as String,
      number: json['number'] as String?,
      neighborhood: json['neighborhood'] as String,
      city: json['city'] as String,
      state: json['state'] as String,
      zipCode: json['zipCode'] as String,
      complement: json['complement'] as String?,
      nickname: json['nickname'] as String?,
    );

Map<String, dynamic> _$$AddressImplToJson(_$AddressImpl instance) {
  final val = <String, dynamic>{
    'street': instance.street,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('number', instance.number);
  val['neighborhood'] = instance.neighborhood;
  val['city'] = instance.city;
  val['state'] = instance.state;
  val['zipCode'] = instance.zipCode;
  writeNotNull('complement', instance.complement);
  writeNotNull('nickname', instance.nickname);
  return val;
}
