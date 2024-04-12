import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project_marba/src/core/models/order/business_order_model.dart';
import 'package:project_marba/src/core/widgets/medium_vertical_space_widget.dart';
import 'package:project_marba/src/core/widgets/modal_center_top_line_widget.dart';
import 'package:project_marba/src/features/business/presentation/widgets/loading_widget.dart';

import '../../../../../orders/data/business_orders_repository/business_orders_repository_provider.dart';
import '../../../../application/business_orders_view_model/business_orders_view_model.dart';

class BusinessOrderDetailModalBody extends ConsumerWidget {
  final String orderId;

  const BusinessOrderDetailModalBody({super.key, required this.orderId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final businessOrdersViewModel =
        ref.watch(businessOrdersViewModelProvider.notifier);
    final businessOrdersRepository = ref.read(businessOrdersRepositoryProvider);
    final selectedOrder = ref.watch(selectedOrderProvider(orderId));

    return selectedOrder.when(data: (order) {
      if (order == null) {
        return const Center(
          child: Text('Pedido não encontrado'),
        );
      }
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(child: ModalCenterTopLineWidget()),
            const VerticalSpaceMediumWidget(),
            Text(
              'Pedido #${order.id.split('-').first}',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Chip(
                  backgroundColor: businessOrdersViewModel.getCardColor(
                      status: order.status),
                  label: Text(
                    businessOrdersViewModel.getStatusTranslation(
                        order.status.toString().split('.').last),
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: businessOrdersViewModel.getStatusTextColor(
                              status: order.status),
                        ),
                  ),
                ),
                const Spacer(),
                DropdownButton<String>(
                  value: order.status.toString().split('.').last,
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      businessOrdersRepository.updateOrderStatus(
                        orderId: order.id,
                        newStatus: newValue,
                      );
                    }
                  },
                  items: BusinessOrderStatus.values.map((status) {
                    return DropdownMenuItem<String>(
                      value: status.toString().split('.').last,
                      child: Text(
                        businessOrdersViewModel.getStatusTranslation(
                            status.toString().split('.').last),
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    );
                  }).toList(),
                )
              ],
            ),
            const SizedBox(height: 16),
            Text(
              'Data: ${DateFormat('dd/MM/yyyy', 'pt_BR').format(order.createdAt)}',
            ),
            const SizedBox(height: 16),
            Text(
              'Itens:',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: order.items.length,
                itemBuilder: (context, index) {
                  final item = order.items.elementAt(index);
                  return ListTile(
                    visualDensity: VisualDensity.compact,
                    contentPadding: EdgeInsets.zero,
                    title: Text(item.name),
                    leading: Image.network(
                      item.imageUrl,
                      width: 50,
                      height: 50,
                      fit: BoxFit.fill,
                    ),
                    subtitle: Text(
                        'R\$${item.price.toStringAsFixed(2)} x ${item.quantity}'),
                    trailing: Text(
                      'R\$${(item.price * item.quantity).toStringAsFixed(2)}',
                    ),
                  );
                },
                separatorBuilder: (context, index) => const Divider(),
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total: R\$${order.items.fold(0.0, (total, item) => total + item.price * item.quantity).toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      businessOrdersRepository.updateOrderStatus(
                        orderId: order.id,
                        newStatus:
                            BusinessOrderStatus.done.toString().split('.').last,
                      );
                      Navigator.of(context).pop();
                    },
                    child: const Text('Finalizar'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      businessOrdersRepository.updateOrderStatus(
                        orderId: order.id,
                        newStatus: BusinessOrderStatus.canceled
                            .toString()
                            .split('.')
                            .last,
                      );
                      Navigator.of(context).pop();
                    },
                    child: const Text('Cancelar'),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }, error: (error, stack) {
      return Center(
        child: Text('Erro ao carregar pedido: $error'),
      );
    }, loading: () {
      return const Center(
        child: LoadingWidget(),
      );
    });
  }
}
