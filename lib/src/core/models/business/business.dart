import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:project_marba/src/core/models/address/address.dart';

import 'enums.dart';

part 'business.freezed.dart';
part 'business.g.dart';

@freezed
class BusinessModel with _$BusinessModel {
  factory BusinessModel({
    required String id,
    required String name,
    List<String>? nameWords,
    required String email,
    required String phoneNumber,
    required AddressModel address,
    required BusinessStatus status,
    required Set<BusinessCategory> categories,
    Set<String>? categoriesWords,
    required Set<String> offersIds,
    String? profileImageUrl,
    double? minimumOrderValue,
    double? deliveryFee,
    Set<int>? deliveryTime,
    double? baseDeliveryDistance,
    double? additionalDistanceFee,
    Map<String, String>? openingHours,
    double? averageRating,
    Map<int, int>? ratingDistribution,
  }) = _BusinessModel;

  factory BusinessModel.fromJson(Map<String, dynamic> json) =>
      _$BusinessModelFromJson(json);
}

enum BusinessStatus {
  open,
  closed,
  pending,
  rejected,
  suspended,
}
