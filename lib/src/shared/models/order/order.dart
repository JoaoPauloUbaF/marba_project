import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:project_marba/src/shared/models/address/address.dart';

part 'order.freezed.dart';
part 'order.g.dart';

@freezed
class Order with _$Order {
  factory Order({
    required String id,
    required String businessId,
    required String customerId,
    required String status,
    required Set<String> itemsIds,
    required double total,
    required DateTime createdAt,
    required DateTime updatedAt,
    required String address,
  }) = _Order;

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);
}
