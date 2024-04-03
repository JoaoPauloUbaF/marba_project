import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/models/service/enums.dart';

part 'offer_service_category_filter_provider.g.dart';

@riverpod
class ServiceCategoryFilter extends _$ServiceCategoryFilter {
  @override
  Set<ServiceCategory> build() {
    return {};
  }

  void addCategoryFilter(ServiceCategory serviceCategory) {
    final newState = {...state, serviceCategory};
    state = newState;
  }

  void removeCategoryFilter(ServiceCategory serviceCategory) {
    final newState = {...state};
    newState.remove(serviceCategory);
    state = newState;
  }
}
