// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'business.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BusinessModelImpl _$$BusinessModelImplFromJson(Map<String, dynamic> json) =>
    _$BusinessModelImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      nameWords: (json['nameWords'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      email: json['email'] as String,
      phoneNumber: json['phoneNumber'] as String,
      address: AddressModel.fromJson(json['address'] as Map<String, dynamic>),
      status: $enumDecode(_$BusinessStatusEnumMap, json['status']),
      categories: (json['categories'] as List<dynamic>)
          .map((e) => $enumDecode(_$BusinessCategoryEnumMap, e))
          .toSet(),
      categoriesWords: (json['categoriesWords'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toSet(),
      offersIds:
          (json['offersIds'] as List<dynamic>).map((e) => e as String).toSet(),
      profileImageUrl: json['profileImageUrl'] as String?,
      minimumOrderValue: (json['minimumOrderValue'] as num?)?.toDouble(),
      deliveryFee: (json['deliveryFee'] as num?)?.toDouble(),
      deliveryTime: (json['deliveryTime'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toSet(),
      baseDeliveryDistance: (json['baseDeliveryDistance'] as num?)?.toDouble(),
      additionalDistanceFee:
          (json['additionalDistanceFee'] as num?)?.toDouble(),
      openingHours: (json['openingHours'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
      averageRating: (json['averageRating'] as num?)?.toDouble(),
      ratingDistribution:
          (json['ratingDistribution'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(int.parse(k), (e as num).toInt()),
      ),
    );

Map<String, dynamic> _$$BusinessModelImplToJson(_$BusinessModelImpl instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'name': instance.name,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('nameWords', instance.nameWords);
  val['email'] = instance.email;
  val['phoneNumber'] = instance.phoneNumber;
  val['address'] = instance.address.toJson();
  val['status'] = _$BusinessStatusEnumMap[instance.status]!;
  val['categories'] =
      instance.categories.map((e) => _$BusinessCategoryEnumMap[e]!).toList();
  writeNotNull('categoriesWords', instance.categoriesWords?.toList());
  val['offersIds'] = instance.offersIds.toList();
  writeNotNull('profileImageUrl', instance.profileImageUrl);
  writeNotNull('minimumOrderValue', instance.minimumOrderValue);
  writeNotNull('deliveryFee', instance.deliveryFee);
  writeNotNull('deliveryTime', instance.deliveryTime?.toList());
  writeNotNull('baseDeliveryDistance', instance.baseDeliveryDistance);
  writeNotNull('additionalDistanceFee', instance.additionalDistanceFee);
  writeNotNull('openingHours', instance.openingHours);
  writeNotNull('averageRating', instance.averageRating);
  writeNotNull('ratingDistribution',
      instance.ratingDistribution?.map((k, e) => MapEntry(k.toString(), e)));
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
