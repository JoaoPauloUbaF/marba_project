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
      photoUrl: json['photoUrl'] as String?,
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
      reviews: (json['reviews'] as List<dynamic>?)
          ?.map((e) => ReviewModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'phoneNumber': instance.phoneNumber,
      if (instance.deliveryAddresses?.map((e) => e.toJson()).toList()
          case final value?)
        'deliveryAddresses': value,
      if (instance.photoUrl case final value?) 'photoUrl': value,
      'isBusinessOwner': instance.isBusinessOwner,
      if (instance.ownedBusinessIds?.toList() case final value?)
        'ownedBusinessIds': value,
      if (instance.favoriteOfferIds?.toList() case final value?)
        'favoriteOfferIds': value,
      if (instance.searchHistory case final value?) 'searchHistory': value,
      if (instance.cart?.toJson() case final value?) 'cart': value,
      if (instance.creditCards?.map((e) => e.toJson()).toList()
          case final value?)
        'creditCards': value,
      if (instance.reviews?.map((e) => e.toJson()).toList() case final value?)
        'reviews': value,
    };
