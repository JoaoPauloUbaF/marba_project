import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project_marba/src/core/models/order/business_order_model.dart';
import 'package:project_marba/src/core/utils/registration_utils.dart';
import 'package:project_marba/src/core/widgets/medium_vertical_space_widget.dart';
import 'package:project_marba/src/core/widgets/modal_center_top_line_widget.dart';
import 'package:project_marba/src/features/business/presentation/widgets/loading_widget.dart';
import 'package:project_marba/src/features/orders/data/business_orders_repository/business_orders_repository.dart';

import '../../../../../orders/data/business_orders_repository/business_orders_repository_provider.dart';
import '../../../../application/business_order_view_model/business_order_view_model.dart';
import '../../../../application/business_orders_view_model/business_orders_view_model.dart';

class BusinessOrderDetailModalBody extends ConsumerStatefulWidget {
  final String orderId;

  const BusinessOrderDetailModalBody({super.key, required this.orderId});

  @override
  ConsumerState<BusinessOrderDetailModalBody> createState() =>
      _BusinessOrderDetailModalBodyState();
}

class _BusinessOrderDetailModalBodyState
    extends ConsumerState<BusinessOrderDetailModalBody> {
  @override
  Widget build(BuildContext context) {
    final businessOrdersViewModel =
        ref.watch(businessOrdersViewModelProvider.notifier);
    final businessOrderViewModel =
        ref.read(businessOrderViewModelProvider.notifier);
    final businessOrdersRepository = ref.read(businessOrdersRepositoryProvider);
    final selectedOrder = ref.watch(selectedOrderProvider(widget.orderId));

    return selectedOrder.when(data: (order) {
      if (order == null) {
        return const Center(
          child: Text('Pedido não encontrado'),
        );
      }

      return SuccessBodyWidget(
        order: order,
        businessOrdersViewModel: businessOrdersViewModel,
        businessOrderViewModel: businessOrderViewModel,
        businessOrdersRepository: businessOrdersRepository,
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

class SuccessBodyWidget extends StatefulWidget {
  const SuccessBodyWidget({
    super.key,
    required this.order,
    required this.businessOrdersViewModel,
    required this.businessOrdersRepository,
    required this.businessOrderViewModel,
  });

  final BusinessOrderViewModel businessOrderViewModel;
  final BusinessOrder order;
  final BusinessOrdersViewModel businessOrdersViewModel;
  final BusinessOrdersRepository businessOrdersRepository;

  @override
  State<SuccessBodyWidget> createState() => _SuccessBodyWidgetState();
}

class _SuccessBodyWidgetState extends State<SuccessBodyWidget> {
  String _orderStatus = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(child: ModalCenterTopLineWidget()),
          const VerticalSpaceMediumWidget(),
          const VerticalSpaceMediumWidget(),
          Text(
            'Pedido #${widget.order.id.split('-').first}',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Chip(
                backgroundColor: widget.businessOrdersViewModel
                    .getCardColor(status: widget.order.status),
                label: Text(
                  widget.businessOrdersViewModel.getStatusTranslation(
                      widget.order.status.toString().split('.').last),
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: widget.businessOrdersViewModel
                            .getStatusTextColor(status: widget.order.status),
                      ),
                ),
              ),
              const Spacer(),
              Visibility(
                visible: widget.order.status ==
                    BusinessOrderStatus.waitingConfirmation,
                child: ElevatedButton(
                  onPressed: () {
                    widget.businessOrderViewModel.updateOrderStatus(
                      orderId: widget.order.id,
                      newStatus: BusinessOrderStatus.accepted
                          .toString()
                          .split('.')
                          .last,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.onPrimary,
                  ),
                  child: const Text('Aceitar Pedido'),
                ),
              ),
              Visibility(
                visible: widget.order.status !=
                    BusinessOrderStatus.waitingConfirmation,
                child: DropdownButton<String>(
                  value: _orderStatus.isNotEmpty
                      ? _orderStatus.toString().split('.').last
                      : widget.order.status.toString().split('.').last,
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      setState(() {
                        _orderStatus = newValue;
                      });
                    }
                  },
                  items: BusinessOrderStatus.values.map((status) {
                    return DropdownMenuItem<String>(
                      value: status.toString().split('.').last,
                      child: Text(
                        widget.businessOrdersViewModel.getStatusTranslation(
                            status.toString().split('.').last),
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    );
                  }).toList(),
                ),
              )
            ],
          ),
          const SizedBox(height: 16),
          Text(
            'Data: ${DateFormat('dd/MM/yyyy', 'pt_BR').format(widget.order.createdAt)}',
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
              itemCount: widget.order.items.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final item = widget.order.items.elementAt(index);
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
          const VerticalSpaceMediumWidget(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total: ${RegistrationUtils().doubleAsCurrency(widget.order.items.fold(0.0, (total, item) => total + item.price * item.quantity))}',
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
                    widget.businessOrderViewModel.updateOrderStatus(
                      orderId: widget.order.id,
                      newStatus: _orderStatus.toString().split('.').last,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Theme.of(context).colorScheme.secondaryContainer,
                  ),
                  child: const Text('Salvar'),
                ),
                ElevatedButton(
                  onPressed: () {
                    widget.businessOrderViewModel.updateOrderStatus(
                      orderId: widget.order.id,
                      newStatus: BusinessOrderStatus.canceled
                          .toString()
                          .split('.')
                          .last,
                    );
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Theme.of(context).colorScheme.secondaryContainer,
                  ),
                  child: const Text('Cancelar'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
