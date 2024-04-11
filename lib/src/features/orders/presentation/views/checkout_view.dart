import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_marba/src/core/widgets/medium_vertical_space_widget.dart';
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
            Center(
              child: Text(
                'Aguardando confirmação do pedido',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Card(
                child: Padding(
                  padding: EdgeInsets.all(80.0),
                  child: Center(
                    child: LinearProgressIndicator(),
                  ),
                ),
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
                      Visibility(
                        visible: order?.address != null,
                        child: AddressDisplayWidget(
                          address: order!.address,
                          isEditable: false,
                          isBusinessAddress: false,
                        ),
                      ),
                      const VerticalSpaceMediumWidget(),
                      const Text('Produtos'),
                      FutureBuilder(
                          future: orderViewModel.getOrderItems(),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }

                            return ListView.builder(
                              padding: const EdgeInsets.all(2.0),
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: snapshot.data?.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  leading: Image.network(
                                    '${snapshot.data?[index].imageUrl}',
                                    width: 50,
                                    height: 80,
                                    fit: BoxFit.fill,
                                  ),
                                  title: Text('${snapshot.data?[index].name}'),
                                  subtitle: Text(
                                      'R\$ ${snapshot.data?[index].price.toStringAsFixed(2)}'),
                                  trailing: Text(
                                      'Qtd: ${snapshot.data?[index].quantity}'),
                                );
                              },
                            );
                          }),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
