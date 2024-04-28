import 'package:project_marba/src/core/models/business/enums.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/product/enums.dart';
import '../models/service/enums.dart';
part 'translations_provider.g.dart';

@riverpod
class Translations extends _$Translations {
  @override
  FutureOr<void> build() {}

  String getOrderStatusTranslation(String status) {
    switch (status) {
      case 'waitingConfirmation':
        return 'A confirmar';
      case 'accepted':
        return 'Aceito';
      case 'preparing':
        return 'Preparando';
      case 'delivering':
        return 'Entregando';
      case 'delivered':
        return 'Entregue';
      case 'done':
        return 'Concluído';
      case 'canceled':
        return 'Cancelado';
      default:
        return '';
    }
  }

  String getBusinessCategoryTranslation(BusinessCategory category) {
    return businessCategoryTranslations[category] ??
        category.toString().split('.').last;
  }

  String getProductCategoryTranslation(ProductCategory category) {
    return productCategoryTranslations[category] ??
        category.toString().split('.').last;
  }

  String getServiceCategoryTranslation(ServiceCategory category) {
    return serviceCategoryTranslations[category] ??
        category.toString().split('.').last;
  }

  String getServicePricingTypeTranslation(ServicePricingType type) {
    return servicePricingTypeTranslations[type] ??
        type.toString().split('.').last;
  }
}
