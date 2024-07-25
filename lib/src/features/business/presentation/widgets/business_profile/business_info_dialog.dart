import 'package:flutter/material.dart';

class BusinessInfoDialog extends StatelessWidget {
  const BusinessInfoDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.info_outline, size: 30),
          const SizedBox(height: 8),
          const Text('Informações do negócio'),
          const SizedBox(height: 8),
          const Divider(),
          const SizedBox(height: 8),
          const Text('Aqui você encontra informações sobre o negócio'),
          const SizedBox(height: 8),
          const Divider(),
          const SizedBox(height: 8),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Fechar'),
          ),
        ],
      ),
    );
  }
}
