enum BusinessRegistrationCategory {
  cnpj,
  mei,
  cpf;

  String get name {
    switch (this) {
      case BusinessRegistrationCategory.cnpj:
        return 'Empresa';
      case BusinessRegistrationCategory.mei:
        return 'MEI';
      case BusinessRegistrationCategory.cpf:
        return 'Pessoa Física';
    }
  }

  String get subscription {
    switch (this) {
      case BusinessRegistrationCategory.cnpj:
        return 'R\$ 89,90';
      case BusinessRegistrationCategory.mei:
        return 'R\$ 79,90';
      case BusinessRegistrationCategory.cpf:
        return 'R\$ 49,90';
    }
  }

  String get fee {
    switch (this) {
      case BusinessRegistrationCategory.cnpj:
        return '7%';
      case BusinessRegistrationCategory.mei:
        return '5%';
      case BusinessRegistrationCategory.cpf:
        return '3%';
    }
  }

  String get explanation {
    switch (this) {
      case BusinessRegistrationCategory.cnpj:
        return '''
## Como Funciona

Para se cadastrar como uma empresa em nosso aplicativo, você precisará fornecer algumas informações básicas sobre o seu negócio. Uma vez aprovado, você poderá listar seus produtos ou serviços e começar a vender para milhares de clientes. Aqui estão os passos:

## O Que Precisa

- CNPJ ativo
- Inscrição Estadual e Municipal (se aplicável)
- Comprovante de endereço comercial
- Certidão negativa de débitos fiscais

## Taxas

- **Taxa de inscrição**: R\$ 89,90.
- **Comissão sobre vendas**: 7% sobre o valor das vendas.

''';

      case BusinessRegistrationCategory.mei:
        return '''
## Como Funciona

Para se cadastrar como MEI em nosso aplicativo, você precisará fornecer algumas informações básicas sobre o seu negócio. Uma vez aprovado, você poderá listar seus produtos ou serviços e começar a vender para milhares de clientes. Aqui estão os passos:

## O Que Precisa

- Cadastro MEI ativo
- Comprovante de residência
- Certidão negativa de débitos fiscais

## Taxas

- **Taxa de inscrição**: R\$ 79,90.
- **Comissão sobre vendas**: 5% sobre o valor das vendas.

''';

      case BusinessRegistrationCategory.cpf:
        return '''
## Como Funciona

Para se cadastrar como pessoa física em nosso aplicativo, você precisará fornecer algumas informações básicas sobre você e seu negócio. Você terá 6 meses para formalizar seu negócio como MEI ou CNPJ. Aqui estão os passos:

## O Que Precisa

- Documento de identidade (RG ou CNH)
- Comprovante de residência
- Declaração de intenção de se tornar MEI ou CNPJ em até 6 meses

## Taxas

- **Taxa de inscrição**: R\$ 49,90.
- **Comissão sobre vendas**: 3% sobre o valor das vendas.

''';
    }
  }

