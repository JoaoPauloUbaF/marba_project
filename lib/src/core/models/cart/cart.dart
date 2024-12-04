import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:project_marba/src/core/models/cart_item/cart_item_model.dart';

part 'cart.freezed.dart';
part 'cart.g.dart';

@freezed
class Cart with _$Cart {
  factory Cart({
    Set<CartItemModel>? itemsIds,
  }) = _Cart;

  factory Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);
}
