import 'package:project_marba/src/core/models/address/address.dart';
import 'package:project_marba/src/core/models/cart_item/cart_item_model.dart';
import 'package:project_marba/src/features/authentication/data/firebase_auth_provider.dart';
import 'package:project_marba/src/features/business/data/business_profile_data/business_profile_provider.dart';
import 'package:project_marba/src/features/orders/data/business_orders_repository/business_orders_repository_provider.dart';
import 'package:project_marba/src/features/orders/data/orders_repository/orders_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/models/order/business_order_item.dart';
import '../../../../core/models/order/business_order_model.dart';
import '../../../../core/models/order/order_model.dart';

part 'order_view_model.g.dart';

@Riverpod(keepAlive: true)
class OrderViewModel extends _$OrderViewModel {
  @override
  OrderModel? build() {
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
    final String userNickname =
        ref.read(authRepositoryProvider).getCurrentUser()?.displayName ?? '';

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

      final businessOrderTemp = BusinessOrder(
        id: const Uuid().v4(),
        userNickname: userNickname,
        address: address,
        businessId: businessId,
        items: businessOrderItems,
        status: BusinessOrderStatus.pending,
        createdAt: createdAt,
        updatedAt: updatedAt,
        canceledAt: null,
      );

      ref
          .read(businessOrdersRepositoryProvider)
          .addOrder(order: businessOrderTemp);

      return businessOrderTemp;
    }).toList();

    final order = OrderModel(
      id: const Uuid().v4(),
      customerId: customerId,
      businessOrdersIds: businessOrders.map((e) => e.id).toList(),
      total: total,
      createdAt: createdAt,
      updatedAt: updatedAt,
      address: address,
      canceledAt: canceledAt,
      totalDeliveryFee: deliveryFee,
      discount: discount,
    );

    ref
        .read(ordersRepositoryProvider)
        .saveOrder(order: order)
        .then((value) => state = order);
  }

  Future<List<BusinessOrderItem>?> getOrderItems() async {
    //TODO: change to a provider
    final orderItems = await ref
        .read(ordersRepositoryProvider)
        .getOrderItems(orderId: state!.id);
    return orderItems;
  }

  void fetchOrder() {
    ref
        .read(ordersRepositoryProvider)
        .getOrderById(orderId: state!.id)
        .then((value) => state = value);
  }

  Future<String> getBusinessOrderBusinessName(String businessId) async {
    return await ref
        .read(businessProfileDataProvider)
        .getBusinessProfileData(uid: businessId)
        .then((value) => value!.name);
  }
}

@riverpod
Stream<List<BusinessOrder>> getBusinessOrders(GetBusinessOrdersRef ref) async* {
  final businessOrders = <BusinessOrder>[];
  for (var businessOrderId
      in ref.watch(orderViewModelProvider)?.businessOrdersIds ?? []) {
    final businessOrder = await ref
        .watch(businessOrdersRepositoryProvider)
        .getBusinessOrderById(orderId: businessOrderId)
        .first;
    businessOrders.add(businessOrder!);
  }
  yield businessOrders;
}
