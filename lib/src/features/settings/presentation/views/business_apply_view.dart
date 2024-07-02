import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

import '../../data/business_registration_enum.dart';
import 'business_apply_form_view.dart';

class BusinessApplyView extends StatelessWidget {
  const BusinessApplyView({super.key});

  final String message = '''
## Bem-vindo(a)!

Estamos super felizes em ter você por aqui! 🥳

Para começar a vender seus produtos ou serviços pelo nosso app, primeiro precisamos conhecer um pouquinho mais sobre o seu negócio. Escolha abaixo a categoria que melhor descreve você:

- **Empresa**: Se você tem uma empresa com CNPJ ativo e está pronto(a) para alavancar suas vendas.
- **Microempreendedor Individual (MEI)**: Para os guerreiros(as) autônomos(as) que já têm o MEI e querem crescer ainda mais.
- **Pessoa Física**: Está começando agora? Sem problemas! Você pode começar como pessoa física e formalizar seu negócio como MEI ou CNPJ em até 6 meses.

Vamos nessa? 😃 Escolha uma das opções abaixo para continuar e conte conosco para o que precisar!

''';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastrar Meu Negócio'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MarkdownBody(data: message),
              const SizedBox(height: 20),
              ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  _buildCategoryCard(
                    context,
                    icon: Icons.business,
                    title: 'Empresa',
                    subtitle: 'Cadastro para empresas com CNPJ ativo.',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const BusinessApplyFormView(
                            category: BusinessRegistrationCategory.cnpj,
                          ),
                        ),
                      );
                    },
                  ),
                  _buildCategoryCard(
                    context,
                    icon: Icons.store,
                    title: 'Microempreendedor Individual (MEI)',
                    subtitle: 'Cadastro para MEIs com documentação ativa.',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const BusinessApplyFormView(
                            category: BusinessRegistrationCategory.mei,
                          ),
                        ),
                      );
                    },
                  ),
                  _buildCategoryCard(
                    context,
                    icon: Icons.person,
                    title: 'Pessoa Física',
                    subtitle:
                        'Cadastro inicial para pessoas físicas. Formalização em 6 meses.',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const BusinessApplyFormView(
                            category: BusinessRegistrationCategory.cpf,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        leading:
            Icon(icon, color: Theme.of(context).colorScheme.primary, size: 40),
        title: Text(title, style: Theme.of(context).textTheme.titleMedium),
        subtitle: Text(subtitle),
        onTap: onTap,
      ),
    );
  }
}
