import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/utils/registration_utils.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../../application/hot_offers_provider/hot_offers_provider.dart';

class HotOffersWidget extends ConsumerWidget {
  const HotOffersWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hotOffers = ref.watch(hotOffersProvider);
    return hotOffers.when(
      data: (offers) => CarouselSlider(
        items: offers
            .map((offer) => Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Center(
                    child: Column(
                      children: [
                        Expanded(
                          child: Image.network(
                            offer.imageUrl,
                            fit: BoxFit.cover,
                            width: MediaQuery.of(context).size.width,
                            loadingBuilder: (context, child, loadingProgress) =>
                                loadingProgress == null
                                    ? child
                                    : const Center(
                                        child: CircularProgressIndicator(),
                                      ),
                          ),
                        ),
                        ListTile(
                          style: ListTileStyle.drawer,
                          title: Text(
                            offer.title,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          subtitle: Text(
                            RegistrationUtils().doubleAsCurrency(offer.price),
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(
                                    color:
                                        Theme.of(context).colorScheme.primary),
                          ),
                        ),
                      ],
                    ),
                  ),
                ))
            .toList(),
        options: CarouselOptions(
          autoPlay: true,
          autoPlayAnimationDuration: const Duration(seconds: 2),
          autoPlayInterval: const Duration(seconds: 3),
        ),
      ),
      loading: () => const LoadingWidget(),
      error: (error, stackTrace) => Text('Error: $error'),
    );
  }
}
