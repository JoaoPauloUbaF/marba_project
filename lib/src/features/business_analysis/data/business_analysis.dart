import 'package:freezed_annotation/freezed_annotation.dart';

part 'business_analysis.freezed.dart';
part 'business_analysis.g.dart';

@freezed
class BusinessAnalysis with _$BusinessAnalysis {
  const factory BusinessAnalysis.cpf({
    required String id,
    required String fullName,
    required String cpf,
    required String personalId,
    required String address,
    required String contactPhone,
    required String email,
    required String cpfPhotoUrl,
    required String personalIdImageUrl,
    required String residenceProofUrl,
    required String statusCpf,
  }) = CPFBusiness;

  const factory BusinessAnalysis.mei({
    required String id,
    required String meiFullName,
    required String cnpj,
    required String address,
    required String phoneNumber,
    required String email,
    required String meiCnpjPhotoURL,
    required String residenceProofUrl,
    required String debtCertificateUrl,
    required String statusMei,
  }) = MEIBusiness;

  const factory BusinessAnalysis.cnpj({
    required String id,
    required String companyName,
    required String cnpj,
    required String businessAddress,
    required String businessContactPhone,
    required String email,
    required String cnpjPhotoUrl,
    required String stateRegistrationPhotoUrl,
    required String cityRegistrationImageUrl,
    required String businessAddressProofUrl,
    required String taxDebtsCertUrl,
    required String statusCnpj,
  }) = CNPJBusiness;

  factory BusinessAnalysis.fromJson(Map<String, dynamic> json) =>
      _$BusinessAnalysisFromJson(json);
}
