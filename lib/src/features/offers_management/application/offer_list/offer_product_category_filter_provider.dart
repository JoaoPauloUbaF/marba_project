import 'dart:math';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/models/product/enums.dart';

part 'offer_product_category_filter_provider.g.dart';

@riverpod
class ProductCategoryFilter extends _$ProductCategoryFilter {
  final Set<ProductCategory> randomCategories = {};

  @override
  Set<ProductCategory> build() {
    _getRandomCategories();
    return {};
  }

  void addCategoryFilter(ProductCategory productCategory) {
    Set<ProductCategory> newState = {...state, productCategory};
    state = newState;
  }

  void removeCategoryFilter(ProductCategory productCategory) {
    Set<ProductCategory> newState = {...state};
    newState.remove(productCategory);
    state = newState;
  }

  void clearFilters() {
    state = {};
  }

  void _getRandomCategories() {
    final random = Random();
    for (var i = 0; i < 3; i++) {
      final randomIndex = random.nextInt(ProductCategory.values.length - 1);
      if (!randomCategories.contains(ProductCategory.values[randomIndex])) {
        randomCategories.add(ProductCategory.values[randomIndex]);
      }
    }
  }
}
