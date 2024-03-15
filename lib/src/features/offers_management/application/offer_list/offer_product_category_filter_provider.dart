import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../shared/models/product/product.dart';

part 'offer_product_category_filter_provider.g.dart';

@riverpod
class ProductCategoryFilter extends _$ProductCategoryFilter {
  @override
  ProductCategory? build() {
    return null;
  }

  void setCategoryFilter(ProductCategory? productCategory) {
    state = productCategory;
  }
}