  List<Map<String, dynamic>> getFormFieldsData() {
    switch (this) {
      case BusinessRegistrationCategory.cnpj:
        return [
          {
            'type': 'text',
            'label': 'Nome da Empresa',
            'validator': 'validateCompanyName',
            'key': 'companyName',
            'mask': null,
          },
          {
            'type': 'text',
            'label': 'CNPJ',
            'validator': 'validateCNPJ',
            'key': 'cnpj',
            'mask': '00.000.000/0000-00',
          },
          {
            'type': 'text',
            'label': 'Endereço Comercial',
            'validator': 'validateAddress',
            'key': 'businessAddress',
            'mask': null,
          },
          {
            'type': 'text',
            'label': 'Telefone de Contato',
            'validator': 'validatePhoneNumber',
            'key': 'contactPhone',
            'mask': '(00) 00000-0000',
          },
          {
            'type': 'text',
            'label': 'E-mail',
            'validator': 'validateEmail',
            'key': 'email',
            'mask': null,
          },
          {
            'type': 'image',
            'label': 'Foto do CNPJ',
            'validator': 'validateImage',
            'key': 'cnpjPhoto',
            'mask': null,
          },
          {
            'type': 'image',
            'label': 'Foto da Inscrição Estadual',
            'validator': 'validateImage',
            'key': 'stateRegistrationPhoto',
            'mask': null,
          },
          {
            'type': 'image',
            'label': 'Foto da Inscrição Municipal',
            'validator': 'validateImage',
            'key': 'cityRegistrationPhoto',
            'mask': null,
          },
          {
            'type': 'image',
            'label': 'Comprovante de Endereço Comercial',
            'validator': 'validateImage',
            'key': 'businessAddressProof',
            'mask': null,
          },
          {
            'type': 'image',
            'label': 'Certidão Negativa de Débitos Fiscais',
            'validator': 'validateImage',
            'key': 'taxDebtsCertificate',
            'mask': null,
          },
        ];
      case BusinessRegistrationCategory.mei:
        return [
          {
            'type': 'text',
            'label': 'Nome Completo (MEI)',
            'validator': 'validateName',
            'key': 'fullName',
            'mask': null,
          },
          {
            'type': 'text',
            'label': 'CNPJ (MEI)',
            'validator': 'validateCNPJ',
            'key': 'cnpj',
            'mask': '00.000.000/0000-00',
          },
          {
            'type': 'text',
            'label': 'Telefone de Contato',
            'validator': 'validatePhoneNumber',
            'key': 'contactPhone',
            'mask': '(00) 00000-0000',
          },
          {
            'type': 'text',
            'label': 'E-mail',
            'validator': 'validateEmail',
            'key': 'email',
            'mask': null,
          },
          {
            'type': 'text',
            'label': 'Endereço',
            'validator': 'validateAddress',
            'key': 'address',
            'mask': null,
          },
          {
            'type': 'image',
            'label': 'Foto do CNPJ (MEI)',
            'validator': 'validateImage',
            'key': 'cnpjPhoto',
            'mask': null,
          },
          {
            'type': 'image',
            'label': 'Comprovante de Residência',
            'validator': 'validateImage',
            'key': 'residenceProof',
            'mask': null,
          },
          {
            'type': 'image',
            'label': 'Certidão Negativa de Débitos Fiscais',
            'validator': 'validateImage',
            'key': 'taxDebtsCertificate',
            'mask': null,
          },
        ];
      case BusinessRegistrationCategory.cpf:
        return [
          {
            'type': 'text',
            'label': 'Nome Completo',
            'validator': 'validateName',
            'key': 'fullName',
            'mask': null,
          },
          {
            'type': 'text',
            'label': 'CPF',
            'validator': 'validateCPF',
            'key': 'cpf',
            'mask': '000.000.000-00',
          },
          {
            'type': 'text',
            'label': 'RG ou CNH',
            'validator': 'validateRGorCNH',
            'key': 'rgOrCnh',
            'mask': 'AA00.000-000',
          },
          {
            'type': 'text',
            'label': 'Endereço',
            'validator': 'validateAddress',
            'key': 'address',
            'mask': null,
          },
          {
            'type': 'text',
            'label': 'Telefone de Contato',
            'validator': 'validatePhoneNumber',
            'key': 'contactPhone',
            'mask': '(00) 00000-0000',
          },
          {
            'type': 'text',
            'label': 'E-mail',
            'validator': 'validateEmail',
            'key': 'email',
            'mask': null,
          },
          {
            'type': 'image',
            'label': 'Foto do CPF',
            'validator': 'validateImage',
            'key': 'cpfPhoto',
            'mask': null,
          },
          {
            'type': 'image',
            'label': 'Foto do RG ou CNH',
            'validator': 'validateImage',
            'key': 'rgOrCnhPhoto',
            'mask': null,
          },
          {
            'type': 'image',
            'label': 'Comprovante de Residência',
            'validator': 'validateImage',
            'key': 'residenceProof',
            'mask': null,
          },
        ];
    }
  }
}
