import 'package:project_marba/src/features/orders/data/business_orders_repository/business_orders_repository.dart';
import 'package:project_marba/src/features/orders/data/business_orders_repository/firebase_business_orders_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'business_orders_repository_provider.g.dart';

@riverpod
BusinessOrdersRepository businessOrdersRepository(
    BusinessOrdersRepositoryRef ref) {
  return FirebaseBusinessOrdersRepository();
}
