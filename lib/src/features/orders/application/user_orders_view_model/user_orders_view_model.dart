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

  Future<List<OrderModel>> fetchNewOffers({required String lastOrderId}) async {
    //state = const AsyncValue.loading();
    final newOrders = ref
        .read(userOrdersRepositoryProvider)
        .getUserOrders(lastOrderId: lastOrderId);
    //state = AsyncValue.data(await newOrders.first);
    return newOrders.first;
  }
}
