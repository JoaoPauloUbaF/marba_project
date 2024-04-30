import 'package:freezed_annotation/freezed_annotation.dart';

import 'enums.dart';

part 'service.freezed.dart';
part 'service.g.dart';

@freezed
class Service with _$Service {
  factory Service({
    required String status,
    required ServicePricingType pricingType,
  }) = _Service;

  factory Service.fromJson(Map<String, dynamic> json) =>
      _$ServiceFromJson(json);
}
