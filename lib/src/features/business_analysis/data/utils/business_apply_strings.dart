const String businessApplyMessage = '''
## Bem-vindo(a)!

Estamos super felizes em ter você por aqui! 🥳

Para começar a vender seus produtos ou serviços pelo nosso app, primeiro precisamos conhecer um pouquinho mais sobre o seu negócio. Escolha abaixo a categoria que melhor descreve você:

- **Empresa**: Se você tem uma empresa com CNPJ ativo e está pronto(a) para alavancar suas vendas.
- **Microempreendedor Individual (MEI)**: Para os guerreiros(as) autônomos(as) que já têm o MEI e querem crescer ainda mais.
- **Pessoa Física**: Está começando agora? Sem problemas! Você pode começar como pessoa física e formalizar seu negócio como MEI ou CNPJ em até 6 meses.

Vamos nessa? 😃 Escolha uma das opções abaixo para continuar e conte conosco para o que precisar!
''';

const String registerBusinessTitle = 'Cadastrar Meu Negócio';
const String companyTitle = 'Empresa';
const String companySubtitle = 'Cadastro para empresas com CNPJ ativo.';
const String meiTitle = 'Microempreendedor Individual (MEI)';
const String meiSubtitle = 'Cadastro para MEIs com documentação ativa.';
const String individualTitle = 'Pessoa Física';
const String individualSubtitle =
    'Cadastro inicial para pessoas físicas. Formalização em 6 meses.';

const String companySubscription = 'R\$ 89,90';
const String meiSubscription = 'R\$ 79,90';
const String individualSubscription = 'R\$ 49,90';

const String companyFee = '7%';
const String meiFee = '5%';
const String individualFee = '3%';

const String companyExplanation = '''
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

const String meiExplanation = '''
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

const String individualExplanation = '''
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

const List<Map<String, dynamic>> companyFormFields = [
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

const List<Map<String, dynamic>> meiFormFields = [
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

const List<Map<String, dynamic>> individualFormFields = [
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

const submitErrorMessage =
    'Ocorreu um erro ao enviar a análise de negócio. Por favor, tente novamente.';
const submitSuccessTitle = 'Cadastro Enviado com Sucesso!';
const submitSuccessMessage =
    'Obrigado por enviar seus documentos. Nossa equipe irá analisá-los e retornaremos em breve através do e-mail cadastrado. Enquanto isso, relaxe e aproveite seu dia!';
const submitGoBackButtonLabel = 'Voltar ao Início';
