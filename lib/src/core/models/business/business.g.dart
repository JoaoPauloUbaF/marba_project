// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'business.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BusinessModelImpl _$$BusinessModelImplFromJson(Map<String, dynamic> json) =>
    _$BusinessModelImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      phoneNumber: json['phoneNumber'] as String,
      address: AddressModel.fromJson(json['address'] as Map<String, dynamic>),
      status: $enumDecode(_$BusinessStatusEnumMap, json['status']),
      categories: (json['categories'] as List<dynamic>)
          .map((e) => $enumDecode(_$BusinessCategoryEnumMap, e))
          .toSet(),
      offersIds:
          (json['offersIds'] as List<dynamic>).map((e) => e as String).toSet(),
      deliveryFee: (json['deliveryFee'] as num?)?.toDouble(),
      minimumOrderValue: (json['minimumOrderValue'] as num?)?.toDouble(),
      deliveryTime: (json['deliveryTime'] as List<dynamic>?)
          ?.map((e) => (e as num).toDouble())
          .toSet(),
      openingHours: (json['openingHours'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
      profileImageUrl: json['profileImageUrl'] as String?,
      categoriesWords: (json['categoriesWords'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toSet(),
      reviews: (json['reviews'] as List<dynamic>?)
          ?.map((e) => ReviewModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      nameWords: (json['nameWords'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$BusinessModelImplToJson(_$BusinessModelImpl instance) {
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

  writeNotNull('deliveryFee', instance.deliveryFee);
  writeNotNull('minimumOrderValue', instance.minimumOrderValue);
  writeNotNull('deliveryTime', instance.deliveryTime?.toList());
  writeNotNull('openingHours', instance.openingHours);
  writeNotNull('profileImageUrl', instance.profileImageUrl);
  writeNotNull('categoriesWords', instance.categoriesWords?.toList());
  writeNotNull('reviews', instance.reviews?.map((e) => e.toJson()).toList());
  writeNotNull('nameWords', instance.nameWords);
  return val;
}

const _$BusinessStatusEnumMap = {
  BusinessStatus.open: 'open',
  BusinessStatus.closed: 'closed',
  BusinessStatus.pending: 'pending',
  BusinessStatus.rejected: 'rejected',
  BusinessStatus.suspended: 'suspended',
};

const _$BusinessCategoryEnumMap = {
  BusinessCategory.appliances: 'appliances',
  BusinessCategory.artsAndCrafts: 'artsAndCrafts',
  BusinessCategory.automotive: 'automotive',
  BusinessCategory.beautyAndPersonalCare: 'beautyAndPersonalCare',
  BusinessCategory.booksAndStationery: 'booksAndStationery',
  BusinessCategory.clothing: 'clothing',
  BusinessCategory.electronics: 'electronics',
  BusinessCategory.foodAndBeverage: 'foodAndBeverage',
  BusinessCategory.healthAndWellness: 'healthAndWellness',
  BusinessCategory.homeAndGarden: 'homeAndGarden',
  BusinessCategory.jewelryAndAccessories: 'jewelryAndAccessories',
  BusinessCategory.marketingAndAdvertising: 'marketingAndAdvertising',
  BusinessCategory.musicAndInstruments: 'musicAndInstruments',
  BusinessCategory.other: 'other',
  BusinessCategory.petSupplies: 'petSupplies',
  BusinessCategory.realEstate: 'realEstate',
  BusinessCategory.retail: 'retail',
  BusinessCategory.sportsAndOutdoors: 'sportsAndOutdoors',
  BusinessCategory.toysAndGames: 'toysAndGames',
  BusinessCategory.mechanicServices: 'mechanicServices',
  BusinessCategory.barberServices: 'barberServices',
  BusinessCategory.hairdresserServices: 'hairdresserServices',
  BusinessCategory.cleanerServices: 'cleanerServices',
  BusinessCategory.painterServices: 'painterServices',
  BusinessCategory.electricianServices: 'electricianServices',
  BusinessCategory.plumberServices: 'plumberServices',
  BusinessCategory.gardenerServices: 'gardenerServices',
  BusinessCategory.bricklayerServices: 'bricklayerServices',
  BusinessCategory.driverServices: 'driverServices',
  BusinessCategory.cookServices: 'cookServices',
  BusinessCategory.waiterServices: 'waiterServices',
  BusinessCategory.itTechnicianServices: 'itTechnicianServices',
  BusinessCategory.personalTrainerServices: 'personalTrainerServices',
  BusinessCategory.nutritionistServices: 'nutritionistServices',
  BusinessCategory.dentistServices: 'dentistServices',
  BusinessCategory.doctorServices: 'doctorServices',
  BusinessCategory.lawyerServices: 'lawyerServices',
  BusinessCategory.accountantServices: 'accountantServices',
  BusinessCategory.therapistServices: 'therapistServices',
  BusinessCategory.barberShopServices: 'barberShopServices',
};
