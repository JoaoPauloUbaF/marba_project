import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_marba/src/core/models/order/order_model.dart';
import 'package:project_marba/src/features/authentication/data/firebase_auth_provider.dart';
import 'package:project_marba/src/features/orders/data/user_orders_repository/user_orders_repository.dart';
import 'package:project_marba/src/features/user_profile/application/current_user_profile_provider/current_user_profile_provider.dart';

class FirebaseUsersOrdersRepository extends UserOrdersRepository {
  CollectionReference ordersCollection =
      FirebaseFirestore.instance.collection('orders');

  @override
  Future<Map<String, dynamic>> getBuyingDataByUserAndDateRange(
      DateTime startDate, DateTime endDate) {
    // TODO: implement getBuyingDataByUserAndDateRange
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> getUserBuyingData() {
    // TODO: implement getUserBuyingData
    throw UnimplementedError();
  }

  @override
  Future<List<OrderModel>> getUserClosedOrders() async {
    final container = ProviderContainer();
    final userId = container.read(currentUserProvider)?.id;

    if (userId == null) {
      throw Exception('User ID not found');
    }

    try {
      final snapshot = await ordersCollection
          .where('customerId', isEqualTo: userId)
          .where('status', isEqualTo: OrderStatus.done.toString())
          .get();
      return snapshot.docs
          .map((doc) => OrderModel.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<OrderModel>> getUserOpenOrders() async {
    final container = ProviderContainer();
    final userId = container.read(currentUserProvider)?.id;

    if (userId == null) {
      throw Exception('User ID not found');
    }

    try {
      final snapshot = await ordersCollection
          .where('customerId', isEqualTo: userId)
          .where('status', isNotEqualTo: OrderStatus.done.toString())
          .get();
      return snapshot.docs
          .map((doc) => OrderModel.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<int> getUserOrderCount() {
    // TODO: implement getUserOrderCount
    throw UnimplementedError();
  }

  @override
  Stream<List<OrderModel>> getUserOrders() async* {
    final container = ProviderContainer();
    final userId = container.read(authRepositoryProvider).getCurrentUser()?.uid;

    if (userId == null) {
      throw Exception('User ID not found');
    }

    try {
      final snapshot =
          await ordersCollection.where('customerId', isEqualTo: userId).get();
      yield snapshot.docs
          .map((doc) => OrderModel.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
    } catch (e) {
      rethrow;
    }
  }
}
