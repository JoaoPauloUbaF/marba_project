import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:project_marba/src/core/models/order/business_order_model.dart';
import 'package:project_marba/src/core/widgets/large_horizontal_space_widget.dart';
import 'package:project_marba/src/features/business/application/business_orders_view_model/business_orders_view_model.dart';

class OrderListItem extends ConsumerWidget {
  final BusinessOrder order;

  const OrderListItem({
    super.key,
    required this.order,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final businessOrdersViewModel =
        ref.watch(businessOrdersViewModelProvider.notifier);
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      color: businessOrdersViewModel.getCardColor(status: order.status),
      child: InkWell(
        onTap: () {
          businessOrdersViewModel.openOrderDetails(
            order: order,
            context: context,
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Pedido #${order.id.split('-').first}',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const Spacer(),
                  Text(
                    businessOrdersViewModel.getStatusTranslation(
                        order.status.toString().split('.').last),
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: businessOrdersViewModel.getStatusTextColor(
                              status: order.status),
                        ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    ' R\$${order.items.fold(0.0, (total, item) => total + item.price * item.quantity).toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    DateFormat('dd/MM/yyyy', 'pt_BR').format(order.createdAt),
                  ),
                  const LargeHorizontalSpaceWidget(),
                  Icon(
                    Icons.arrow_forward,
                    color: Theme.of(context).primaryColor,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
