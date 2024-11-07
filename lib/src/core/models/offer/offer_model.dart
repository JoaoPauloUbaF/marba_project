import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:project_marba/src/core/models/review/review_model.dart';

import '../product/product.dart';
import '../service/service.dart';

part 'offer_model.freezed.dart';
part 'offer_model.g.dart';

@freezed
class OfferModel with _$OfferModel {
  const OfferModel._();

  factory OfferModel({
    required String id,
    required String title,
    required List<String> titleWords,
    required String description,
    required List<String> descriptionWords,
    required double price,
    required String imageUrl,
    required String businessId,
    required Set<String> category,
    required DateTime createdAt,
    required DateTime updatedAt,
    required OfferStatus status,
    required OfferType type,
    required String city,
    List<ReviewModel>? reviews,
    int? totalSalesNumber,
    double? rating,
    Map<int, int>? ratingDistribution,
    double? discount,
    Set<String>? offerImagesUrls,
    Product? product,
    Service? service,
  }) = _OfferModel;

  String get getTitle => title;
  String get getDescription => description;
  double get getPrice => price;
  String get getImageUrl => imageUrl;
  int? get availableQuantity => product?.availableQuantity;
  double? get itemCost => product?.itemCost;
  Set<String> get categories => category;
  OfferType get offerType => type;
  Product? get productOffer => product;
  Service? get serviceOffer => service;
  double get discountValue => discount ?? 0.0;
  double get ratingValue => rating ?? 0.0;
  double get priceWithDiscount => getPrice - (getPrice * discountValue / 100);
  int get totalRatings => reviews?.length ?? 0;
  int get totalSales => totalSalesNumber ?? 0;
  Map<int, int> get ratingsDistribution => ratingDistribution ?? {};

  factory OfferModel.fromJson(Map<String, dynamic> json) =>
      _$OfferModelFromJson(json);
}

enum OfferStatus { active, inactive, pending, soldOut, onDemand }

enum OfferType { product, service }
