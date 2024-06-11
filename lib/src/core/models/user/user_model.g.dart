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
      address: AddressModel.fromJson(json['address'] as Map<String, dynamic>),
      deliveryAddresses: (json['deliveryAddresses'] as List<dynamic>?)
          ?.map((e) => AddressModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      isBusinessOwner: json['isBusinessOwner'] as bool,
      ownedBusinessIds: (json['ownedBusinessIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toSet(),
      favoriteOfferIds: (json['favoriteOfferIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toSet(),
      searchHistory: (json['searchHistory'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      cart: json['cart'] == null
          ? null
          : Cart.fromJson(json['cart'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'displayName': instance.displayName,
    'email': instance.email,
    'phoneNumber': instance.phoneNumber,
    'address': instance.address.toJson(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('deliveryAddresses',
      instance.deliveryAddresses?.map((e) => e.toJson()).toList());
  val['isBusinessOwner'] = instance.isBusinessOwner;
  writeNotNull('ownedBusinessIds', instance.ownedBusinessIds?.toList());
  writeNotNull('favoriteOfferIds', instance.favoriteOfferIds?.toList());
  writeNotNull('searchHistory', instance.searchHistory);
  writeNotNull('cart', instance.cart?.toJson());
  return val;
}
