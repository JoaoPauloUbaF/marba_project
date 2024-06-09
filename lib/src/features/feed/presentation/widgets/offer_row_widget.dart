import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:project_marba/src/features/offers_management/presentation/widgets/offer_card/offer_card_widget.dart';
import 'package:project_marba/src/features/search/application/hot_offers_provider/hot_offers_provider.dart';

class OfferRowWidget extends ConsumerWidget {
  final String title;
  final Alignment alignment;

  const OfferRowWidget(
      {super.key, required this.title, this.alignment = Alignment.centerLeft});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final offers = ref.watch(hotOffersProvider);
    return offers.when(
      data: (offers) {
        return Column(
          children: [
            Align(
              alignment: alignment,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: SizedBox(
                height: 175,
                child: GridView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    if (index == 9) {
                      return GestureDetector(
                        onTap: () {},
                        child: SizedBox(
                          width: 160,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.arrow_forward_ios_sharp,
                                size: 40,
                                color: Theme.of(context).primaryColor,
                              ),
                              Text(
                                'Ver mais',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                    final offer = offers[0];
                    return OfferCardWidget(offer: offer, size: 0.6);
                  },
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    crossAxisSpacing: 8,
                    mainAxisExtent: 150,
                  ),
                ),
              ),
            ),
          ],
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, _) => Center(child: Text('Erro: $error')),
    );
  }
}
