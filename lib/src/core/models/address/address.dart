import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

part 'address.freezed.dart';
part 'address.g.dart';

@freezed
class AddressModel with _$AddressModel {
  factory AddressModel({
    required String id,
    required String street,
    required String neighborhood,
    required String city,
    required String state,
    required String zipCode,
    String? number,
    String? complement,
    String? nickname,
  }) = _Address;

  factory AddressModel.fromJson(Map<String, dynamic> json) =>
      _$AddressModelFromJson(json);

  factory AddressModel.create({
    required String street,
    required String neighborhood,
    required String city,
    required String state,
    required String zipCode,
    String? number,
    String? complement,
    String? nickname,
  }) {
    return AddressModel(
      id: const Uuid().v4(),
      street: street,
      number: number,
      neighborhood: neighborhood,
      city: city,
      state: state,
      zipCode: zipCode,
      complement: complement,
      nickname: nickname,
    );
  }
}
