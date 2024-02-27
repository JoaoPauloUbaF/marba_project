import 'package:freezed_annotation/freezed_annotation.dart';

part 'product.freezed.dart';
part 'product.g.dart';

@freezed
class Product with _$Product {
  factory Product({
    required String id,
    required String businessId,
    required String title,
    required String description,
    required double price,
    required String imageUrl,
    required String category,
    required String status,
    required DateTime createdAt,
    required DateTime updatedAt,
    required int availableQuantity,
    required double? itemCost,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}
