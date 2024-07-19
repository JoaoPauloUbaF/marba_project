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

  String? validateAddressCity(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, insira a cidade';
    }
    return null;
  }

  String? validateAddressState(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, insira o estado';
    }
    return null;
  }

  String? validateAddressZipCode(String? value) {
    if (value == null || value.isEmpty || value.length < 8) {
      return 'Por favor, insira o CEP';
    }
    return null;
  }

  String? validateAddressNeighborhood(String? value) {
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

  String? validateCPF(String? value) {
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

  String? validateOfferName(String? value) {
    if (value == null || value.isEmpty) {
      return 'A oferta precisa de um nome!';
    }
    return null;
  }

  String? validateAddressComplement(String? value, bool includeNumber) {
    if (!includeNumber) {
      if (value == null || value.isEmpty) {
        return 'Não é possível cadastrar um endereço sem número e sem complemento';
      }
    }
    return null;
  }

  String? validateSubscription(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, insira a inscrição';
    }
    if (value.length < 9) {
      return 'A inscrição precisa ter no mínimo 9 caracteres';
    }
    return null;
  }

  validateRGorCNH(String? value) {
    if (value == null || value.isEmpty || value.length < 9) {
      return 'Por favor, insira o RG ou CNH';
    }
    return null;
  }
}
