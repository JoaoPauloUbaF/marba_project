import 'business_apply_strings.dart';

enum BusinessRegistrationCategory {
  cnpj,
  mei,
  cpf;

  String get name {
    switch (this) {
      case BusinessRegistrationCategory.cnpj:
        return companyTitle;
      case BusinessRegistrationCategory.mei:
        return meiTitle;
      case BusinessRegistrationCategory.cpf:
        return individualTitle;
    }
  }

  String get subscription {
    switch (this) {
      case BusinessRegistrationCategory.cnpj:
        return companySubscription;
      case BusinessRegistrationCategory.mei:
        return meiSubscription;
      case BusinessRegistrationCategory.cpf:
        return individualSubscription;
    }
  }

  String get fee {
    switch (this) {
      case BusinessRegistrationCategory.cnpj:
        return companyFee;
      case BusinessRegistrationCategory.mei:
        return meiFee;
      case BusinessRegistrationCategory.cpf:
        return individualFee;
    }
  }

  String get explanation {
    switch (this) {
      case BusinessRegistrationCategory.cnpj:
        return companyExplanation;
      case BusinessRegistrationCategory.mei:
        return meiExplanation;
      case BusinessRegistrationCategory.cpf:
        return individualExplanation;
    }
  }

  List<Map<String, dynamic>> getFormFieldsData() {
    switch (this) {
      case BusinessRegistrationCategory.cnpj:
        return companyFormFields;
      case BusinessRegistrationCategory.mei:
        return meiFormFields;
      case BusinessRegistrationCategory.cpf:
        return individualFormFields;
    }
  }
}
