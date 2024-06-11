import 'package:freezed_annotation/freezed_annotation.dart';

part 'address.freezed.dart';
part 'address.g.dart';

@freezed
class AddressModel with _$AddressModel {
  factory AddressModel({
    required String street,
    String? number,
    required String neighborhood,
    required String city,
    required String state,
    required String zipCode,
    String? complement,
    String? nickname,
  }) = _Address;

  factory AddressModel.fromJson(Map<String, dynamic> json) =>
      _$AddressModelFromJson(json);
}
