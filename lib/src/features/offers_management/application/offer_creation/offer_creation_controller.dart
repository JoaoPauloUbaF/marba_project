import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_marba/src/features/offers_management/data/offer_data_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/models/offer/offer_model.dart';
import '../../../../core/models/product/enums.dart';
import '../../../../core/models/product/product.dart';
import '../../../../core/models/service/enums.dart';
import '../../../../core/models/service/service.dart';
import '../../../business/application/business_profile_screen_controller/business_profile_screen_controller.dart';

part 'offer_creation_controller.g.dart';

@riverpod
class OfferCreationController extends _$OfferCreationController {
  @override
  FutureOr<void> build() {}

  String? validateTitle(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, de um nome para a oferta';
    }
    return null;
  }

  String? validateDescription(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, insira uma descrição para a oferta';
    }
    return null;
  }

  String? validatePrice(String? value) {
    if (value == null || value.isEmpty || value == 'R\$ 0,00') {
      return 'Por favor, insira o preço da oferta';
    }
    return null;
  }

  String? validateImageUrl(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, selecione a imagem da oferta';
    }
    return null;
  }

  String? validateAvailableQuantity(String? value) {
    if (value == null || value.isEmpty || value == '0') {
      return 'Por favor, insira a quantidade disponível da oferta';
    }
    return null;
  }

  String? validateItemCost(String? value) {
    if (value == null || value.isEmpty || value == 'R\$ 0,00') {
      return 'Por favor, insira o custo do item da oferta';
    }
    return null;
  }

  String? validateCategory(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, selecione uma categoria para a oferta';
    }
    return null;
  }

  String? validateStatus(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, selecione um status para a oferta';
    }
    return null;
  }

  Future<File?> pickNewOfferImage(ImageSource imageSource) async {
    try {
      final image = await ImagePicker().pickImage(source: imageSource);
      if (image == null) return null;
      final imageTemp = File(image.path);
      return imageTemp;
    } on PlatformException catch (e) {
      log('Failed to pick image: $e');
    }
    return null;
  }

  Future<List<File?>> pickMoreOfferMedia() async {
    try {
      final image = await ImagePicker().pickMultipleMedia();
      if (image.isEmpty) return [];
      final imagesTemp = image.map((e) => File(e.path)).toList();
      return imagesTemp;
    } on PlatformException catch (e) {
      log('Failed to pick image: $e');
    }
    return [];
  }

  Future<String> saveOfferImage(File image, String offerId) async {
    final imageUrl =
        await ref.read(offersDataRepositoryProvider).saveOfferImage(
              image,
              offerId,
            );
    if (imageUrl != null) {
      return imageUrl;
    }
    throw Exception('Erro ao salvar a imagem da oferta');
  }

  getOfferAvailableCategories(OfferType offerType) {
    if (offerType == OfferType.product) {
      return ProductCategory.values;
    }
    return ServiceCategory.values;
  }

  Future<String> submitOfferCreationForm({
    required OfferType offerType,
    required String offerTitle,
    required String offerDescription,
    required String offerPrice,
    required String offerAvailableQuantity,
    required String offerItemCost,
    required Set<String> offerCategory,
    required OfferStatus? offerStatus,
    required File? offerImage,
    List<File?>? offerMedia,
    ServicePricingType? servicePricingType,
  }) async {
    final business = ref.read(businessProfileViewModelProvider)!;
    final offerId = const Uuid().v4();
    Product? offerProduct;
    Service? offerService;
    String? offerImageUrl;
    Set<String> offerMediaUrls = {};

    try {
      offerImageUrl = await ref
          .read(offersDataRepositoryProvider)
          .saveOfferImage(offerImage!, offerId);
    } catch (e) {
      log('Error uploading image: $e');
      return 'Erro ao salvar a imagem da oferta';
    }

    if (offerMedia != null) {
      try {
        final mediaUrls = await ref
            .read(offersDataRepositoryProvider)
            .saveOfferMedia(offerMedia, offerId);
        if (mediaUrls.isNotEmpty) {
          offerMediaUrls = mediaUrls.toSet();
        }
      } catch (e) {
        log('Error uploading media: $e');
        return 'Erro ao salvar a imagem da oferta';
      }
    }

    if (offerType == OfferType.product) {
      offerProduct = Product(
        availableQuantity: int.parse(offerAvailableQuantity),
        itemCost: currencyStringToDouble(offerItemCost),
        status: offerStatus.toString(),
      );
    }

    if (offerType == OfferType.service) {
      offerService = Service(
        status: offerStatus.toString(),
        pricingType: servicePricingType ?? ServicePricingType.fixed,
      );
    }

    final offer = OfferModel(
      id: offerId, // Generate or provide ID
      businessId: business.id,
      title: offerTitle,
      titleWords: offerTitle.toLowerCase().split(' '),
      description: offerDescription,
      descriptionWords: offerDescription.toLowerCase().split(' '),
      price: currencyStringToDouble(offerPrice),
      imageUrl: offerImageUrl ?? '', // Provide business ID
      category: offerCategory,
      service: offerService,
      product: offerProduct,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      status: offerStatus ?? OfferStatus.active,
      type: offerType,
      offerImagesUrls: offerMediaUrls,
    );
    ref.read(offersDataRepositoryProvider).createOffer(offer);
    return offer.getTitle;
  }

  String getCategoryTranslation(dynamic category, OfferType offerType) {
    if (offerType == OfferType.product) {
      return productCategoryTranslations[category] ?? '';
    }
    return serviceCategoryTranslations[category as ServiceCategory] ?? '';
  }

  double currencyStringToDouble(String currencyString) {
    currencyString = currencyString.replaceAll('R\$ ', '');
    currencyString = currencyString.replaceAll('.', '');
    currencyString = currencyString.replaceAll(',', '.');
    return double.parse(currencyString);
  }

  void showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  void showSuccessDialog(BuildContext context, String value) {
    showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width, // Set the width
            height: MediaQuery.of(context).size.height * 0.6,
            child: AlertDialog(
              title: Center(
                child: Text('Oferta',
                    style: Theme.of(context).textTheme.titleSmall),
              ),
              content: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      value,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 8), // Reduced size
                    Icon(Icons.check_circle,
                        color: Theme.of(context).colorScheme.primary,
                        size: 24), // Reduced size
                    const SizedBox(height: 8), // Reduced size
                    const Text('Criada com sucesso!'),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                  },
                  child: const Text('Ok'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Map<String, String> get statusTranslations => {
        'active': 'Disponível',
        'inactive': 'Indisponível',
        'pending': 'Pendente',
        'soldOut': 'Esgotado',
        'onDemand': 'Sob Encomenda',
      };

  void showFormErrorDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width, // Set the width
            height: MediaQuery.of(context).size.height * 0.3, // Set the height
            child: AlertDialog(
              title: const Center(child: Text('Erro')),
              content: const Center(
                  child:
                      Text('Por favor, preencha todos os campos obrigatórios')),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Ok'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
