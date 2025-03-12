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

Map<String, dynamic> _$$AddressImplToJson(_$AddressImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'street': instance.street,
      'neighborhood': instance.neighborhood,
      'city': instance.city,
      'state': instance.state,
      'zipCode': instance.zipCode,
      if (instance.number case final value?) 'number': value,
      if (instance.complement case final value?) 'complement': value,
      if (instance.nickname case final value?) 'nickname': value,
    };
