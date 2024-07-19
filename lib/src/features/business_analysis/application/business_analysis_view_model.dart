import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_marba/src/core/utils/input_validation_provider.dart';
import 'package:project_marba/src/core/utils/view_utils.dart';
import 'package:project_marba/src/features/business_analysis/data/business_analysis.dart';
import 'package:project_marba/src/features/business_analysis/data/business_registration_enum.dart';
import 'package:uuid/uuid.dart';

import '../data/business_analysis_repository_provider.dart';

class BusinessAnalysisViewModel {
  final WidgetRef ref;

  BusinessAnalysisViewModel(this.ref);

  String? validate(String type, String validator, String? value) {
    if (type == 'text') {
      switch (validator) {
        case 'validateCompanyName':
          return ref
              .read(inputValidationProvider.notifier)
              .validateCompanyName(value);
        case 'validateName':
          return ref.read(inputValidationProvider.notifier).validateName(value);
        case 'validateCNPJ':
          return ref.read(inputValidationProvider.notifier).validateCnpj(value);
        case 'validateSubscription':
          return ref
              .read(inputValidationProvider.notifier)
              .validateSubscription(value);
        case 'validateAddress':
          return ref
              .read(inputValidationProvider.notifier)
              .validateAddressCity(value); // TODO: use google maps
        case 'validatePhone':
          return ref
              .read(inputValidationProvider.notifier)
              .validatePhoneNumber(value);
        case 'validateEmail':
          return ref
              .read(inputValidationProvider.notifier)
              .validateEmail(value);
        case 'validateCPF':
          return ref.read(inputValidationProvider.notifier).validateCPF(value);
        case 'validateRGorCNH':
          return ref
              .read(inputValidationProvider.notifier)
              .validateRGorCNH(value);
      }
    }
    return null;
  }

  Future<void> submitBusinessAnalysisForm(
    BuildContext context, {
    required BusinessRegistrationCategory category,
    required Map<String, File?> imageFiles,
    required Map<String, String> formData,
  }) async {
    showLoader(context);
    BusinessAnalysis? businessAnalysis;
    switch (category) {
      case BusinessRegistrationCategory.cpf:
        businessAnalysis =
            await createCPFBusinessAnalysis(imageFiles, formData);
        break;
      case BusinessRegistrationCategory.mei:
        businessAnalysis =
            await createMEIBusinessAnalysis(imageFiles, formData);
        break;
      case BusinessRegistrationCategory.cnpj:
        businessAnalysis =
            await createCNPJBusinessAnalysis(imageFiles, formData);
        break;
    }
    await ref
        .read(businessAnalysisRepositoryProvider)
        .uploadBusinessAnalysis(businessAnalysis)
        .then((_) {
      hideLoader(context);
      Navigator.pushNamed(
        context,
        '/business-submission-confirmation',
      );
    });
  }

  Future<BusinessAnalysis> createCPFBusinessAnalysis(
    Map<String, File?> imageFiles,
    Map<String, String> formData,
  ) async {
    final fotoCpfUrl = await ref
        .read(businessAnalysisRepositoryProvider)
        .uploadImage(imageFiles['cpfPhoto']!, cpfOrCNPJ: formData['cpf']!);
    final fotoRgOuCnhUrl = await ref
        .read(businessAnalysisRepositoryProvider)
        .uploadImage(imageFiles['rgOrCnhPhoto']!, cpfOrCNPJ: formData['cpf']!);
    final comprovanteDeResidenciaUrl = await ref
        .read(businessAnalysisRepositoryProvider)
        .uploadImage(imageFiles['residenceProof']!,
            cpfOrCNPJ: formData['cpf']!);

    return BusinessAnalysis.cpf(
      id: const Uuid().v4(),
      fullName: formData['fullName']!,
      cpf: formData['cpf']!,
      personalId: formData['rgOrCnh']!,
      address: formData['address']!,
      contactPhone: formData['contactPhone']!,
      email: formData['email']!,
      cpfPhotoUrl: fotoCpfUrl,
      personalIdImageUrl: fotoRgOuCnhUrl,
      residenceProofUrl: comprovanteDeResidenciaUrl,
      statusCpf: 'In Analysis',
    );
  }

  Future<BusinessAnalysis> createMEIBusinessAnalysis(
    Map<String, File?> imageFiles,
    Map<String, String> formData,
  ) async {
    final cnpjMEIPhotoUrl = await ref
        .read(businessAnalysisRepositoryProvider)
        .uploadImage(imageFiles['cnpjPhoto']!, cpfOrCNPJ: formData['cnpj']!);
    final addressProofUrl = await ref
        .read(businessAnalysisRepositoryProvider)
        .uploadImage(imageFiles['residenceProof']!,
            cpfOrCNPJ: formData['cnpj']!);
    final debtCertificateUrl = await ref
        .read(businessAnalysisRepositoryProvider)
        .uploadImage(imageFiles['taxDebtsCertificate']!,
            cpfOrCNPJ: formData['cnpj']!);

    return BusinessAnalysis.mei(
      id: const Uuid().v4(),
      meiFullName: formData['fullName']!,
      cnpj: formData['cnpj']!,
      address: formData['address']!,
      phoneNumber: formData['contactPhone']!,
      email: formData['email']!,
      meiCnpjPhotoURL: cnpjMEIPhotoUrl,
      residenceProofUrl: addressProofUrl,
      debtCertificateUrl: debtCertificateUrl,
      statusMei: 'In Analysis',
    );
  }

  Future<BusinessAnalysis> createCNPJBusinessAnalysis(
    Map<String, File?> imageFiles,
    Map<String, String> formData,
  ) async {
    final cnpjPhotoUrl = await ref
        .read(businessAnalysisRepositoryProvider)
        .uploadImage(imageFiles['cnpjPhoto']!, cpfOrCNPJ: formData['cnpj']!);
    final stateRegistrationPhotoUrl = await ref
        .read(businessAnalysisRepositoryProvider)
        .uploadImage(imageFiles['stateRegistrationPhoto']!,
            cpfOrCNPJ: formData['cnpj']!);
    final cityRegistrationPhotoUrl = await ref
        .read(businessAnalysisRepositoryProvider)
        .uploadImage(imageFiles['cityRegistrationPhoto']!,
            cpfOrCNPJ: formData['cnpj']!);
    final businessAddressProofUrl = await ref
        .read(businessAnalysisRepositoryProvider)
        .uploadImage(imageFiles['businessAddressProof']!,
            cpfOrCNPJ: formData['cnpj']!);
    final taxDebtsCertificateUrl = await ref
        .read(businessAnalysisRepositoryProvider)
        .uploadImage(imageFiles['taxDebtsCertificate']!,
            cpfOrCNPJ: formData['cnpj']!);

    return BusinessAnalysis.cnpj(
      id: const Uuid().v4(),
      companyName: formData['companyName']!,
      cnpj: formData['cnpj']!,
      businessAddress: formData['businessAddress']!,
      businessContactPhone: formData['contactPhone']!,
      email: formData['email']!,
      cnpjPhotoUrl: cnpjPhotoUrl,
      stateRegistrationPhotoUrl: stateRegistrationPhotoUrl,
      cityRegistrationImageUrl: cityRegistrationPhotoUrl,
      businessAddressProofUrl: businessAddressProofUrl,
      taxDebtsCertUrl: taxDebtsCertificateUrl,
      statusCnpj: 'Em Análise',
    );
  }
}
