import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../core/models/order/order_model.dart';
import 'orders_repository.dart';

class FirebaseOrdersRepository implements OrdersRepository {
  final CollectionReference _ordersCollection =
      FirebaseFirestore.instance.collection('orders');

  @override
  Future<void> cancelOrder({required String orderId}) {
    try {
      return _ordersCollection
          .doc(orderId)
          .update({'status': OrderStatus.canceled.toString()});
    } catch (e) {
      throw Exception('Falha ao cancelar ordem: $e');
    }
  }

  @override
  Future<void> completeOrder({required String orderId}) {
    try {
      return _ordersCollection
          .doc(orderId)
          .update({'status': OrderStatus.done.toString()});
    } catch (e) {
      throw Exception('Falha ao completar ordem: $e');
    }
  }

  @override
  Future<OrderModel?> getOrderById({required String orderId}) {
    try {
      return _ordersCollection.doc(orderId).get().then((doc) {
        if (doc.exists) {
          return OrderModel.fromJson(doc.data() as Map<String, dynamic>);
        } else {
          return null;
        }
      });
    } catch (e) {
      throw Exception('Falha ao buscar ordem: $e');
    }
  }

  @override
  Future<List<OrderModel>> getOrdersByStatus({required String status}) {
    try {
      return _ordersCollection
          .where('status', isEqualTo: status)
          .get()
          .then((querySnapshot) {
        return querySnapshot.docs
            .map((doc) =>
                OrderModel.fromJson(doc.data() as Map<String, dynamic>))
            .toList();
      });
    } catch (e) {
      throw Exception('Falha ao buscar ordens: $e');
    }
  }

  @override
  Future<String> saveOrder({required OrderModel order}) {
    try {
      return _ordersCollection.add(order.toJson()).then((doc) => doc.id);
    } catch (e) {
      throw Exception('Falha ao salvar ordem: $e');
    }
  }

  @override
  Future<void> updateOrderStatus(
      {required String orderId, required String newStatus}) {
    try {
      return _ordersCollection.doc(orderId).update({'status': newStatus});
    } catch (e) {
      throw Exception('Falha ao atualizar status da ordem: $e');
    }
  }
}