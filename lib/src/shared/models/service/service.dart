import 'package:freezed_annotation/freezed_annotation.dart';

part 'service.freezed.dart';
part 'service.g.dart';

@freezed
class Service with _$Service {
  factory Service({
    required String id,
    required String title,
    required String description,
    required double price,
    required String imageUrl,
    required String category,
    required String status,
    required DateTime createdAt,
    required DateTime updatedAt,
    required String address,
    required DateTime scheduledAt,
    required String serviceProfessional,
    required String recipientName,
    required String? aditionalInfo,
  }) = _Service;

  factory Service.fromJson(Map<String, dynamic> json) =>
      _$ServiceFromJson(json);
}
