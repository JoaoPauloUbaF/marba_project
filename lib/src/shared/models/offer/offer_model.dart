import 'package:freezed_annotation/freezed_annotation.dart';

import '../product/product.dart';
import '../service/service.dart';

part 'offer_model.freezed.dart';
part 'offer_model.g.dart';

@freezed
class OfferModel with _$OfferModel {
  const OfferModel._();

  factory OfferModel({
    required String id,
    required String businessId,
    required Set<String> category,
    required DateTime createdAt,
    required DateTime updatedAt,
    required OfferStatus status,
    required OfferType type,
    Set<String>? offerImagesUrls,
    Product? product,
    Service? service,
  }) = _OfferModel;

  String get title =>
      product?.title ?? service?.title ?? 'Titulo não informado';
  String get description =>
      product?.description ?? service?.description ?? 'Descrição não informada';
  double get price => product?.price ?? service?.price ?? 0.0;
  String get imageUrl => product?.imageUrl ?? service?.imageUrl ?? '';
  int? get availableQuantity => product?.availableQuantity;
  double? get itemCost => product?.itemCost;
  Set<String> get categories => category;
  OfferType get offerType => type;
  Product? get productOffer => product;
  Service? get serviceOffer => service;

  factory OfferModel.fromJson(Map<String, dynamic> json) =>
      _$OfferModelFromJson(json);
}

enum OfferStatus { active, inactive, pending, soldOut, onDemand }

enum OfferType { product, service }
