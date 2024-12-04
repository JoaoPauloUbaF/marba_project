import 'package:project_marba/src/features/orders/data/user_orders_repository/firebase_users_orders_repository.dart';
import 'package:project_marba/src/features/orders/data/user_orders_repository/user_orders_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'user_orders_repository_provider.g.dart';

@riverpod
UserOrdersRepository userOrdersRepository(UserOrdersRepositoryRef ref) {
  return FirebaseUsersOrdersRepository();
}
