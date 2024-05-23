import 'dart:math';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/models/service/enums.dart';

part 'offer_service_category_filter_provider.g.dart';

@riverpod
class ServiceCategoryFilter extends _$ServiceCategoryFilter {
  final Set<ServiceCategory> randomCategories = {};

  @override
  Set<ServiceCategory> build() {
    _getRandomCategories();
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

  void clearFilters() {
    state = {};
  }

  void _getRandomCategories() {
    final random = Random();
    for (var i = 0; i < 3; i++) {
      final randomIndex = random.nextInt(ServiceCategory.values.length - 1);
      if (!randomCategories.contains(ServiceCategory.values[randomIndex])) {
        randomCategories.add(ServiceCategory.values[randomIndex]);
      }
    }
  }
}
