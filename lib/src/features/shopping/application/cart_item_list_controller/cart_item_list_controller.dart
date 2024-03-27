import 'package:flutter/material.dart';
import 'package:project_marba/src/shared/models/cart_item/cart_item_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cart_item_list_controller.g.dart';

@Riverpod(keepAlive: true)
class CartItemList extends _$CartItemList {
  @override
  List<CartItemModel> build() {
    return [];
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
      removeItem(item);
    }
  }
}
