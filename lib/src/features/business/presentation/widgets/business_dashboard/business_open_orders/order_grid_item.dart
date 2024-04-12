import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:project_marba/src/core/models/order/business_order_model.dart';
import 'package:project_marba/src/features/business/application/business_orders_view_model/business_orders_view_model.dart';

class OrderGridItem extends ConsumerWidget {
  final BusinessOrder order;

  const OrderGridItem({
    super.key,
    required this.order,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final businessOrdersViewModel =
        ref.watch(businessOrdersViewModelProvider.notifier);

    return InkWell(
      onTap: () => businessOrdersViewModel.openOrderDetails(
          order: order, context: context),
      child: Card.outlined(
        elevation: 2,
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        color: businessOrdersViewModel.getCardColor(status: order.status),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    '#${order.id.split('-').first}',
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const Spacer(),
                  Text(
                    businessOrdersViewModel.getStatusTranslation(
                        order.status.toString().split('.').last),
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: businessOrdersViewModel.getStatusTextColor(
                              status: order.status),
                        ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                DateFormat('dd/MM/yyyy', 'pt_BR').format(order.createdAt),
              ),
              const SizedBox(height: 8),
              Text(order.userNickname,
                  style: Theme.of(context).textTheme.bodyLarge),
              Spacer(),
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
                  Icon(
                    Icons.arrow_forward,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ],
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}
