import 'package:flutter/material.dart';
import 'package:project_marba/src/shared/models/cart_item/cart_item_model.dart';
import 'package:project_marba/src/shared/utils/mock_utils.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cart_item_list_controller.g.dart';

@riverpod
class CartItemList extends _$CartItemList {
  @override
  List<CartItemModel> build() {
    return [
      MockUtils().mockedCartItem,
      MockUtils().mockedCartItem.copyWith(name: 'Item 2', price: 2.0),
      MockUtils().mockedCartItem.copyWith(name: 'Item 3', price: 3.0),
    ];
  }

  void refreshState() {
    state = List.from(state);
  }

  void createNewItem(String id, String name, double price, String imageUrl) {
    final item = CartItemModel(
      id: id,
      name: name,
      price: price,
      imageUrl: imageUrl,
      quantity: 1,
    );
    addItem(item);
  }

  void addItem(CartItemModel item) {
    state.add(item);
    refreshState();
  }

  void removeItem(CartItemModel item) {
    state.remove(item);
    refreshState();
  }

  void clear() {
    state = [];
  }

  double get total {
    return state.fold(
        0, (previousValue, element) => previousValue + element.price);
  }

  void increaseItemQuantity(CartItemModel item) {
    final updatedItem = item.copyWith(quantity: item.quantity + 1);
    state[state.indexOf(item)] = updatedItem;
    refreshState();
  }

  void decreaseItemQuantity(CartItemModel item, BuildContext context) {
    if (item.quantity > 1) {
      final updatedItem = item.copyWith(quantity: item.quantity - 1);
      state[state.indexOf(item)] = updatedItem;
      state = List.from(state);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Theme.of(context).colorScheme.error,
          content:
              const Text('O item será removido do carrinho. Deseja continuar?'),
          action: SnackBarAction(
            label: 'Sim',
            onPressed: () {
              removeItem(item);
            },
          ),
        ),
      );
    }
  }
}
