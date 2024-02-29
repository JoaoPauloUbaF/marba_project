import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:project_marba/src/shared/models/address/address.dart';

part 'service.freezed.dart';
part 'service.g.dart';

@freezed
class Service with _$Service {
  factory Service({
    required String title,
    required String description,
    required double price,
    required String imageUrl,
    required String status,
    required Address address,
    required DateTime scheduledAt,
    required String serviceProfessionalName,
    required String contractorName,
    required String? additionalInfo,
  }) = _Service;

  factory Service.fromJson(Map<String, dynamic> json) =>
      _$ServiceFromJson(json);
}
