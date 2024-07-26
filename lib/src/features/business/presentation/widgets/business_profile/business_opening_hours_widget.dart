import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../application/business_profile_view_model/business_profile_screen_controller.dart';

class BusinessOpeningHoursWidget extends ConsumerWidget {
  const BusinessOpeningHoursWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(businessProfileViewModelProvider.notifier);

    return InkWell(
      child: Card(
        color: Theme.of(context).colorScheme.onInverseSurface,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              const Gap(8),
              Text('Horários de funcionamento',
                  style: Theme.of(context).textTheme.titleMedium),
              const Spacer(),
              Icon(Icons.schedule,
                  size: 20, color: Theme.of(context).colorScheme.tertiary),
              const Gap(16),
            ],
          ),
        ),
      ),
      onLongPress: () async =>
          await viewModel.showUpdateOpeningHoursDialog(context),
      onTap: () {
        final openingHours = viewModel.getOpeningHours();
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Column(
                  children: [
                    Icon(Icons.schedule,
                        size: 30,
                        color: Theme.of(context).colorScheme.tertiary),
                    const Gap(8),
                    const Text('Horários de funcionamento'),
                  ],
                ),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Builder(builder: (context) {
                      if (openingHours.isEmpty) {
                        return const Text('Não há horários cadastrados');
                      }
                      return Column(
                        children:
                            openingHours.map((item) => Text(item)).toList(),
                      );
                    }),
                  ],
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Fechar'),
                  ),
                ],
              );
            });
      },
    );
  }
}
