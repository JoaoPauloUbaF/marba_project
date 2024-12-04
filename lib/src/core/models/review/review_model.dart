import 'package:freezed_annotation/freezed_annotation.dart';

part 'review_model.freezed.dart';
part 'review_model.g.dart';

@freezed
class ReviewModel with _$ReviewModel {
  const factory ReviewModel.offer({
    required String id,
    required String userId,
    required String reviewerName,
    required String offerId,
    required String review,
    required double rating,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _ReviewModelOffer;

  const factory ReviewModel.business({
    required String id,
    required String userId,
    required String businessId,
    required String reviewerName,
    required String review,
    required double rating,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _ReviewModelBusiness;

  factory ReviewModel.fromJson(Map<String, dynamic> json) =>
      _$ReviewModelFromJson(json);
}
