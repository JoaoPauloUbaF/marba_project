import 'dart:developer';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_marba/src/features/offers_management/data/offer_data_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

import '../../../../shared/models/offer/offer_model.dart';
import '../../../../shared/models/product/product.dart';
import '../../../../shared/models/service/service.dart';
import '../../../my_business/application/business_profile_screen_controller/business_profile_screen_controller.dart';

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
  }) async {
    final business = ref.read(businessProfileScreenControllerProvider)!;
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
        title: offerTitle,
        description: offerDescription,
        price: currencyStringToDouble(offerPrice),
        imageUrl: offerImageUrl ?? '',
        availableQuantity: int.parse(offerAvailableQuantity),
        itemCost: currencyStringToDouble(offerItemCost),
        status: offerStatus.toString(),
      );
    }

    if (offerType == OfferType.service) {
      offerService = Service(
        title: offerTitle,
        description: offerDescription,
        price: currencyStringToDouble(offerPrice),
        imageUrl: offerImageUrl ?? '',
        status: offerStatus.toString(),
      );
    }

    final offer = OfferModel(
      id: offerId, // Generate or provide ID
      businessId: business.id, // Provide business ID
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
    return offer.title;
  }

  String getCategoryTranslation(String category, OfferType offerType) {
    category = category.split('.').last;

    if (offerType == OfferType.product) {
      return productCategoryTranslations[category] ?? '';
    }
    return serviceCategoryTranslations[category] ?? '';
  }

  double currencyStringToDouble(String currencyString) {
    currencyString = currencyString.replaceAll('R\$ ', '');
    currencyString = currencyString.replaceAll('.', '');
    currencyString = currencyString.replaceAll(',', '.');
    return double.parse(currencyString);
  }

  Map<String, String> get statusTranslations => {
        'active': 'Disponível',
        'inactive': 'Indisponível',
        'pending': 'Pendente',
        'soldOut': 'Esgotado',
        'onDemand': 'Sob Encomenda',
      };

  Map<String, String> get productCategoryTranslations => {
        'food': 'Alimentos',
        'drink': 'Bebidas',
        'clothing': 'Vestuário',
        'electronics': 'Eletrônicos',
        'beauty': 'Beleza',
        'health': 'Saúde',
        'home': 'Casa',
        'construction': 'Construção',
        'pets': 'Animais',
        'other': 'Outros',
      };

  Map<String, String> get serviceCategoryTranslations => {
        'beauty': 'Beleza',
        'health': 'Saúde',
        'home': 'Casa',
        'construction': 'Construção',
        'pets': 'Animais',
        'other': 'Outros',
      };
}
