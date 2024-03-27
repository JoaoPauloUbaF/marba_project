import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_marba/src/features/shopping/application/cart_item_list_controller/cart_item_list_controller.dart';

class CheckOutButtonWidget extends ConsumerWidget {
  const CheckOutButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(cartItemListProvider);
    final total = ref
        .read(cartItemListProvider.notifier)
        .getTotalWithDeliveryAndDiscount();

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
