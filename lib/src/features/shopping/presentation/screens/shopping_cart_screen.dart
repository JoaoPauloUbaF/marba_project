import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:project_marba/src/shared/widgets/large_horizontal_space_widget.dart';
import 'package:project_marba/src/shared/widgets/medium_vertical_space_widget.dart';

class ShoppingCartScreen extends ConsumerWidget {
  const ShoppingCartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: IconButton(
                icon: const Icon(Icons.search_sharp),
                onPressed: () {
                  showModalBottomSheet(
                      scrollControlDisabledMaxHeightRatio: .8,
                      context: context,
                      builder: (context) {
                        return const Center(
                            child: Text('This is the search modal'));
                      });
                },
              ),
            )
          ],
        ),
        floatingActionButton: SizedBox(
          width: MediaQuery.of(context).size.width * .8,
          height: 60,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.primaryContainer,
            ),
            onPressed: () {},
            child: Text(
              'Finalizar Compra (R\$ 100,00)',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 100.0, top: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Meu Carrinho',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const CartItemWidget(),
                  const CartItemWidget(),
                  const CartItemWidget(),
                  const CartItemWidget(),
                  const CartItemWidget(),
                  const CartItemWidget(),
                  const VerticalSpaceMediumWidget(),
                  Text(
                    'Endereço de Entrega',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const VerticalSpaceMediumWidget(),
                  const OrderAddressTileWidget(),
                  const VerticalSpaceMediumWidget(),
                  Text(
                    'Forma de Pagamento',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const VerticalSpaceMediumWidget(),
                  const OrderPaymentMethodWidget(),
                  const VerticalSpaceMediumWidget(),
                  Text(
                    'Informações do Pedido',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const OderSummaryWidget(),
                ],
              ),
            ),
          ),
        ));
  }
}

class OderSummaryWidget extends StatelessWidget {
  const OderSummaryWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondaryContainer,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.receipt_long_sharp, size: 20),
            ),
          ),
          title: Text(
            'Cupom de Desconto',
            style: Theme.of(context).textTheme.titleSmall,
          ),
          subtitle: Text(
            'R\$ 10,00',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          trailing: IconButton(
            icon: Icon(
              Icons.arrow_forward_ios_sharp,
              color: Theme.of(context).colorScheme.primary,
            ),
            onPressed: () {},
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Subtotal',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(
              'R\$ 100,00',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
        const VerticalSpaceMediumWidget(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Entrega',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(
              'R\$ 10,00',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
        const VerticalSpaceMediumWidget(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Desconto',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(
              '- R\$ 10,00',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
        const Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Total',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text('R\$ 100,00',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    )),
          ],
        ),
      ],
    );
  }
}

class OrderPaymentMethodWidget extends StatelessWidget {
  const OrderPaymentMethodWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondaryContainer,
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(Icons.credit_card_sharp, size: 30),
        ),
      ),
      title: Text(
        'Cartão de Crédito',
        style: Theme.of(context).textTheme.titleMedium,
      ),
      subtitle: Text(
        '**** **** **** 1234',
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      trailing: IconButton(
        icon: Icon(
          Icons.arrow_forward_ios_sharp,
          color: Theme.of(context).colorScheme.primary,
        ),
        onPressed: () {},
      ),
    );
  }
}

class OrderAddressTileWidget extends StatelessWidget {
  const OrderAddressTileWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondaryContainer,
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(Icons.location_on_sharp, size: 30),
        ),
      ),
      title: Text(
        'Rua dos Bobos, 0 - São Paulo - SP',
        style: Theme.of(context).textTheme.titleMedium,
      ),
      trailing: IconButton(
        icon: Icon(
          Icons.arrow_forward_ios_sharp,
          color: Theme.of(context).colorScheme.primary,
        ),
        onPressed: () {},
      ),
    );
  }
}

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: SizedBox(
        height: 125,
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                'https://d1ncau8tqf99kp.cloudfront.net/converted/74739_original_local_504x441_v3_converted.webp',
                width: 125,
                fit: BoxFit.fitWidth,
              ),
            ),
            const LargeHorizontalSpaceWidget(),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Sony Wireless Headphone',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text('R\$ 10,00',
                      style: Theme.of(context).textTheme.bodyMedium),
                  Row(children: [
                    SizedBox(
                      width: 30.0,
                      height: 30.0,
                      child: IconButton.outlined(
                        color: Theme.of(context).colorScheme.primary,
                        icon: const Icon(Icons.remove, size: 18.0),
                        onPressed: () {},
                        padding: const EdgeInsets.all(0),
                        constraints: const BoxConstraints(),
                      ),
                    ),
                    const SizedBox(width: 16),
                    const Text('1'),
                    const SizedBox(width: 16),
                    SizedBox(
                      width: 30,
                      height: 30,
                      child: IconButton.outlined(
                        color: Theme.of(context).colorScheme.primary,
                        icon: const Icon(Icons.add, size: 18.0),
                        onPressed: () {},
                        padding: const EdgeInsets.all(0),
                        constraints: const BoxConstraints(),
                      ),
                    ),
                  ]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
