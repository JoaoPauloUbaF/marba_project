// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CartImpl _$$CartImplFromJson(Map<String, dynamic> json) => _$CartImpl(
      itemsIds:
          (json['itemsIds'] as List<dynamic>?)?.map((e) => e as String).toSet(),
      total: (json['total'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$CartImplToJson(_$CartImpl instance) =>
    <String, dynamic>{
      'itemsIds': instance.itemsIds?.toList(),
      'total': instance.total,
    };
