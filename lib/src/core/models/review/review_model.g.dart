// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReviewModelOfferImpl _$$ReviewModelOfferImplFromJson(
        Map<String, dynamic> json) =>
    _$ReviewModelOfferImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      reviewerName: json['reviewerName'] as String,
      offerId: json['offerId'] as String,
      review: json['review'] as String,
      rating: (json['rating'] as num).toDouble(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ReviewModelOfferImplToJson(
        _$ReviewModelOfferImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'reviewerName': instance.reviewerName,
      'offerId': instance.offerId,
      'review': instance.review,
      'rating': instance.rating,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'runtimeType': instance.$type,
    };

_$ReviewModelBusinessImpl _$$ReviewModelBusinessImplFromJson(
        Map<String, dynamic> json) =>
    _$ReviewModelBusinessImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      businessId: json['businessId'] as String,
      reviewerName: json['reviewerName'] as String,
      review: json['review'] as String,
      rating: (json['rating'] as num).toDouble(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ReviewModelBusinessImplToJson(
        _$ReviewModelBusinessImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'businessId': instance.businessId,
      'reviewerName': instance.reviewerName,
      'review': instance.review,
      'rating': instance.rating,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'runtimeType': instance.$type,
    };
