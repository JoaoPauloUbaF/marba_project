import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_marba/src/features/shopping/application/cart_item_list_view_model/cart_item_list_view_model.dart';

class CheckOutButtonWidget extends ConsumerWidget {
  const CheckOutButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(cartItemListViewModelProvider);
    final cartViewModel = ref.watch(cartItemListViewModelProvider.notifier);
    final total = cartViewModel.getTotalWithDeliveryAndDiscount();

    return SizedBox(
      width: MediaQuery.of(context).size.width * .8,
      height: 60,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.primary,
        ),
        onPressed: () {
          cartViewModel.checkOut(context);
        },
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
