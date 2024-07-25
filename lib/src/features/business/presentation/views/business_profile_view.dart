import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:project_marba/src/features/business/application/business_profile_view_model/business_profile_screen_controller.dart';
import 'package:project_marba/src/features/business/presentation/widgets/business_profile/mobile_business_profile_view_widget.dart';
import 'package:project_marba/src/features/business/presentation/widgets/business_profile/wide_screen_business_profile_view_widget.dart';
import 'package:project_marba/src/features/offers_management/application/offer_list/business_offers_provider.dart';

import '../../../../core/utils/view_utils.dart';

class BusinessProfileView extends ConsumerWidget {
  const BusinessProfileView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final business = ref.watch(businessProfileViewModelProvider);
    final businessOffers = ref.watch(businessOffersProvider);
    final businessOffersNotifier = ref.read(businessOffersProvider.notifier);

    return business == null
        ? Center(
            child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Ops! Parece que algo deu errado.'),
                const Gap(16),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Voltar'),
                )
              ],
            ),
          ))
        : !isWideScreen(context)
            ? MobileBusinessProfileViewWidget(
                businessOffers: businessOffers,
                businessOffersNotifier: businessOffersNotifier,
                business: business)
            : WideScreenBusinessProfileViewWidget(
                businessOffers: businessOffers,
                businessOffersNotifier: businessOffersNotifier,
                business: business);
  }
}
