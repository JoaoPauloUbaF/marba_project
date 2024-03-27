import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:project_marba/src/features/shopping/application/cart_item_list_controller/cart_item_list_controller.dart';
import 'package:project_marba/src/features/shopping/presentation/widgets/cart_item_widget.dart';
import 'package:project_marba/src/shared/widgets/medium_vertical_space_widget.dart';

import '../../application/delivery_provider/delivery_provider.dart';
import '../../application/discount_coupon_provider/discount_coupon_provider.dart';

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
        floatingActionButton: const CheckOutButtonWidget(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 100.0, top: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Meu Carrinho',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const Spacer(),
                      SegmentedButton(
                          showSelectedIcon: false,
                          segments: const <ButtonSegment<String>>[
                            ButtonSegment<String>(
                              icon: Icon(Icons.view_list_sharp),
                              value: 'list',
                            ),
                            ButtonSegment<String>(
                              icon: Icon(Icons.grid_view_sharp),
                              value: 'grid',
                            ),
                          ],
                          selected: const {'grid'},
                          onSelectionChanged: (value) {
                            print(value);
                          }),
                    ],
                  ),
                  const CartItemsListViewWidget(),
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

class CheckOutButtonWidget extends ConsumerWidget {
  const CheckOutButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final total = ref.watch(cartItemListProvider.notifier).getTotal();

    return SizedBox(
      width: MediaQuery.of(context).size.width * .8,
      height: 60,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.primary,
        ),
        onPressed: () {},
        child: Text(
          'Finalizar Compra ($total)',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
        ),
      ),
    );
  }
}

class CartItemsListViewWidget extends ConsumerWidget {
  const CartItemsListViewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(cartItemListProvider);
    return ListView.builder(
      shrinkWrap: true,
      itemCount: items.length,
      itemBuilder: (context, index) {
        return CartItemWidget(item: items.elementAt(index));
      },
      physics: const NeverScrollableScrollPhysics(),
    );
  }
}

class OderSummaryWidget extends ConsumerWidget {
  const OderSummaryWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(cartItemListProvider.notifier);
    final total = controller.getTotal();
    final discount = ref.watch(shoppingCartDiscountProvider(controller.total));
    final deliveryTax = ref.watch(deliveryTaxProvider);
    final totalWithDelivery = controller.getTotalWithDeliveryAndDiscount(
        total, deliveryTax, discount);

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
            discount,
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
              total,
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
              '+ $deliveryTax',
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
              '- $discount',
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
            Text(totalWithDelivery,
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
