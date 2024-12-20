import 'package:project_marba/src/core/models/order/order_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/user_orders_repository/user_orders_repository_provider.dart';

part 'user_orders_view_model.g.dart';

@riverpod
class UserOrdersViewModel extends _$UserOrdersViewModel {
  @override
  Stream<List<OrderModel>> build() {
    return ref
        .watch(userOrdersRepositoryProvider)
        .getUserOrders(lastOrderId: null);
  }

  Future<List<OrderModel>> fetchUserOrders(
      {required String lastOrderId}) async {
    final newOrders = ref
        .read(userOrdersRepositoryProvider)
        .getUserOrders(lastOrderId: lastOrderId);
    return newOrders.first;
  }
}
