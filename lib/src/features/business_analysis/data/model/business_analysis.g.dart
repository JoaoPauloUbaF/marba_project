// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'business_analysis.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CPFBusinessImpl _$$CPFBusinessImplFromJson(Map<String, dynamic> json) =>
    _$CPFBusinessImpl(
      id: json['id'] as String,
      fullName: json['fullName'] as String,
      cpf: json['cpf'] as String,
      personalId: json['personalId'] as String,
      address: json['address'] as String,
      contactPhone: json['contactPhone'] as String,
      email: json['email'] as String,
      cpfPhotoUrl: json['cpfPhotoUrl'] as String,
      personalIdImageUrl: json['personalIdImageUrl'] as String,
      residenceProofUrl: json['residenceProofUrl'] as String,
      statusCpf: json['statusCpf'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$CPFBusinessImplToJson(_$CPFBusinessImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fullName': instance.fullName,
      'cpf': instance.cpf,
      'personalId': instance.personalId,
      'address': instance.address,
      'contactPhone': instance.contactPhone,
      'email': instance.email,
      'cpfPhotoUrl': instance.cpfPhotoUrl,
      'personalIdImageUrl': instance.personalIdImageUrl,
      'residenceProofUrl': instance.residenceProofUrl,
      'statusCpf': instance.statusCpf,
      'runtimeType': instance.$type,
    };

_$MEIBusinessImpl _$$MEIBusinessImplFromJson(Map<String, dynamic> json) =>
    _$MEIBusinessImpl(
      id: json['id'] as String,
      meiFullName: json['meiFullName'] as String,
      cnpj: json['cnpj'] as String,
      address: json['address'] as String,
      phoneNumber: json['phoneNumber'] as String,
      email: json['email'] as String,
      meiCnpjPhotoURL: json['meiCnpjPhotoURL'] as String,
      residenceProofUrl: json['residenceProofUrl'] as String,
      debtCertificateUrl: json['debtCertificateUrl'] as String,
      statusMei: json['statusMei'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$MEIBusinessImplToJson(_$MEIBusinessImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'meiFullName': instance.meiFullName,
      'cnpj': instance.cnpj,
      'address': instance.address,
      'phoneNumber': instance.phoneNumber,
      'email': instance.email,
      'meiCnpjPhotoURL': instance.meiCnpjPhotoURL,
      'residenceProofUrl': instance.residenceProofUrl,
      'debtCertificateUrl': instance.debtCertificateUrl,
      'statusMei': instance.statusMei,
      'runtimeType': instance.$type,
    };

_$CNPJBusinessImpl _$$CNPJBusinessImplFromJson(Map<String, dynamic> json) =>
    _$CNPJBusinessImpl(
      id: json['id'] as String,
      companyName: json['companyName'] as String,
      cnpj: json['cnpj'] as String,
      businessAddress: json['businessAddress'] as String,
      businessContactPhone: json['businessContactPhone'] as String,
      email: json['email'] as String,
      cnpjPhotoUrl: json['cnpjPhotoUrl'] as String,
      stateRegistrationPhotoUrl: json['stateRegistrationPhotoUrl'] as String,
      cityRegistrationImageUrl: json['cityRegistrationImageUrl'] as String,
      businessAddressProofUrl: json['businessAddressProofUrl'] as String,
      taxDebtsCertUrl: json['taxDebtsCertUrl'] as String,
      statusCnpj: json['statusCnpj'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$CNPJBusinessImplToJson(_$CNPJBusinessImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'companyName': instance.companyName,
      'cnpj': instance.cnpj,
      'businessAddress': instance.businessAddress,
      'businessContactPhone': instance.businessContactPhone,
      'email': instance.email,
      'cnpjPhotoUrl': instance.cnpjPhotoUrl,
      'stateRegistrationPhotoUrl': instance.stateRegistrationPhotoUrl,
      'cityRegistrationImageUrl': instance.cityRegistrationImageUrl,
      'businessAddressProofUrl': instance.businessAddressProofUrl,
      'taxDebtsCertUrl': instance.taxDebtsCertUrl,
      'statusCnpj': instance.statusCnpj,
      'runtimeType': instance.$type,
    };
