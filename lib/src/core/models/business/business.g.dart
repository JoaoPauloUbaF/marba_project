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
      address: Address.fromJson(json['address'] as Map<String, dynamic>),
      status: $enumDecode(_$BusinessStatusEnumMap, json['status']),
      categories: (json['categories'] as List<dynamic>)
          .map((e) => $enumDecode(_$BusinessCategoryEnumMap, e))
          .toSet(),
      offersIds:
          (json['offersIds'] as List<dynamic>).map((e) => e as String).toSet(),
      deliveryFee: (json['deliveryFee'] as num).toDouble(),
      categoriesWords: (json['categoriesWords'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toSet(),
      rating: (json['rating'] as num?)?.toDouble(),
      nameWords: (json['nameWords'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      imageUrl: json['imageUrl'] as String?,
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
    'deliveryFee': instance.deliveryFee,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('categoriesWords', instance.categoriesWords?.toList());
  writeNotNull('rating', instance.rating);
  writeNotNull('nameWords', instance.nameWords);
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
};
