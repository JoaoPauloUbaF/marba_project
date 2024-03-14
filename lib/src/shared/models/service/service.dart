import 'package:freezed_annotation/freezed_annotation.dart';

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
    // Address address,
    // DateTime scheduledAt,
    // String serviceProfessional,
    // String contractorName,
    // String? additionalInfo,
  }) = _Service;

  factory Service.fromJson(Map<String, dynamic> json) =>
      _$ServiceFromJson(json);
}

enum ServiceCategory {
  beauty,
  health,
  home,
  construction,
  pets,
  other,
}
