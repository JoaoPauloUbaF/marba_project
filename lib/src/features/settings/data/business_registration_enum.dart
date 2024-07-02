import 'package:flutter/material.dart';

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

  List<Widget> getFormFields(BuildContext context) {
    switch (this) {
      case BusinessRegistrationCategory.cnpj:
        return [
          _buildTextField(context, 'Nome da Empresa'),
          _buildTextField(context, 'CNPJ'),
          _buildTextField(context, 'Inscrição Estadual'),
          _buildTextField(context, 'Inscrição Municipal'),
          _buildTextField(context, 'Endereço Comercial'),
          _buildTextField(context, 'Telefone de Contato'),
          _buildTextField(context, 'E-mail'),
          const SizedBox(height: 20),
          const Text('Logo da Empresa',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          _buildImagePicker(context),
          const SizedBox(height: 20),
          const Text('Documentos Necessários',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          _buildDocumentField(context, 'Foto do CNPJ'),
          _buildDocumentField(context, 'Foto da Inscrição Estadual'),
          _buildDocumentField(context, 'Foto da Inscrição Municipal'),
          _buildDocumentField(context, 'Comprovante de Endereço Comercial'),
          _buildDocumentField(context, 'Certidão Negativa de Débitos Fiscais'),
        ];
      case BusinessRegistrationCategory.mei:
        return [
          _buildTextField(context, 'Nome do MEI'),
          _buildTextField(context, 'CNPJ (MEI)'),
          _buildTextField(context, 'Comprovante de Residência'),
          _buildTextField(context, 'Telefone de Contato'),
          _buildTextField(context, 'E-mail'),
          const SizedBox(height: 20),
          const Text('Logo do MEI',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          _buildImagePicker(context),
          const SizedBox(height: 20),
          const Text('Documentos Necessários',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          _buildDocumentField(context, 'Foto do CNPJ (MEI)'),
          _buildDocumentField(context, 'Comprovante de Residência'),
          _buildDocumentField(context, 'Certidão Negativa de Débitos Fiscais'),
        ];
      case BusinessRegistrationCategory.cpf:
        return [
          _buildTextField(context, 'Nome Completo'),
          _buildTextField(context, 'CPF'),
          _buildTextField(context, 'RG ou CNH'),
          _buildTextField(context, 'Comprovante de Residência'),
          _buildTextField(context, 'Telefone de Contato'),
          _buildTextField(context, 'E-mail'),
          const SizedBox(height: 20),
          const Text('Foto de Perfil',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          _buildImagePicker(context),
          const SizedBox(height: 20),
          const Text('Documentos Necessários',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          _buildDocumentField(context, 'Foto do CPF'),
          _buildDocumentField(context, 'Foto do RG ou CNH'),
          _buildDocumentField(context, 'Comprovante de Residência'),
        ];
    }
  }

  static Widget _buildTextField(BuildContext context, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }

  static Widget _buildDocumentField(BuildContext context, String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        GestureDetector(
          onTap: () {
            // Implementar a funcionalidade de escolher imagem
          },
          child: Container(
            height: 150,
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Center(
              child: Icon(Icons.add_a_photo, size: 50, color: Colors.grey),
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  static Widget _buildImagePicker(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Implementar a funcionalidade de escolher imagem
      },
      child: Container(
        height: 150,
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Center(
          child: Icon(Icons.add_a_photo, size: 50, color: Colors.grey),
        ),
      ),
    );
  }
}
