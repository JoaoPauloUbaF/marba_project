import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_marba/src/core/models/order/order_model.dart';
import 'package:project_marba/src/core/models/order/business_order_item.dart';
import 'package:project_marba/src/features/orders/data/orders_repository/orders_repository_provider.dart';

class UserOrderDetailsView extends ConsumerWidget {
  const UserOrderDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final OrderModel order =
        ModalRoute.of(context)!.settings.arguments as OrderModel;

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
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Text(
                'Status: ${_getOrderStatus(order)}',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 10),
              Text(
                'Endereço de Entrega:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                '${order.address.street}, ${order.address.city}, ${order.address.state}, ${order.address.zipCode}',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                'Itens do Pedido:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              FutureBuilder<List<BusinessOrderItem>>(
                future: ref
                    .read(ordersRepositoryProvider)
                    .getOrderItems(orderId: order.id),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  }
                  if (snapshot.hasError) {
                    return Text('Erro ao carregar os itens do pedido');
                  }
                  if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Text('Nenhum item encontrado');
                  }
                  return Column(
                    children: snapshot.data!
                        .map((item) => _buildOrderItemWidget(item))
                        .toList(),
                  );
                },
              ),
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
