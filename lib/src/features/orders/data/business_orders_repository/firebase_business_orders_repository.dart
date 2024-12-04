import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_marba/src/core/models/order/business_order_item.dart';
import 'package:project_marba/src/core/models/order/business_order_model.dart';
import 'package:project_marba/src/features/business/application/business_profile_view_model/business_profile_screen_controller.dart';
import 'package:project_marba/src/features/orders/data/business_orders_repository/business_orders_repository.dart';

class FirebaseBusinessOrdersRepository extends BusinessOrdersRepository {
  CollectionReference businessOrdersCollection =
      FirebaseFirestore.instance.collection('business_orders');

  @override
  Future<void> addOrder({required BusinessOrder order}) async {
    try {
      businessOrdersCollection.doc(order.id).set(order.toJson());
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
          .where('status',
              isNotEqualTo: BusinessOrderStatus.waitingConfirmation.toString())
          .where('status',
              isNotEqualTo: BusinessOrderStatus.canceled.toString())
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
  Stream<BusinessOrder?> getBusinessOrderById(
      {required String orderId}) async* {
    try {
      final docReference = businessOrdersCollection.doc(orderId);
      yield* docReference.snapshots().map((snapshot) {
        if (snapshot.exists) {
          return BusinessOrder.fromJson(
              snapshot.data() as Map<String, dynamic>);
        } else {
          return null;
        }
      });
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
  Stream<List<BusinessOrder>> getOrders(
      {required String? businessId, required Query? query}) async* {
    if (businessId == null) {
      throw Exception('Business ID not found');
    }

    if (query != null) {
      try {
        yield* query.snapshots().map((snapshot) => snapshot.docs
            .map((doc) =>
                BusinessOrder.fromJson(doc.data() as Map<String, dynamic>))
            .toList());
      } catch (e) {
        rethrow;
      }
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
  Stream<List<BusinessOrder>> getOpenOrders(
      {required String businessId}) async* {
    try {
      final snapshot = await businessOrdersCollection
          .where('businessId', isEqualTo: businessId)
          .where('status',
              isNotEqualTo: BusinessOrderStatus.done.toString().split('.').last)
          .get();
      yield snapshot.docs
          .map((doc) =>
              BusinessOrder.fromJson(doc.data() as Map<String, dynamic>))
          .where((order) => order.status != BusinessOrderStatus.canceled)
          .toList();
    } catch (e) {
      log('Error: $e');
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
  Stream<List<BusinessOrder>> getOrdersByStatus(
      {required String status, required String businessId}) async* {
    try {
      final snapshot = await businessOrdersCollection
          .where('businessId', isEqualTo: businessId)
          .where('status', isEqualTo: status)
          .get();
      yield snapshot.docs
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
    try {
      businessOrdersCollection.where('id', isEqualTo: orderId).get().then(
        (snapshot) {
          if (snapshot.docs.isNotEmpty) {
            snapshot.docs.first.reference.update({'status': newStatus});
            snapshot.docs.first.reference
                .update({'updatedAt': Timestamp.now()});
            if (newStatus == BusinessOrderStatus.delivered.toString()) {
              snapshot.docs.first.reference
                  .update({'deliveredAt': DateTime.now().toString()});
            }
          }
        },
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Set<BusinessOrderItem>> getOrderItems({required String orderId}) {
    try {
      return businessOrdersCollection.doc(orderId).get().then((querySnapshot) {
        final BusinessOrder order = BusinessOrder.fromJson(
            querySnapshot.data() as Map<String, dynamic>);
        return order.items;
      });
    } catch (e) {
      throw Exception('Falha ao buscar itens do pedido: $e');
    }
  }

  @override
  Stream<List<BusinessOrder>> getOrdersWithQuery({
    required String businessId,
    required Map<String, dynamic> queryParameters,
  }) {
    Query query =
        businessOrdersCollection.where('businessId', isEqualTo: businessId);

    queryParameters.forEach((key, value) {
      switch (key) {
        case 'isEqualTo':
          value.forEach((field, val) {
            query = query.where(field, isEqualTo: val);
          });
          break;
        case 'isNotEqualTo':
          value.forEach((field, val) {
            query = query.where(field, isNotEqualTo: val);
          });
          break;
        case 'isLessThan':
          value.forEach((field, val) {
            query = query.where(field, isLessThan: val);
          });
          break;
        case 'isLessThanOrEqualTo':
          value.forEach((field, val) {
            query = query.where(field, isLessThanOrEqualTo: val);
          });
          break;
        case 'isGreaterThan':
          value.forEach((field, val) {
            query = query.where(field, isGreaterThan: val);
          });
          break;
        case 'isGreaterThanOrEqualTo':
          value.forEach((field, val) {
            query = query.where(field, isGreaterThanOrEqualTo: val);
          });
          break;
        case 'arrayContains':
          value.forEach((field, val) {
            query = query.where(field, arrayContains: val);
          });
          break;
        // Adicione mais casos conforme necessário
      }
    });

    return getOrders(businessId: businessId, query: query);
  }
}
