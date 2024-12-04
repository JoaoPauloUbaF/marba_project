import 'package:project_marba/src/core/models/cart_item/cart_item_model.dart';

abstract class ShoppingCartRepository {
  Future<void> updateCart(
      {required String userId, required List<CartItemModel> items});
  // Add an item to the user's cart
  Future<void> addItemToCart(
      {required String userId, required CartItemModel item});

  // Update item quantity in the user's cart
  Future<void> updateCartItemQuantity(
      {required String userId, required CartItemModel item});

  // Remove an item from the user's cart
  Future<void> removeItemFromCart(
      {required String userId, required CartItemModel item});

  // Get the user's cart items
  Future<List<CartItemModel>> getCartItems({required String userId});

  // Clear the user's cart
  Future<void> clearCart({required String userId});

  Future<void> createSingleBuyCart(
      {required String userId, required CartItemModel item});
}
