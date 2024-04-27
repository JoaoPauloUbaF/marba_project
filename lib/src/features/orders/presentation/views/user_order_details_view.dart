import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_marba/src/core/models/order/order_model.dart';
import 'package:project_marba/src/features/location_management/presentation/widgets/address_display_widget.dart';
import 'package:project_marba/src/features/orders/application/order_view_model/order_view_model.dart';
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
        title: Text(
          'Pedido ${order.id.split('-').first}',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Detalhes ',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const Divider(),
              Text(
                'Endereço de Entrega',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 5),
              AddressDisplayWidget(
                  address: order.address,
                  isEditable: false,
                  isBusinessAddress: false),
              const SizedBox(height: 8),
              Text(
                'Itens do Pedido',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              OrderItemsListWidget(orderViewModel: orderViewModel),
            ],
          ),
        ),
      ),
    );
  }
}
