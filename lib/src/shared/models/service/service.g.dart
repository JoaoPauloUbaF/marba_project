// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ServiceImpl _$$ServiceImplFromJson(Map<String, dynamic> json) =>
    _$ServiceImpl(
      title: json['title'] as String,
      description: json['description'] as String,
      price: (json['price'] as num).toDouble(),
      imageUrl: json['imageUrl'] as String,
      status: json['status'] as String,
      address: Address.fromJson(json['address'] as Map<String, dynamic>),
      scheduledAt: DateTime.parse(json['scheduledAt'] as String),
      serviceProfessionalName: json['serviceProfessionalName'] as String,
      contractorName: json['contractorName'] as String,
      additionalInfo: json['additionalInfo'] as String?,
    );

Map<String, dynamic> _$$ServiceImplToJson(_$ServiceImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'price': instance.price,
      'imageUrl': instance.imageUrl,
      'status': instance.status,
      'address': instance.address,
      'scheduledAt': instance.scheduledAt.toIso8601String(),
      'serviceProfessionalName': instance.serviceProfessionalName,
      'contractorName': instance.contractorName,
      'additionalInfo': instance.additionalInfo,
    };
