import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'shopping_cart_screen_controller.g.dart';

@riverpod
class ShoppingCartController extends _$ShoppingCartController {
  @override
  ShoppingCartControllerState? build() {
    return ShoppingCartControllerState.initial;
  }
}

enum ShoppingCartControllerState {
  initial,
  loading,
  loaded,
  error,
}
