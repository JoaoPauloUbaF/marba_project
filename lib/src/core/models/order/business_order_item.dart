import 'package:freezed_annotation/freezed_annotation.dart';

part 'business_order_item.freezed.dart';
part 'business_order_item.g.dart';

@freezed
class BusinessOrderItem with _$BusinessOrderItem {
  factory BusinessOrderItem({
    required String id,
    required String businessOrderId,
    required String name,
    required String imageUrl,
    required double price,
    required double cost,
    required int quantity,
    DateTime? deliveredAt,
    DateTime? canceledAt,
    DateTime? scheduledAt,
    required BusinessOrderItemStatus status,
  }) = _BusinessOrderItem;

  factory BusinessOrderItem.fromJson(Map<String, dynamic> json) =>
      _$BusinessOrderItemFromJson(json);
}

enum BusinessOrderItemStatus {
  pending,
  preparing,
  delivering,
  delivered,
  done,
  canceled,
}
