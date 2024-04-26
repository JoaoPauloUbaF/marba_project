import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_marba/src/core/models/order/order_model.dart';
import 'package:project_marba/src/core/models/order/business_order_item.dart';
import 'package:project_marba/src/features/orders/application/order_view_model/order_view_model.dart';
import 'package:project_marba/src/features/orders/data/orders_repository/orders_repository_provider.dart';
import 'package:project_marba/src/features/orders/presentation/widgets/order_items_list_widget.dart';

class UserOrderDetailsView extends ConsumerWidget {
  const UserOrderDetailsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final OrderModel order =
        ModalRoute.of(context)!.settings.arguments as OrderModel;
    final orderViewModel = ref.read(orderViewModelProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: Text('Pedido ${order.id.split('-').first}'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Detalhes do Pedido',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 20),
              Text(
                'Status: ${_getOrderStatus(order)}',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 10),
              const Text(
                'Endereço de Entrega:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              Text(
                '${order.address.street}, ${order.address.city}, ${order.address.state}, ${order.address.zipCode}',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 20),
              Text(
                'Itens do Pedido:',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 10),
              OrderItemsListWidget(orderViewModel: orderViewModel),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOrderItemWidget(BusinessOrderItem item) {
    return ListTile(
      title: Text(item.name),
      subtitle: Text(
          'Quantidade: ${item.quantity}, Preço: R\$ ${item.price.toStringAsFixed(2)}'),
    );
  }

  String _getOrderStatus(OrderModel order) {
    if (order.canceledAt != null) {
      return 'Cancelado';
    } else if (DateTime.now().isAfter(order.updatedAt)) {
      return 'Concluído';
    } else {
      return 'Em andamento';
    }
  }
}
