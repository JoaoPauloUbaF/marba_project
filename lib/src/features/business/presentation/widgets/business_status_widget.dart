import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:project_marba/src/features/business/application/business_profile_screen_controller/business_profile_screen_controller.dart';

class BusinessStatusWidget extends ConsumerWidget {
  const BusinessStatusWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Map<String, String> statusTranslations = {
      'open': 'Aberto',
      'closed': 'Fechado',
      'pending': 'Pendente',
      'rejected': 'Rejeitado',
      'suspended': 'Suspenso',
      'deleted': 'Deletado',
    };

    final business = ref.watch(businessProfileScreenControllerProvider);
    final String businessStatus =
        business?.status.toString().split('.').last ?? '';

    final String businessStatusTranslated =
        statusTranslations[businessStatus] ?? businessStatus;

    final Color businessStatusColor = ref
        .watch(businessProfileScreenControllerProvider.notifier)
        .getBusinessStatusColor();

    return InkWell(
      onTap: () => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Status do Negócio'),
          content: DropdownButton<String>(
            value: businessStatusTranslated,
            borderRadius: BorderRadius.circular(20),
            items: statusTranslations.values
                .map((status) => DropdownMenuItem(
                      value: status,
                      child: Text(status),
                    ))
                .toList(),
            onChanged: (value) {
              ref
                  .read(businessProfileScreenControllerProvider.notifier)
                  .changeBusinessStatus(status: value!);
            },
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Fechar'),
            ),
          ],
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor.withAlpha(100),
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(20),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Icon(
                Icons.circle,
                size: 12,
                color: businessStatusColor,
              ),
              const SizedBox(width: 2),
              Text(
                businessStatusTranslated,
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      color: businessStatusColor,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
