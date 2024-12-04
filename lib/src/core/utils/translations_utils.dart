import 'package:diacritic/diacritic.dart';
import 'package:flutter/material.dart';
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

String getBusinessCategoryTranslation(
    BusinessCategory category, BuildContext context) {
  return category.businessCategoryTranslation(context);
}

String getProductCategoryTranslation(ProductCategory category) {
  return productCategoryTranslations[category] ??
      category.toString().split('.').last;
}

String getServiceCategoryTranslation(
    ServiceCategory category, BuildContext context) {
  return category.getServiceCategoryTranslation(context);
}

String getServicePricingTypeTranslation(ServicePricingType type) {
  return servicePricingTypeTranslations[type] ??
      type.toString().split('.').last;
}

String normalizeString({required String str}) {
  return removeDiacritics(str).toLowerCase();
}
