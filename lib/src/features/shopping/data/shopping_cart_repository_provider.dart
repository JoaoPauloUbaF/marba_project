import 'package:project_marba/src/features/shopping/data/shopping_cart_firebase_repository.dart';
import 'package:project_marba/src/features/shopping/data/shopping_cart_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'shopping_cart_repository_provider.g.dart';

@riverpod
ShoppingCartRepository shoppingCartRepository(ShoppingCartRepositoryRef ref) {
  return FirebaseShoppingCartRepository();
}
