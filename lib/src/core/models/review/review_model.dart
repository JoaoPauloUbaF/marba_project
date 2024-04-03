import 'package:freezed_annotation/freezed_annotation.dart';

part 'review_model.freezed.dart';
part 'review_model.g.dart';

@freezed
class ReviewModel with _$ReviewModel {
  factory ReviewModel({
    required String id,
    required String userId,
    required String offerId,
    required String review,
    required double rating,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _ReviewModel;

  factory ReviewModel.fromJson(Map<String, dynamic> json) =>
      _$ReviewModelFromJson(json);
}
