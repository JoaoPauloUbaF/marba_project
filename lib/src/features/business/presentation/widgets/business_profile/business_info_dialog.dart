import 'package:flutter/material.dart';

class BusinessInfoDialog extends StatelessWidget {
  const BusinessInfoDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.info_outline, size: 30),
            const SizedBox(height: 8),
            const Text('Ajuda'),
            const SizedBox(height: 8),
            const Text('Em Breve!'),
            const SizedBox(height: 8),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Fechar'),
            ),
          ],
        ),
      ),
    );
  }
}
