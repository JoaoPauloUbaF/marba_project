import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/models/order/business_order_model.dart';
import '../../data/business_orders_repository/business_orders_repository_provider.dart';

part 'business_order_provider.g.dart';

@riverpod
Stream<BusinessOrder?> getBusinessOrder(GetBusinessOrderRef ref,
    {required String businessOrderId}) {
  final businessOrder = ref
      .watch(businessOrdersRepositoryProvider)
      .getBusinessOrderById(orderId: businessOrderId);
  return businessOrder;
}
