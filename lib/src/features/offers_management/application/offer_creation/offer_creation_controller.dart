import 'dart:io';

import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_marba/src/features/offers_management/data/offer_data_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

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
    if (value == null || value.isEmpty) {
      return 'Por favor, insira o preço da oferta';
    }
    return null;
  }

  String? validateImageUrl(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, insira a URL da imagem da oferta';
    }
    return null;
  }

  String? validateAvailableQuantity(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, insira a quantidade disponível da oferta';
    }
    return null;
  }

  String? validateItemCost(String? value) {
    if (value == null || value.isEmpty) {
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

  Future<File?> pickNewOfferImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return null;
      final imageTemp = File(image.path);
      return imageTemp;
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
    return null;
  }

  Future<String> saveOfferImage(File image, String offerId) async {
    final imageUrl =
        await ref.read(offerRepositoryProviderProvider).saveOfferImage(
              image,
              offerId,
            );
    if (imageUrl != null) {
      return imageUrl;
    }
    throw Exception('Erro ao salvar a imagem da oferta');
  }
}
