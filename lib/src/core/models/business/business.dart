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
    required String email,
    required String phoneNumber,
    required AddressModel address,
    required BusinessStatus status,
    required Set<BusinessCategory> categories,
    required Set<String> offersIds,
    double? deliveryFee,
    double? minimumOrderValue,
    Set<double>? deliveryTime,
    Map<String, String>? openingHours,
    String? profileImageUrl,
    Set<String>? categoriesWords,
    List<String>? nameWords,
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
