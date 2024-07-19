// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      id: json['id'] as String,
      phoneNumber: json['phoneNumber'] as String,
      deliveryAddresses: (json['deliveryAddresses'] as List<dynamic>?)
          ?.map((e) => AddressModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      isBusinessOwner: json['isBusinessOwner'] as bool? ?? false,
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
      creditCards: (json['creditCards'] as List<dynamic>?)
          ?.map((e) => CreditCardModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'phoneNumber': instance.phoneNumber,
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
  writeNotNull(
      'creditCards', instance.creditCards?.map((e) => e.toJson()).toList());
  return val;
}
