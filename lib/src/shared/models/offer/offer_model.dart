import 'package:freezed_annotation/freezed_annotation.dart';

import '../product/product.dart';
import '../service/service.dart';

part 'offer_model.freezed.dart';
part 'offer_model.g.dart';

@freezed
class OfferModel with _$OfferModel {
  factory OfferModel({
    required String id,
    required String businessId,
    required String category,
    required DateTime createdAt,
    required DateTime updatedAt,
    Product? product,
    Service? service,
  }) = _OfferModel;

  factory OfferModel.fromJson(Map<String, dynamic> json) =>
      _$OfferModelFromJson(json);
}
