import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../application/business_profile_view_model/business_profile_screen_controller.dart';

class BusinessDeliveryInfoWidget extends ConsumerWidget {
  const BusinessDeliveryInfoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(businessProfileViewModelProvider.notifier);
    final deliveryTimeStr = viewModel.getDeliveryTimeStr();
    final deliveryCostStr = viewModel.getDeliveryCostStr();
    final minimumOrderValue = viewModel.getMinimumOrderValueStr();

    return Expanded(
      child: Card(
        color: Theme.of(context).colorScheme.onInverseSurface,
        child: SizedBox(
          height: 45,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.timer,
                      size: 16, color: Theme.of(context).colorScheme.tertiary),
                  const Gap(4),
                  Text(
                    deliveryTimeStr,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                  ),
                  const Gap(8),
                  Icon(
                    Icons.delivery_dining,
                    size: 16,
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
                  const Gap(4),
                  Text(
                    deliveryCostStr,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                  ),
                ],
              ),
              const Gap(4),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Pedido mínimo',
                      style: Theme.of(context).textTheme.bodySmall),
                  const Gap(8),
                  Text(
                    minimumOrderValue,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
