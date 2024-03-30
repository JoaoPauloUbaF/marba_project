import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:project_marba/src/shared/models/address/address.dart';

import 'enums.dart';

part 'business.freezed.dart';
part 'business.g.dart';

@freezed
class Business with _$Business {
  factory Business({
    required String id,
    required String name,
    required String email,
    required String phoneNumber,
    required Address address,
    required BusinessStatus status,
    required Set<BusinessCategory> categories,
    required Set<String> offersIds,
    double? rating,
    required double deliveryFee,
    String? imageUrl,
  }) = _Business;

  factory Business.fromJson(Map<String, dynamic> json) =>
      _$BusinessFromJson(json);
}

enum BusinessStatus {
  open,
  closed,
  pending,
  rejected,
  suspended,
  deleted,
}
