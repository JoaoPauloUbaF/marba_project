import 'package:freezed_annotation/freezed_annotation.dart';

part 'business_delivery.freezed.dart';
part 'business_delivery.g.dart';

@freezed
class BusinessDeliveryModel with _$BusinessDeliveryModel {
  factory BusinessDeliveryModel({
    required String baseDeliveryFee,
    required String additionalDistanceFee,
    required String baseDistance,
    required String minimumDeliveryTime,
    required String maximumDeliveryTime,
    required String minimumOrderValue,
  }) = _BusinessDeliveryModel;

  factory BusinessDeliveryModel.fromJson(Map<String, dynamic> json) =>
      _$BusinessDeliveryModelFromJson(json);
}
