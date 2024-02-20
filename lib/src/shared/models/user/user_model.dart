import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:project_marba/src/shared/models/address/address.dart';
import 'package:uuid/uuid.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@Freezed()
class UserModel with _$UserModel {
  const factory UserModel({
    required String id,
    required String displayName,
    required String email,
    required String phoneNumber,
    required Address address,
    required bool isBusinessOwner,
    Set<String>? ownedBusinessIds,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
