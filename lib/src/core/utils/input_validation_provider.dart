import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'input_validation_provider.g.dart';

@riverpod
class InputValidation extends _$InputValidation {
  @override
  FutureOr<void> build() {}

  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, insira seu nome';
    }
    return null;
  }

  String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty || value.length < 11) {
      return 'Por favor, insira seu número de telefone';
    }
    return null;
  }

  String? validateAddressStreet(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, insira o nome da rua';
    }
    return null;
  }

  String? validateAddressNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, insira o número do endereço';
    }
    return null;
  }

  String? validateCity(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, insira a cidade';
    }
    return null;
  }

  String? validateState(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, insira o estado';
    }
    return null;
  }

  String? validateZipCode(String? value) {
    if (value == null || value.isEmpty || value.length < 8) {
      return 'Por favor, insira o CEP';
    }
    return null;
  }

  String? validateNeighborhood(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, insira o bairro';
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, insira seu e-mail';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty || value.length < 6) {
      return 'Por favor, insira sua senha';
    }
    return null;
  }

  String? validateConfirmPassword(String? value, String? password) {
    if (value == null || value.isEmpty || value != password) {
      return 'As senhas não coincidem';
    }
    return null;
  }

  String? validateCpf(String? value) {
    if (value == null || value.isEmpty || value.length < 11) {
      return 'Por favor, insira seu CPF';
    }
    return null;
  }

  String? validateCnpj(String? value) {
    if (value == null || value.isEmpty || value.length < 14) {
      return 'Por favor, insira seu CNPJ';
    }
    return null;
  }

  String? validateCompanyName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, insira o nome da empresa';
    }
    return null;
  }
}
