import 'package:diacritic/diacritic.dart';
import 'package:project_marba/src/core/models/business/enums.dart';

import '../models/product/enums.dart';
import '../models/service/enums.dart';

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

String normalizeString({required String str}) {
  return removeDiacritics(str).toLowerCase();
}
