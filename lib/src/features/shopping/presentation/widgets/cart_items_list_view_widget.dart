import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_marba/src/features/shopping/application/cart_item_list_view_model/cart_item_list_view_model.dart';
import 'package:project_marba/src/features/shopping/presentation/widgets/cart_item_widget.dart';

class CartItemsListViewWidget extends ConsumerWidget {
  const CartItemsListViewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartItems = ref.watch(cartItemListViewModelProvider);
    return cartItems.isEmpty
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
            itemCount: cartItems.length,
            itemBuilder: (context, index) {
              return CartItemWidget(item: cartItems.elementAt(index));
            },
            physics: const NeverScrollableScrollPhysics(),
          );
  }
}
