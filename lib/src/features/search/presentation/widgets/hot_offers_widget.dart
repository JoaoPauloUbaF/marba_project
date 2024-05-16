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
                  color: Theme.of(context).colorScheme.tertiary,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Center(
                    child: Stack(
                      children: [
                        Image.network(
                          offer.getImageUrl,
                          fit: BoxFit.fill,
                          width: MediaQuery.of(context).size.width,
                          loadingBuilder: (context, child, loadingProgress) =>
                              loadingProgress == null
                                  ? child
                                  : const Center(
                                      child: CircularProgressIndicator(),
                                    ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              color: Theme.of(context)
                                  .colorScheme
                                  .surface
                                  .withOpacity(0.7),
                              padding: const EdgeInsets.all(8),
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    offer.getTitle,
                                    overflow: TextOverflow.ellipsis,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall
                                        ?.copyWith(
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                  Text(
                                    RegistrationUtils()
                                        .doubleAsCurrency(offer.getPrice),
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge
                                        ?.copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                            fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                        // ListTile(
                        //   style: ListTileStyle.drawer,
                        //   title: Text(
                        //     offer.title,
                        //     overflow: TextOverflow.ellipsis,
                        //     style: Theme.of(context).textTheme.headlineSmall,
                        //   ),
                        //   subtitle: Text(
                        //     RegistrationUtils().doubleAsCurrency(offer.price),
                        //     style: Theme.of(context)
                        //         .textTheme
                        //         .titleLarge
                        //         ?.copyWith(
                        //             color:
                        //                 Theme.of(context).colorScheme.primary),
                        //   ),
                        // ),
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
