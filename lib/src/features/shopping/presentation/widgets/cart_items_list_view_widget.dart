import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_marba/src/features/shopping/application/cart_item_list_controller/cart_item_list_controller.dart';
import 'package:project_marba/src/features/shopping/presentation/widgets/cart_item_widget.dart';

class CartItemsListViewWidget extends ConsumerWidget {
  const CartItemsListViewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(cartItemListProvider);
    return items.isEmpty
        ? const Center(
            child: Padding(
              padding: EdgeInsets.all(30.0),
              child: Text('Seu carrinho está vazio.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16.0)),
            ),
          )
        : ListView.builder(
            shrinkWrap: true,
            itemCount: items.length,
            itemBuilder: (context, index) {
              return CartItemWidget(item: items.elementAt(index));
            },
            physics: const NeverScrollableScrollPhysics(),
          );
  }
}
