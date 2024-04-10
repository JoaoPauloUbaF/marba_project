import 'package:project_marba/src/core/models/address/address.dart';
import 'package:project_marba/src/core/models/cart_item/cart_item_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/models/order/business_order_item.dart';
import '../../../../core/models/order/business_order_model.dart';
import '../../../../core/models/order/order.dart';

part 'order_view_model.g.dart';

@Riverpod(keepAlive: true)
class OrderViewModel extends _$OrderViewModel {
  @override
  Order? build() {
    return null;
  }

  Future<void> createNewOrder({
    required String customerId,
    required List<CartItemModel> items,
    required double total,
    required double deliveryFee,
    required double discount,
    required DateTime createdAt,
    required DateTime updatedAt,
    required Address address,
    DateTime? canceledAt,
  }) async {
    final groupedItemsByBusiness = <String, List<CartItemModel>>{};

    for (var item in items) {
      final businessId = item.businessId;
      if (!groupedItemsByBusiness.containsKey(businessId)) {
        groupedItemsByBusiness[businessId] = [];
      }
      groupedItemsByBusiness[businessId]!.add(item);
    }

    final businessOrders = groupedItemsByBusiness.entries.map((entry) {
      final businessId = entry.key;
      final items = entry.value;
      final businessOrderItems = items.map((item) {
        return BusinessOrderItem(
          id: item.id,
          name: item.name,
          imageUrl: item.imageUrl,
          price: item.price,
          quantity: item.quantity,
          deliveredAt: null,
          canceledAt: null,
          scheduledAt: null,
          status: BusinessOrderItemStatus.pending,
        );
      }).toSet();

      return BusinessOrder(
        businessId: businessId,
        items: businessOrderItems,
        status: BusinessOrderStatus.pending,
        createdAt: createdAt,
        updatedAt: updatedAt,
        canceledAt: null,
      );
    }).toList();

    final order = Order(
      id: const Uuid().v4(),
      customerId: customerId,
      businessOrders: businessOrders,
      total: total,
      createdAt: createdAt,
      updatedAt: updatedAt,
      address: address,
      canceledAt: canceledAt,
      totalDeliveryFee: deliveryFee,
      discount: discount,
    );

    state = order;
  }

  List<BusinessOrderItem>? getOrderItems() {
    return state?.businessOrders.expand((element) => element.items).toList();
  }
}
