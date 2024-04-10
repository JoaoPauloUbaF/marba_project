import 'package:flutter/material.dart';
import 'package:project_marba/src/core/models/cart_item/cart_item_model.dart';
import 'package:project_marba/src/core/utils/registration_utils.dart';
import 'package:project_marba/src/features/authentication/data/firebase_auth_provider.dart';
import 'package:project_marba/src/features/shopping/application/delivery_address_provider/delivery_address_provider.dart';
import 'package:project_marba/src/features/shopping/data/shopping_cart_repository.dart';
import 'package:project_marba/src/features/shopping/data/shopping_cart_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/models/address/address.dart';
import '../../../../core/models/offer/offer_model.dart';
import '../../../orders/application/order_view_model/order_view_model.dart';
import '../delivery_provider/delivery_provider.dart';
import '../discount_coupon_provider/discount_coupon_provider.dart';

part 'cart_item_list_view_model.g.dart';

@Riverpod(keepAlive: true)
class CartItemListViewModel extends _$CartItemListViewModel {
  late ShoppingCartRepository shoppingCartRepository;

  @override
  List<CartItemModel> build() {
    ref.watch(authStateChangeProvider);
    shoppingCartRepository = ref.read(shoppingCartRepositoryProvider);
    fetchUserShoppingCart();
    return [];
  }

  void fetchUserShoppingCart() async {
    final user = ref.read(authRepositoryProvider).getCurrentUser();
    if (user != null) {
      shoppingCartRepository
          .getCartItems(userId: user.uid)
          .then((value) => state = value);
    }
  }

  void refreshState() {
    state = List.from(state);
    String? userId = ref.read(authRepositoryProvider).getCurrentUser()?.uid;
    if (userId != null) {
      shoppingCartRepository.updateCart(userId: userId, items: state);
    }
  }

  void createNewItem(String id, String name, double price, String imageUrl,
      String businessId, OfferType offerType) {
    if (state.any((element) => element.id == id)) {
      final item = state.firstWhere((element) => element.id == id);
      increaseItemQuantity(item);
      return;
    }

    final item = CartItemModel(
      id: id,
      name: name,
      price: price,
      imageUrl: imageUrl,
      quantity: 1,
      businessId: businessId,
      offerType: offerType,
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

  void clearShoppingCart() {
    shoppingCartRepository.clearCart(
        userId: ref.read(authRepositoryProvider).getCurrentUser()!.uid);
    state = [];
  }

  double get total {
    return state.fold(
        0,
        (previousValue, element) =>
            previousValue + (element.quantity * element.price));
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

  IconData getDecreaseIcon(int quantity) {
    return quantity > 1 ? Icons.remove : Icons.delete;
  }

  IconData getIncreaseIcon(CartItemModel item) {
    // TODO: implement the ceiling for the quantity
    return Icons.add;
  }

  String getTotal() {
    final totalString = RegistrationUtils().formatAsCurrency(total);
    return totalString;
  }

  String getTotalWithDeliveryAndDiscount() {
    final discount = ref.read(shoppingCartDiscountProvider(total));
    String deliveryTax = 'R\$ 0.0';
    ref
        .read(deliveryTaxProvider(cartOffers: state))
        .whenData((value) => deliveryTax = value);
    final ru = RegistrationUtils();
    final finalTotalValue = ru.currencyStringToDouble(getTotal()) +
        ru.currencyStringToDouble(deliveryTax) -
        ru.currencyStringToDouble(discount);
    return ru.formatAsCurrency(finalTotalValue);
  }

  void checkOut(BuildContext context) {
    if (state.isEmpty) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Center(
                  child: Text('Carrinho vazio',
                      style: Theme.of(context).textTheme.titleLarge),
                ),
                content: const Text(
                  'Adicione itens ao carrinho para prosseguir com a compra',
                  textAlign: TextAlign.center,
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('OK'),
                  ),
                ],
              ));
      return;
    }

    double totalDelivery = 0.0;
    ref.read(deliveryTaxProvider(cartOffers: state)).whenData((value) {
      totalDelivery = RegistrationUtils().currencyStringToDouble(value);
      String? customerId =
          ref.read(authRepositoryProvider).getCurrentUser()?.uid;

      if (customerId == null) {
        Navigator.of(context).pushNamed('/sign-in');
        return;
      }

      Address? address;
      ref.read(deliveryAddressProvider).whenData(
        (value) {
          address = value!;
          ref
              .read(orderViewModelProvider.notifier)
              .createNewOrder(
                items: state,
                total: total,
                deliveryFee: totalDelivery,
                discount: 0.0,
                address: address!,
                createdAt: DateTime.now(),
                updatedAt: DateTime.now(),
                canceledAt: null,
                customerId: customerId,
              )
              .then(
            (value) {
              clearShoppingCart();
              Navigator.of(context).pushNamedAndRemoveUntil(
                '/checkout',
                (Route<dynamic> route) => route.isFirst,
              );
            },
          );
        },
      );
    });
    // String? customerId = ref.read(authRepositoryProvider).getCurrentUser()?.uid;

    // if (customerId == null) {
    //   Navigator.of(context).pushNamed('/sign-in');
    //   return;
    // }

    // Address? address;
    // ref.read(deliveryAddressProvider).whenData((value) => address = value!);

    // ref.read(orderViewModelProvider.notifier).createNewOrder(
    //       items: state,
    //       total: total,
    //       deliveryFee: totalDelivery,
    //       discount: 0.0,
    //       address: address!,
    //       createdAt: DateTime.now(),
    //       updatedAt: DateTime.now(),
    //       canceledAt: null,
    //       customerId: customerId!,
    //     );
    // Navigator.of(context).pushNamed('/checkout');
  }

  void showItemsNeedScheduling() {
    final items = state
        .where((element) => element.offerType == OfferType.service)
        .toList();
    if (items.isNotEmpty) {
      // items.any((element) => element.scheduleDate == null) TODO: implement the schedule date
      //     ? showScheduleDialog(context)
      //     : checkOut(context);
    }
  }
}
