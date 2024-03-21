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
      categories: (json['categories'] as List<dynamic>)
          .map((e) => $enumDecode(_$BusinessCategoryEnumMap, e))
          .toSet(),
      offersIds:
          (json['offersIds'] as List<dynamic>).map((e) => e as String).toSet(),
      imageUrl: json['imageUrl'] as String?,
    );

Map<String, dynamic> _$$BusinessImplToJson(_$BusinessImpl instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'name': instance.name,
    'email': instance.email,
    'phoneNumber': instance.phoneNumber,
    'address': instance.address.toJson(),
    'status': _$BusinessStatusEnumMap[instance.status]!,
    'categories':
        instance.categories.map((e) => _$BusinessCategoryEnumMap[e]!).toList(),
    'offersIds': instance.offersIds.toList(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('imageUrl', instance.imageUrl);
  return val;
}

const _$BusinessStatusEnumMap = {
  BusinessStatus.open: 'open',
  BusinessStatus.closed: 'closed',
  BusinessStatus.pending: 'pending',
  BusinessStatus.rejected: 'rejected',
  BusinessStatus.suspended: 'suspended',
  BusinessStatus.deleted: 'deleted',
};

const _$BusinessCategoryEnumMap = {
  BusinessCategory.homeServices: 'homeServices',
  BusinessCategory.automotiveServices: 'automotiveServices',
  BusinessCategory.professionalServices: 'professionalServices',
  BusinessCategory.beautyServices: 'beautyServices',
  BusinessCategory.healthServices: 'healthServices',
  BusinessCategory.entertainmentServices: 'entertainmentServices',
  BusinessCategory.petServices: 'petServices',
  BusinessCategory.eventServices: 'eventServices',
  BusinessCategory.educationServices: 'educationServices',
  BusinessCategory.foodAndBeverage: 'foodAndBeverage',
  BusinessCategory.retail: 'retail',
  BusinessCategory.clothing: 'clothing',
  BusinessCategory.electronics: 'electronics',
  BusinessCategory.homeAndGarden: 'homeAndGarden',
  BusinessCategory.appliances: 'appliances',
  BusinessCategory.toysAndGames: 'toysAndGames',
  BusinessCategory.booksAndStationery: 'booksAndStationery',
  BusinessCategory.sportsAndOutdoors: 'sportsAndOutdoors',
  BusinessCategory.automotive: 'automotive',
  BusinessCategory.beautyAndPersonalCare: 'beautyAndPersonalCare',
  BusinessCategory.healthAndWellness: 'healthAndWellness',
  BusinessCategory.artsAndCrafts: 'artsAndCrafts',
  BusinessCategory.jewelryAndAccessories: 'jewelryAndAccessories',
  BusinessCategory.petSupplies: 'petSupplies',
  BusinessCategory.eventPlanning: 'eventPlanning',
  BusinessCategory.photography: 'photography',
  BusinessCategory.musicAndInstruments: 'musicAndInstruments',
  BusinessCategory.technologyServices: 'technologyServices',
  BusinessCategory.financialServices: 'financialServices',
  BusinessCategory.legalServices: 'legalServices',
  BusinessCategory.realEstate: 'realEstate',
  BusinessCategory.marketingAndAdvertising: 'marketingAndAdvertising',
  BusinessCategory.transportationServices: 'transportationServices',
  BusinessCategory.hospitalityServices: 'hospitalityServices',
  BusinessCategory.construction: 'construction',
  BusinessCategory.repairAndMaintenance: 'repairAndMaintenance',
  BusinessCategory.other: 'other',
};
