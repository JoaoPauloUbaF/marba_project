import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:project_marba/src/features/business/application/business_profile_view_model/business_profile_screen_controller.dart';

class BusinessStatusWidget extends ConsumerWidget {
  const BusinessStatusWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Map<String, String> statusTranslations = {
      'open': 'Aberto',
      'closed': 'Fechado',
    };

    final businessProfileViewModel =
        ref.read(businessProfileViewModelProvider.notifier);
    final business = ref.watch(businessProfileViewModelProvider);

    final String businessStatus =
        business?.status.toString().split('.').last ?? '';

    if (businessProfileViewModel.isOwner) {
      statusTranslations = {
        ...statusTranslations,
        'rejected': 'Rejeitado',
        'suspended': 'Suspenso',
        'deleted': 'Deletado',
        'pending': 'Pendente',
      };
    }

    if (!businessProfileViewModel.isOwner &&
        businessStatus != 'open' &&
        businessStatus != 'closed') {
      return const SizedBox.shrink();
    }

    final String businessStatusTranslated =
        statusTranslations[businessStatus] ?? '';

    final Color businessStatusColor =
        businessProfileViewModel.getBusinessStatusColor();

    return InkWell(
      onTap: () => businessProfileViewModel.isOwner
          ? showDialog(
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
                  onChanged: (value) async {
                    await ref
                        .read(businessProfileViewModelProvider.notifier)
                        .changeBusinessStatus(status: value!)
                        .then(
                          (value) => Navigator.of(context).pop(),
                        );
                  },
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('Fechar'),
                  ),
                ],
              ),
            )
          : null,
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
    );
  }
}
