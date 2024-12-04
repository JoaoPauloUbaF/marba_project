import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_marba/src/core/widgets/medium_vertical_space_widget.dart';
import 'package:project_marba/src/features/business/application/business_orders_view_model/business_orders_view_model.dart';
import 'package:project_marba/src/features/location_management/presentation/widgets/address_display_widget.dart';
import 'package:project_marba/src/features/orders/application/order_view_model/order_view_model.dart';

import '../../../../core/models/order/business_order_model.dart';
import '../../application/business_order_provider/business_order_provider.dart';
import '../widgets/order_items_list_widget.dart';

class CheckoutView extends ConsumerStatefulWidget {
  const CheckoutView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends ConsumerState<CheckoutView> {
  @override
  Widget build(BuildContext context) {
    final order = ref.watch(orderViewModelProvider);
    final orderViewModel = ref.read(orderViewModelProvider.notifier);

    final orderAddress = order?.address;

    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Center(
                child: Text(
                  'Aguardando confirmação',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: order?.businessOrdersIds.length ?? 0,
                  itemBuilder: (BuildContext context, int index) {
                    final userOrderStream = ref.watch(getBusinessOrderProvider(
                        businessOrderId:
                            order?.businessOrdersIds[index] ?? ''));
                    return userOrderStream.when(
                      data: (order) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 2.0),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color:
                                      Theme.of(context).secondaryHeaderColor),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: ListTile(
                              trailing: AnimatedSwitcher(
                                duration: const Duration(milliseconds: 300),
                                transitionBuilder: (Widget child,
                                    Animation<double> animation) {
                                  return ScaleTransition(
                                      scale: animation, child: child);
                                },
                                child: order?.status ==
                                        BusinessOrderStatus.accepted
                                    ? const Icon(Icons.done, key: Key('done'))
                                    : const CircularProgressIndicator(
                                        key: Key('loading')),
                              ),
                              title: FutureBuilder(
                                future:
                                    orderViewModel.getBusinessOrderBusinessName(
                                        order?.businessId ?? ''),
                                builder: (context, snapshot) {
                                  if (!snapshot.hasData) {
                                    return const LinearProgressIndicator();
                                  }
                                  return Text(snapshot.data.toString());
                                },
                              ),
                              subtitle: Text(
                                ref
                                    .read(businessOrdersViewModelProvider
                                        .notifier)
                                    .getStatusTranslation(order?.status
                                                .toString()
                                                .split('.')
                                                .last ==
                                            'accepted'
                                        ? 'accepted'
                                        : 'waitingConfirmation'),
                              ),
                            ),
                          ),
                        );
                      },
                      loading: () => const CircularProgressIndicator(),
                      error: (error, stackTrace) => Text('Error  $error'),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Pedido #${order?.id.split('-').first ?? ''}',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const VerticalSpaceMediumWidget(),
                        Text(
                            'Total: R\$ ${order?.total.toStringAsFixed(2) ?? ''}'),
                        const VerticalSpaceMediumWidget(),
                        if (orderAddress != null)
                          AddressDisplayWidget(
                            address: orderAddress,
                            isEditable: false,
                            isBusinessAddress: false,
                          ),
                        const VerticalSpaceMediumWidget(),
                        const Text('Produtos'),
                        OrderItemsListWidget(orderViewModel: orderViewModel),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
