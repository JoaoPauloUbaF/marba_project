import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_marba/src/core/models/order/business_order_model.dart';
import 'package:project_marba/src/core/models/order/order_model.dart';
import 'package:project_marba/src/core/widgets/medium_vertical_space_widget.dart';
import 'package:project_marba/src/features/business/application/business_orders_view_model/business_orders_view_model.dart';
import 'package:project_marba/src/features/location_management/presentation/widgets/address_display_widget.dart';
import 'package:project_marba/src/features/orders/application/business_order_provider/business_order_provider.dart';
import 'package:project_marba/src/features/orders/application/order_view_model/order_view_model.dart';
import 'package:project_marba/src/features/orders/presentation/widgets/order_items_list_widget.dart';

class UserOrderDetailsView extends ConsumerWidget {
  const UserOrderDetailsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final OrderModel order =
        ModalRoute.of(context)!.settings.arguments as OrderModel;
    final orderViewModel = ref.read(orderViewModelProvider.notifier);
    ref.watch(orderViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Order ${order.id.split('-').first}',
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
                'Details ',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const Divider(),
              Text(
                'Delivery Address',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 5),
              AddressDisplayWidget(
                  address: order.address,
                  isEditable: false,
                  isBusinessAddress: false),
              const SizedBox(height: 8),
              Text(
                'Order Items',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics:
                      const NeverScrollableScrollPhysics(), // Scroll sempre desativado aqui
                  padding: EdgeInsets.zero,
                  itemCount: order.businessOrdersIds.length ?? 0,
                  itemBuilder: (BuildContext context, int index) {
                    final userOrderStream = ref.watch(getBusinessOrderProvider(
                        businessOrderId: order.businessOrdersIds[index] ?? ''));
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
                                            BusinessOrderStatus.accepted ||
                                        order?.status ==
                                            BusinessOrderStatus.done
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
                                    .getStatusTranslation(order?.status.name ??
                                        'waitingConfirmation'),
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
                          'Order #${order.id.split('-').first}',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const VerticalSpaceMediumWidget(),
                        Text(
                          'Total: R\$ ${order.total.toStringAsFixed(2)}',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const Divider(),
                        const VerticalSpaceMediumWidget(),
                        OrderItemsListWidget(orderViewModel: orderViewModel),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
