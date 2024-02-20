// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'business.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BusinessImpl _$$BusinessImplFromJson(Map<String, dynamic> json) =>
    _$BusinessImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      phoneNumber: json['phoneNumber'] as String,
      address: Address.fromJson(json['address'] as Map<String, dynamic>),
      status: $enumDecode(_$BusinessStatusEnumMap, json['status']),
      category: (json['category'] as List<dynamic>)
          .map((e) => $enumDecode(_$BusinessCategoryEnumMap, e))
          .toSet(),
      offersIds:
          (json['offersIds'] as List<dynamic>).map((e) => e as String).toSet(),
    );

Map<String, dynamic> _$$BusinessImplToJson(_$BusinessImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'address': instance.address,
      'status': _$BusinessStatusEnumMap[instance.status]!,
      'category':
          instance.category.map((e) => _$BusinessCategoryEnumMap[e]!).toList(),
      'offersIds': instance.offersIds.toList(),
    };

const _$BusinessStatusEnumMap = {
  BusinessStatus.open: 'open',
  BusinessStatus.closed: 'closed',
  BusinessStatus.pending: 'pending',
  BusinessStatus.rejected: 'rejected',
  BusinessStatus.suspended: 'suspended',
  BusinessStatus.deleted: 'deleted',
};

const _$BusinessCategoryEnumMap = {
  BusinessCategory.aesthetics: 'aesthetics',
  BusinessCategory.entertainment: 'entertainment',
  BusinessCategory.cooking: 'cooking',
  BusinessCategory.transport: 'transport',
  BusinessCategory.food: 'food',
  BusinessCategory.clothing: 'clothing',
  BusinessCategory.electronics: 'electronics',
  BusinessCategory.services: 'services',
};
