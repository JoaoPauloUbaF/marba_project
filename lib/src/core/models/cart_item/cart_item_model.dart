import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:project_marba/src/core/models/offer/offer_model.dart';

part 'cart_item_model.freezed.dart';
part 'cart_item_model.g.dart';

@freezed
class CartItemModel with _$CartItemModel {
  factory CartItemModel({
    required String id,
    required String name,
    required double price,
    required double cost,
    required String imageUrl,
    required int quantity,
    required String businessId,
    required OfferType offerType,
  }) = _CartItemModel;

  factory CartItemModel.fromJson(Map<String, dynamic> json) =>
      _$CartItemModelFromJson(json);
}
