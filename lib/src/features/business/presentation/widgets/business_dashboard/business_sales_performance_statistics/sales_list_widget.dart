import 'package:flutter/material.dart';
import 'package:project_marba/src/core/models/order/business_order_model.dart';
import 'package:project_marba/src/features/business/application/business_sales_view_model/business_sales_view_model.dart';

class SalesListWidget extends StatelessWidget {
  const SalesListWidget(
      {super.key, required this.orders, required this.viewModel});

  final List<BusinessOrder> orders;
  final BusinessSalesViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    final ordersByDate = viewModel.groupOrdersByDate(orders);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: ordersByDate.keys.length,
        itemBuilder: (context, index) {
          final date = ordersByDate.keys.elementAt(index);
          final dailyOrders = ordersByDate[date]!;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  date, // Exibe a data
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Theme.of(context).colorScheme.tertiary,
                      ),
                ),
              ),
              ...dailyOrders.map((order) {
                final orderIdPrefix = order.id.split('-').first;
                final totalItems = order.items.length;
                final totalProfit = order.items.fold<double>(
                  0,
                  (sum, item) => sum + (item.price - item.cost) * item.quantity,
                );
                final totalCosts = order.items.fold<double>(
                  0,
                  (sum, item) => sum + item.cost * item.quantity,
                );
                final totalSales = order.items.fold<double>(
                  0,
                  (sum, item) => sum + item.price * item.quantity,
                );

                return Card(
                  elevation: 3,
                  margin:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  child: ListTile(
                    title: Text('Pedido #$orderIdPrefix'),
                    trailing: Text('Total de items: $totalItems'),
                    subtitle: Row(
                      children: [
                        Card(
                          color: Theme.of(context).colorScheme.primary,
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text('\$${totalSales.toStringAsFixed(2)}',
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimary)),
                          ),
                        ),
                        Card(
                          color: Theme.of(context).colorScheme.error,
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text('\$${totalCosts.toStringAsFixed(2)}',
                                style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.onError)),
                          ),
                        ),
                        Card(
                          color: Theme.of(context).colorScheme.tertiary,
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text('\$${totalProfit.toStringAsFixed(2)}',
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onTertiary)),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              })
            ],
          );
        },
      ),
    );
  }
}
