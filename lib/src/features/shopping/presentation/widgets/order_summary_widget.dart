import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_marba/src/features/shopping/application/cart_item_list_view_model/cart_item_list_view_model.dart';
import 'package:project_marba/src/features/shopping/application/delivery_provider/delivery_provider.dart';
import 'package:project_marba/src/features/shopping/application/discount_coupon_provider/discount_coupon_provider.dart';
import 'package:project_marba/src/features/shopping/presentation/widgets/discount_coupon_modal.dart';
import 'package:project_marba/src/core/widgets/medium_vertical_space_widget.dart';

class OrderSummaryWidget extends ConsumerWidget {
  const OrderSummaryWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartItems = ref.watch(cartItemListViewModelProvider);
    final cartViewModel = ref.watch(cartItemListViewModelProvider.notifier);

    final total = cartViewModel.getTotal();
    final discount =
        ref.watch(shoppingCartDiscountProvider(cartViewModel.total));
    final deliveryFee = ref.watch(deliveryTaxProvider(cartOffers: cartItems));
    final totalWithDelivery = cartViewModel.getTotalWithDeliveryAndDiscount();

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
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return const DiscountCouponModal();
                  });
            },
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
            deliveryFee.when(
              data: (value) => Text(
                '+ $value',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              loading: () => const CircularProgressIndicator(),
              error: (error, _) => Text(
                'Erro: $error',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
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
