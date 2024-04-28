import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:project_marba/src/core/models/address/address.dart';
import 'package:project_marba/src/features/payment/application/payment_method_view_model/payment_method_view_model.dart';

part 'order_model.freezed.dart';
part 'order_model.g.dart';

@freezed
class OrderModel with _$OrderModel {
  factory OrderModel({
    required String id,
    required String customerId,
    required List<String> businessOrdersIds,
    required double total,
    required double totalDeliveryFee,
    required double discount,
    required Address address,
    required DateTime createdAt,
    required DateTime updatedAt,
    required PaymentMethod paymentMethod,
    DateTime? paymentConfirmedAt,
    DateTime? canceledAt,
  }) = _OrderModel;

  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);
}

enum OrderStatus {
  pending,
  running,
  done,
  canceled,
}
