import 'package:flutter/material.dart';

class BusinessSubmissionConfirmationView extends StatelessWidget {
  const BusinessSubmissionConfirmationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Confirmação de Envio'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.check_circle_outline,
                  color: Theme.of(context).colorScheme.primary, size: 100),
              const SizedBox(height: 20),
              Text(
                'Cadastro Enviado com Sucesso!',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(color: Theme.of(context).colorScheme.primary),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              const Text(
                'Obrigado por enviar seus documentos. Nossa equipe irá analisá-los e retornaremos em breve. Enquanto isso, relaxe e aproveite seu dia!',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/home', (route) => false);
                },
                child: const Text('Voltar ao Início'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
