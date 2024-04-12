import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_marba/src/features/business/application/business_orders_view_model/business_orders_view_model.dart';
import 'package:project_marba/src/features/business/presentation/widgets/business_dashboard/business_open_orders/order_list_item.dart';

class OpenOrdersListWidget extends ConsumerWidget {
  const OpenOrdersListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final businessOrders = ref.watch(businessOrdersViewModelProvider);
    return businessOrders.when(
      data: (orders) {
        if (orders.isEmpty) {
          return const Center(
            child: Text('Nenhum pedido encontrado'),
          );
        }
        return ListView.builder(
          itemCount: orders.length,
          itemBuilder: (context, index) {
            final sortedOrders = orders.toList()
              ..sort((a, b) => b.createdAt.compareTo(a.createdAt));
            final order = sortedOrders[index];
            return OrderListItem(
              order: order,
            );
          },
        );
      },
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
      error: (error, stackTrace) => Center(
        child: Text('Error: $error'),
      ),
    );
  }
}
