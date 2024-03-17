import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../shared/models/product/product.dart';

part 'offer_product_category_filter_provider.g.dart';

@riverpod
class ProductCategoryFilter extends _$ProductCategoryFilter {
  @override
  Set<ProductCategory> build() {
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
}
