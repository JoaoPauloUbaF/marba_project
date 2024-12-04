import 'package:intl/intl.dart';
import 'package:project_marba/src/core/models/address/address.dart';
import 'package:project_marba/src/core/models/cart_item/cart_item_model.dart';
import 'package:project_marba/src/features/authentication/data/firebase_auth_provider.dart';
import 'package:project_marba/src/features/business/data/business_profile_data/business_profile_provider.dart';
import 'package:project_marba/src/features/orders/data/business_orders_repository/business_orders_repository_provider.dart';
import 'package:project_marba/src/features/orders/data/orders_repository/orders_repository_provider.dart';
import 'package:project_marba/src/features/payment/application/payment_method_view_model/payment_method_view_model.dart';
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
    required AddressModel address,
    DateTime? canceledAt,
    required PaymentMethod paymentMethod,
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
      final businessOrderId = const Uuid().v4();
      final businessOrderItems = items.map((item) {
        return BusinessOrderItem(
          id: item.id,
          businessOrderId: businessOrderId,
          name: item.name,
          imageUrl: item.imageUrl,
          price: item.price,
          cost: item.cost,
          quantity: item.quantity,
          deliveredAt: null,
          canceledAt: null,
          scheduledAt: null,
          status: BusinessOrderItemStatus.pending,
        );
      }).toSet();

      final businessOrderTemp = BusinessOrder(
        id: businessOrderId,
        userNickname: userNickname,
        address: address,
        businessId: businessId,
        items: businessOrderItems,
        status: BusinessOrderStatus.waitingConfirmation,
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
      paymentMethod: paymentMethod,
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

  void setState({required OrderModel order}) {
    state = order;
  }

  Future<String> getBusinessOrderBusinessName(String businessId) async {
    return await ref
        .read(businessProfileDataProvider)
        .getBusinessProfileData(uid: businessId)
        .then((value) => value!.name);
  }

  void dispose() {
    state = null;
  }

  String getDeliveryTime() {
    //TODO: implement business delivery time
    final order = state;
    if (order == null) return '';
    final startDeliveryTime = order.createdAt.add(const Duration(minutes: 40));
    final endDeliveryTime = order.createdAt.add(const Duration(minutes: 60));
    return '${DateFormat.jm().format(startDeliveryTime.toLocal())} - ${DateFormat.jm().format(endDeliveryTime.toLocal())}';
  }

  Future<double> getOrderDeliveryProgressByBusiness(
      {required BusinessOrderItem orderItem}) async {
    final businessOrder = await ref
        .read(businessOrdersRepositoryProvider)
        .getBusinessOrderById(orderId: orderItem.businessOrderId)
        .first;

    if (businessOrder == null) return 0.0;
    switch (businessOrder.status) {
      case BusinessOrderStatus.waitingConfirmation:
        return 0.0;
      case BusinessOrderStatus.accepted:
        return 0.25;
      case BusinessOrderStatus.preparing:
        return 0.50;
      case BusinessOrderStatus.delivering:
        return 0.99;
      case BusinessOrderStatus.delivered || BusinessOrderStatus.done:
        return 1.0;
      case BusinessOrderStatus.canceled:
        return 0.0;
      default:
        return 0.0;
    }
  }

  Future<String> getOrderItemDeliveryStatusByBusiness(
      {required BusinessOrderItem orderItem}) async {
    final businessOrder = await ref
        .read(businessOrdersRepositoryProvider)
        .getBusinessOrderById(orderId: orderItem.businessOrderId)
        .first;

    if (businessOrder == null) return '';
    switch (businessOrder.status) {
      case BusinessOrderStatus.waitingConfirmation:
        return 'Aguardando confirmação';
      case BusinessOrderStatus.accepted:
        return 'Pedido aceito';
      case BusinessOrderStatus.preparing:
        return 'Preparando pedido';
      case BusinessOrderStatus.delivering:
        return 'A caminho do seu endereço';
      case BusinessOrderStatus.delivered:
        return 'Pedido no seu endereço';
      case BusinessOrderStatus.done:
        return 'Pedido finalizado';
      case BusinessOrderStatus.canceled:
        return 'Pedido cancelado';
      default:
        return '';
    }
  }

  Future<Map<String, List<BusinessOrderItem>>>
      getOrderItemsGroupedByBusiness() async {
    final order = state;
    if (order == null) return {};

    final businessOrdersRepository = ref.read(businessOrdersRepositoryProvider);
    Map<String, List<BusinessOrderItem>> itemsGroupedByBusiness = {};

    for (var businessOrderId in order.businessOrdersIds) {
      final orderBusinessOrder = await businessOrdersRepository
          .getBusinessOrderById(orderId: businessOrderId)
          .first;
      if (orderBusinessOrder == null) continue;
      final businessName =
          await getBusinessOrderBusinessName(orderBusinessOrder.businessId);

      if (itemsGroupedByBusiness.containsKey(orderBusinessOrder.businessId)) {
        itemsGroupedByBusiness[businessName]!.addAll(orderBusinessOrder.items);
      } else {
        itemsGroupedByBusiness[businessName] =
            orderBusinessOrder.items.toList();
      }
    }

    return itemsGroupedByBusiness;
  }

  Future<String> getBusinessIdByBusinessOrder(
      {required String businessOrderId}) async {
    final order = state;
    if (order == null) return '';

    final businessIdToNavigate = order.businessOrdersIds
        .firstWhere((element) => element == businessOrderId);
    final businessOrder = await ref
        .read(businessOrdersRepositoryProvider)
        .getBusinessOrderById(orderId: businessIdToNavigate)
        .first;
    if (businessOrder == null) return '';

    final businessToNavigate = await ref
        .read(businessProfileDataProvider)
        .getBusinessProfileData(uid: businessOrder.businessId);
    if (businessToNavigate == null) return '';
    return businessToNavigate.id;
  }
}
