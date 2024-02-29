import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:project_marba/src/shared/models/product/product.dart';
import 'package:project_marba/src/shared/models/service/service.dart';

part 'offerModel.freezed.dart';
part 'offerModel.g.dart';

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
