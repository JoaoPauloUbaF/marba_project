// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      id: json['id'] as String,
      displayName: json['displayName'] as String,
      email: json['email'] as String,
      phoneNumber: json['phoneNumber'] as String,
      address: Address.fromJson(json['address'] as Map<String, dynamic>),
      isBusinessOwner: json['isBusinessOwner'] as bool,
      ownedBusinessIds: (json['ownedBusinessIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toSet(),
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'displayName': instance.displayName,
    'email': instance.email,
    'phoneNumber': instance.phoneNumber,
    'address': instance.address.toJson(),
    'isBusinessOwner': instance.isBusinessOwner,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ownedBusinessIds', instance.ownedBusinessIds?.toList());
  return val;
}
