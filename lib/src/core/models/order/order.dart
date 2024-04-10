import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:project_marba/src/core/models/address/address.dart';

import 'business_order_model.dart';

part 'order.freezed.dart';
part 'order.g.dart';

@freezed
class Order with _$Order {
  factory Order({
    required String id,
    required String customerId,
    required List<BusinessOrder> businessOrders,
    required double total,
    required double totalDeliveryFee,
    required double discount,
    required Address address,
    required DateTime createdAt,
    required DateTime updatedAt,
    DateTime? canceledAt,
  }) = _Order;

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);
}

enum OrderStatus {
  pending,
  running,
  done,
  canceled,
}
