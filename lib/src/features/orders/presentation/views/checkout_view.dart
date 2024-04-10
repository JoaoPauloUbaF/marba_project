import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_marba/src/core/widgets/medium_vertical_space_widget.dart';
import 'package:project_marba/src/features/business/presentation/widgets/loading_widget.dart';
import 'package:project_marba/src/features/location_management/presentation/widgets/address_display_widget.dart';

import '../../../../core/models/address/address.dart';

class CheckoutView extends ConsumerStatefulWidget {
  const CheckoutView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends ConsumerState<CheckoutView> {
  @override
  Widget build(BuildContext context) {
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
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text('Pedido #123456',
                        style: TextStyle(fontSize: 20)),
                    const Text('Total: R\$ 100,00'),
                    AddressDisplayWidget(
                      address: Address(
                        // Address
                        street: 'Rua 1',
                        number: '123',
                        neighborhood: 'Bairro 1',
                        city: 'Cidade 1',
                        state: 'Estado 1',
                        zipCode: '12345-678',
                      ),
                    ),
                    const Text('Produtos'),
                    ListView.builder(
                      padding: const EdgeInsets.all(8.0),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading:
                              Image.network('https://via.placeholder.com/150'),
                          title: Text('Item $index'),
                          subtitle: const Text('R\$ 10,00'),
                          trailing: const Text('Qtd: 1'),
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
