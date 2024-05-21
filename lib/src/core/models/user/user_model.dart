import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:project_marba/src/core/models/address/address.dart';
import 'package:project_marba/src/core/models/cart/cart.dart';
import 'package:project_marba/src/core/models/offer/offer_model.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@Freezed()
class UserModel with _$UserModel {
  const UserModel._();

  const factory UserModel({
    required String id,
    required String displayName,
    required String email,
    required String phoneNumber,
    required Address address,
    List<Address>? deliveryAddresses,
    required bool isBusinessOwner,
    Set<String>? ownedBusinessIds,
    Set<String>? favoriteOfferIds,
    List<String>? searchHistory,
    Cart? cart,
  }) = _UserModel;

  Address get userAddress => address;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
