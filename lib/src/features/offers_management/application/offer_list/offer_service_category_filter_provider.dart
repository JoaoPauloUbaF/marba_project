import 'package:project_marba/src/shared/models/service/service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'offer_service_category_filter_provider.g.dart';

@riverpod
class ServiceCategoryFilter extends _$ServiceCategoryFilter {
  @override
  ServiceCategory? build() {
    return null;
  }

  void setCategoryFilter(ServiceCategory? productCategory) {
    state = productCategory;
  }
}
