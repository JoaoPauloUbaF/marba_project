import 'dart:io';

import 'package:project_marba/src/features/offers_management/data/offer_data_repository_provider.dart';
import 'package:project_marba/src/core/utils/registration_utils.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/models/offer/offer_model.dart';

part 'offer_edition_controller.g.dart';

@Riverpod(keepAlive: true)
class OfferEditionController extends _$OfferEditionController {
  @override
  OfferModel? build() {
    return null;
  }

  FutureOr<void> setSelectedOfferToEdit(OfferModel offer) {
    state = offer;
  }

  Future<String> validateAndSubmitOfferUpdate({
    required String title,
    required String description,
    required String price,
    required String availableQuantity,
    required String itemCost,
    required Set<String> category,
    required OfferType type,
    required OfferStatus status,
    File? image,
  }) {
    if (type == OfferType.product) {
      final updatedProduct = state!.product!.copyWith(
        availableQuantity: int.parse(availableQuantity),
        itemCost: RegistrationUtils().currencyStringToDouble(itemCost),
      );
      final offer = state!.copyWith(
          product: updatedProduct, category: category, status: status);
      return updateOffer(offer);
    } else {
      final updatedService = state!.service!.copyWith();
      final offer = state!.copyWith(
          service: updatedService, category: category, status: status);
      return updateOffer(offer);
    }
  }

  Future<String> updateOffer(OfferModel offer) async {
    try {
      await ref.read(offersDataRepositoryProvider).updateOffer(offer);
      return 'Oferta atualizada com sucesso';
    } catch (e) {
      return 'Erro ao atualizar oferta';
    }
  }
}
