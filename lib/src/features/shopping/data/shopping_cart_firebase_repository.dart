import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project_marba/src/core/models/cart_item/cart_item_model.dart';
import 'package:uuid/uuid.dart';

import 'shopping_cart_repository.dart';

class FirebaseShoppingCartRepository implements ShoppingCartRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  FirebaseShoppingCartRepository();

  @override
  Future<void> addItemToCart(
      {required String userId, required CartItemModel item}) async {
    final cartRef =
        _firestore.collection('users').doc(userId).collection('cart');
    await cartRef.add(item.toJson());
  }

  @override
  Future<void> updateCartItemQuantity(
      {required String userId, required CartItemModel item}) async {
    final cartItemRef = _firestore
        .collection('users')
        .doc(userId)
        .collection('cart')
        .doc(item.id);
    await cartItemRef.update({'quantity': item.quantity});
  }

  @override
  Future<void> removeItemFromCart(
      {required String userId, required CartItemModel item}) async {
    final cartItemRef = _firestore
        .collection('users')
        .doc(userId)
        .collection('cart')
        .doc(item.id);
    await cartItemRef.delete();
  }

  @override
  Future<List<CartItemModel>> getCartItems({required String userId}) async {
    final cartSnapshot = await _firestore
        .collection('users')
        .doc(userId)
        .collection('cart')
        .get();
    return cartSnapshot.docs
        .map((doc) => CartItemModel.fromJson(doc.data()))
        .toList();
  }

  @override
  Future<void> clearCart({required String userId}) async {
    final cartRef =
        _firestore.collection('users').doc(userId).collection('cart');
    final cartSnapshot = await cartRef.get();
    for (final doc in cartSnapshot.docs) {
      await doc.reference.delete();
    }
  }

  @override
  Future<void> updateCart(
      {required String userId, required List<CartItemModel> items}) {
    final cartRef =
        _firestore.collection('users').doc(userId).collection('cart');
    return _firestore.runTransaction((transaction) async {
      final cartSnapshot = await cartRef.get();
      for (final doc in cartSnapshot.docs) {
        await doc.reference.delete();
      }
      for (final item in items) {
        await cartRef.add(item.toJson());
      }
    });
  }

  Future<void> createSingleBuyCart(
      {required String userId, required CartItemModel item}) async {
    final cartRef = _firestore
        .collection('users')
        .doc(userId)
        .collection(const Uuid().v4());
    await cartRef.add(item.toJson());
  }
}
