import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_marba/src/core/models/order/business_order_model.dart';
import 'package:project_marba/src/features/business/application/business_profile_screen_controller/business_profile_screen_controller.dart';
import 'package:project_marba/src/features/orders/data/business_orders_repository/business_orders_repository.dart';

class FirebaseBusinessOrdersRepository extends BusinessOrdersRepository {
  CollectionReference businessOrdersCollection =
      FirebaseFirestore.instance.collection('business_orders');

  @override
  Future<void> addOrder({required BusinessOrder order}) async {
    try {
      businessOrdersCollection.add(order.toJson());
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deleteOrder({required String orderId}) async {
    try {
      businessOrdersCollection.doc(orderId).delete();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<BusinessOrder>> getClosedOrders() async {
    try {
      final snapshot = await businessOrdersCollection
          .where('status', isEqualTo: BusinessOrderStatus.done.toString())
          .get();
      return snapshot.docs
          .map((doc) =>
              BusinessOrder.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<BusinessOrder>> getOpenOrders() async {
    final container = ProviderContainer();
    final businessId = container.read(businessProfileViewModelProvider)?.id;
    if (businessId == null) {
      throw Exception('Business ID not found');
    }
    try {
      final snapshot = await businessOrdersCollection
          .where('businessId', isEqualTo: businessId)
          .where('status', isEqualTo: BusinessOrderStatus.pending.toString())
          .get();
      return snapshot.docs
          .map((doc) =>
              BusinessOrder.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<BusinessOrder?> getOrderById({required String orderId}) async {
    final container = ProviderContainer();
    final businessId = container.read(businessProfileViewModelProvider)?.id;

    if (businessId == null) {
      throw Exception('Business ID not found');
    }

    try {
      final snapshot = await businessOrdersCollection
          .where('businessId', isEqualTo: businessId)
          .where('id', isEqualTo: orderId)
          .get();
      if (snapshot.docs.isNotEmpty) {
        return BusinessOrder.fromJson(
            snapshot.docs.first.data() as Map<String, dynamic>);
      } else {
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Map<String, int>> getOrderCountByStatus() async {
    final container = ProviderContainer();
    final businessId = container.read(businessProfileViewModelProvider)?.id;

    if (businessId == null) {
      throw Exception('Business ID not found');
    }

    try {
      final snapshot = await businessOrdersCollection
          .where('businessId', isEqualTo: businessId)
          .get();
      final orders = snapshot.docs
          .map((doc) =>
              BusinessOrder.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
      final orderCountByStatus = <String, int>{};
      for (var status in BusinessOrderStatus.values) {
        orderCountByStatus[status.toString()] =
            orders.where((order) => order.status == status).toList().length;
      }
      return orderCountByStatus;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Stream<List<BusinessOrder>> getOrders() async* {
    final container = ProviderContainer();
    final businessId = container.read(businessProfileViewModelProvider)?.id;

    if (businessId == null) {
      throw Exception('Business ID not found');
    }

    try {
      yield* businessOrdersCollection
          .where('businessId', isEqualTo: businessId)
          .snapshots()
          .map((snapshot) => snapshot.docs
              .map((doc) =>
                  BusinessOrder.fromJson(doc.data() as Map<String, dynamic>))
              .toList());
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<BusinessOrder>> getOrdersByCustomer(
      {required String customerId}) async {
    // TODO: implement getOrdersByCustomer
    throw UnimplementedError();
  }

  @override
  Future<List<BusinessOrder>> getOrdersByDateRange(
      {required DateTime startDate, required DateTime endDate}) async {
    // TODO: implement getOrdersByDateRange
    throw UnimplementedError();
  }

  @override
  Future<List<BusinessOrder>> getOrdersByStatus(
      {required String status}) async {
    final container = ProviderContainer();
    final businessId = container.read(businessProfileViewModelProvider)?.id;

    if (businessId == null) {
      throw Exception('Business ID not found');
    }

    try {
      final snapshot = await businessOrdersCollection
          .where('businessId', isEqualTo: businessId)
          .where('status', isEqualTo: status)
          .get();
      return snapshot.docs
          .map((doc) =>
              BusinessOrder.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<double> getTotalOrderValueByDateRange(
      {required DateTime startDate, required DateTime endDate}) async {
    throw UnimplementedError();
  }

  @override
  Future<double> getTotalRevenueByDateRange(
      DateTime startDate, DateTime endDate) async {
    throw UnimplementedError();
  }

  @override
  Future<void> updateOrder({required BusinessOrder order}) async {
    final container = ProviderContainer();
    final businessId = container.read(businessProfileViewModelProvider)?.id;

    if (businessId == null) {
      throw Exception('Business ID not found');
    }

    try {
      businessOrdersCollection
          .where('businessId', isEqualTo: businessId)
          .where('id', isEqualTo: order.id)
          .get()
          .then((snapshot) {
        if (snapshot.docs.isNotEmpty) {
          snapshot.docs.first.reference.update(order.toJson());
        }
      });
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> updateOrderStatus(
      {required String orderId, required String newStatus}) async {
    final container = ProviderContainer();
    final businessId = container.read(businessProfileViewModelProvider)?.id;

    if (businessId == null) {
      throw Exception('Business ID not found');
    }

    try {
      businessOrdersCollection
          .where('businessId', isEqualTo: businessId)
          .where('id', isEqualTo: orderId)
          .get()
          .then((snapshot) {
        if (snapshot.docs.isNotEmpty) {
          snapshot.docs.first.reference.update({'status': newStatus});
        }
      });
    } catch (e) {
      rethrow;
    }
  }
}
