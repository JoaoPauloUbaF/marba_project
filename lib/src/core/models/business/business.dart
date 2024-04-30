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
    required Address address,
    required BusinessStatus status,
    required Set<BusinessCategory> categories,
    required Set<String> offersIds,
    required double deliveryFee,
    Set<String>? categoriesWords,
    double? rating,
    List<String>? nameWords,
    String? imageUrl,
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
  deleted,
}
