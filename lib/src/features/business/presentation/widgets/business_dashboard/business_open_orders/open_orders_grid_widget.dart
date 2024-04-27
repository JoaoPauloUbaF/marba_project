import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_marba/src/features/business/application/business_orders_view_model/business_orders_view_model.dart';
import 'package:project_marba/src/features/business/presentation/widgets/business_dashboard/business_open_orders/order_grid_item.dart';

class OpenOrdersGridWidget extends ConsumerWidget {
  const OpenOrdersGridWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final businessOrdersViewModel =
        ref.watch(businessOrdersViewModelProvider.notifier);
    final businessOrders = ref.watch(businessOrdersViewModelProvider);
    return businessOrders.when(
      data: (orders) {
        if (orders.isEmpty) {
          return const Center(
            child: Text('Nenhum pedido encontrado'),
          );
        }
        return GridView.builder(
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: orders.length,
          itemBuilder: (context, index) {
            final sortedOrders = orders.toList()
              ..sort((a, b) => b.createdAt.compareTo(a.createdAt));
            final order = sortedOrders[index];
            return OrderGridItem(
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
