import 'package:project_marba/src/features/orders/data/orders_repository/firebase_orders_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'orders_repository.dart';

part 'orders_repository_provider.g.dart';

@riverpod
OrdersRepository ordersRepository(OrdersRepositoryRef ref) {
  return FirebaseOrdersRepository();
}
