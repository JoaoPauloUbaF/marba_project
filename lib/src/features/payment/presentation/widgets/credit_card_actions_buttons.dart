import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CreditCardActionsButtons extends StatelessWidget {
  const CreditCardActionsButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          const Gap(16),
          Expanded(
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.edit),
              label: const Text('Editar'),
              style: ElevatedButton.styleFrom(
                backgroundColor: colorScheme.onInverseSurface,
                foregroundColor: colorScheme.primary,
              ),
            ),
          ),
          const Gap(16),
          Expanded(
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.delete),
              label: const Text('Excluir'),
              style: ElevatedButton.styleFrom(
                backgroundColor: colorScheme.error,
                foregroundColor: colorScheme.onError,
              ),
            ),
          ),
          const Gap(16),
        ],
      ),
    );
  }
}
