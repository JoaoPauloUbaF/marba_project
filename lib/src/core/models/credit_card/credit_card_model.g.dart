// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credit_card_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreditCardModelImpl _$$CreditCardModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CreditCardModelImpl(
      id: json['id'] as String,
      cardNumber: json['cardNumber'] as String,
      cardHolderName: json['cardHolderName'] as String,
      expirationDate: json['expirationDate'] as String,
      cvv: json['cvv'] as String,
      brand: json['brand'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$CreditCardModelImplToJson(
        _$CreditCardModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cardNumber': instance.cardNumber,
      'cardHolderName': instance.cardHolderName,
      'expirationDate': instance.expirationDate,
      'cvv': instance.cvv,
      'brand': instance.brand,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
