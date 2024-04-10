import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_marba/src/features/location_management/presentation/widgets/address_display_widget.dart';
import 'package:project_marba/src/features/orders/application/order_view_model/order_view_model.dart';

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
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: <Widget>[
            const Center(child: Text('Aguardando confirmação do negócio')),
            const Card(
              child: Padding(
                padding: EdgeInsets.all(30.0),
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Pedido #${order?.id.split('-').first ?? ''}',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Text('Total: R\$ ${order?.total.toStringAsFixed(2) ?? ''}'),
                    AddressDisplayWidget(
                      address: order!.address,
                    ),
                    const Text('Produtos'),
                    ListView.builder(
                      padding: const EdgeInsets.all(8.0),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: orderViewModel.getOrderItems()?.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: Image.network(
                            '${orderViewModel.getOrderItems()?[index].imageUrl}',
                            width: 50,
                            height: 80,
                            fit: BoxFit.fill,
                          ),
                          title: Text(
                              '${orderViewModel.getOrderItems()?[index].name}'),
                          subtitle: Text(
                              'R\$ ${orderViewModel.getOrderItems()?[index].price.toStringAsFixed(2)}'),
                          trailing: Text(
                              'Qtd: ${orderViewModel.getOrderItems()?[index].quantity}'),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
