import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class PaymentHistoryWidget extends StatelessWidget {
  const PaymentHistoryWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
          color: colorScheme.onInverseSurface,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text('Histórico de pagamentos',
                  style: textTheme.titleLarge
                      ?.copyWith(color: colorScheme.primary)),
            ),
            const Gap(8),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: const Text('José Pedreiro - Lavras'),
                    subtitle:
                        const Text('R\$ 100,00 - Crédito \n12/12/2021 12:00'),
                    trailing: Icon(Icons.arrow_forward_ios,
                        color: colorScheme.primary),
                    isThreeLine: true,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
