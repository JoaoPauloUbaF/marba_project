import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:project_marba/src/features/my_business/application/business_profile_screen_controller/business_profile_screen_controller.dart';
import 'package:project_marba/src/utils/registration_utils.dart';

import '../../../../shared/models/offer/offer_model.dart';

class OfferDetailsScreen extends ConsumerStatefulWidget {
  const OfferDetailsScreen({super.key});

  @override
  ConsumerState<OfferDetailsScreen> createState() => OfferDetailsScreenState();
}

class OfferDetailsScreenState extends ConsumerState<OfferDetailsScreen> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    final json = {
      "id": "196d5350-9db4-4548-831d-1e252754b479",
      "businessId": "d0748da4-9cc6-46f1-8749-4413f78f1241",
      "category": ["ServiceCategory.home"],
      "createdAt": "2024-03-08T07:01:22.560628",
      "updatedAt": "2024-03-08T07:01:22.560629",
      "status": "onDemand",
      "type": "service",
      "service": {
        "title": "Jardineiro bolado meu irmao",
        "description":
            "Servicos de jardinagem profissa pode confiar, Servicos de jardinagem profissa pode confiar, Servicos de jardinagem profissa pode confiar",
        "price": 200.0,
        "imageUrl":
            "https://firebasestorage.googleapis.com/v0/b/marba-project.appspot.com/o/offer_images%2Foffer_196d5350-9db4-4548-831d-1e252754b479.jpg?alt=media&token=9650053e-67d7-4177-ad98-2f598d034312",
        "status": "OfferStatus.onDemand"
      }
    };

    final offer = OfferModel.fromJson(json);
    final business = ref.watch(businessProfileScreenControllerProvider);

    final items = [
      offer.imageUrl,
      offer.imageUrl,
      offer.imageUrl,
      offer.imageUrl,
      offer.imageUrl,
    ];

    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          forceMaterialTransparency: true,
        ),
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverToBoxAdapter(
                child: Stack(
                  children: [
                    CarouselSlider(
                      carouselController: _controller,
                      options: CarouselOptions(
                        height: MediaQuery.of(context).size.height * 0.4,
                        viewportFraction: 1,
                        enlargeCenterPage: false,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _current = index;
                          });
                        },
                      ),
                      items: items.map((i) {
                        return SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Image.network(
                            i,
                            fit: BoxFit.cover,
                            loadingBuilder: (context, child, loadingProgress) =>
                                loadingProgress == null
                                    ? child
                                    : const CircularProgressIndicator(),
                          ),
                        );
                      }).toList(),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: items.asMap().entries.map((entry) {
                          return GestureDetector(
                            onTap: () => _controller.animateToPage(entry.key),
                            child: Container(
                              width: 12.0,
                              height: 12.0,
                              margin: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 4.0),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: (Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? Colors.white
                                          : Colors.black)
                                      .withOpacity(
                                          _current == entry.key ? 0.9 : 0.4)),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  color: Theme.of(context).colorScheme.secondaryContainer,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              offer.title,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            const Spacer(),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              child: TopTenBadgeWidget(),
                            ),
                          ],
                        ),
                        OfferPriceWidget(offer: offer),
                        Text(
                          offer.description,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        const SizedBox(height: 8),
                        const Row(
                          children: [
                            OfferRatingWidget(),
                            Spacer(),
                            OfferActionsWidget(),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(height: 8),
              ),
            ];
          },
          body: const Placeholder(),
        ));
  }
}

class TopTenBadgeWidget extends StatelessWidget {
  final double sizeMultiplier;

  const TopTenBadgeWidget({
    super.key,
    this.sizeMultiplier = 1.0,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -0.2,
      child: SizedBox(
        width: 70 * sizeMultiplier,
        child: Stack(alignment: Alignment.center, children: [
          Container(
            width: 54 * sizeMultiplier,
            height: 54 * sizeMultiplier,
            decoration: BoxDecoration(
              border: Border.all(
                width: 1 * sizeMultiplier,
              ),
              shape: BoxShape.circle,
              color: Theme.of(context).colorScheme.scrim,
            ),
          ),
          Container(
            width: 45 * sizeMultiplier,
            height: 45 * sizeMultiplier,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(22.5 * sizeMultiplier),
            ),
          ),
          Container(
            width: 42 * sizeMultiplier,
            height: 42 * sizeMultiplier,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(21 * sizeMultiplier),
              border: Border.all(
                width: 1 * sizeMultiplier,
              ),
            ),
          ),
          Container(
            width: 25 * sizeMultiplier,
            height: 25 * sizeMultiplier,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.5 * sizeMultiplier),
              border: Border.all(
                width: 1 * sizeMultiplier,
              ),
            ),
          ),
          Positioned(
              top: 6 * sizeMultiplier,
              child: Row(
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.black,
                    size: 10 * sizeMultiplier,
                  ),
                ],
              )),
          Positioned(
              top: 36 * sizeMultiplier,
              child: Row(
                children: [
                  for (var i = 0; i < 2; i++)
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 4.0 * sizeMultiplier),
                      child: Icon(
                        Icons.star,
                        color: Colors.black,
                        size: 8 * sizeMultiplier,
                      ),
                    ),
                ],
              )),
          Positioned(
              top: 38 * sizeMultiplier,
              child: Row(
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.black,
                    size: 10 * sizeMultiplier,
                  ),
                ],
              )),
          Positioned(
              top: 9 * sizeMultiplier,
              child: Row(
                children: [
                  for (var i = 0; i < 2; i++)
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 4.0 * sizeMultiplier),
                      child: Icon(
                        Icons.star,
                        color: Colors.black,
                        size: 8 * sizeMultiplier,
                      ),
                    ),
                ],
              )),
          Container(
            width: 50 * sizeMultiplier,
            height: 22 * sizeMultiplier,
            color: Colors.white,
          ),
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.errorContainer,
            ),
            height: 20 * sizeMultiplier,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  Icons.star,
                  color: Colors.white,
                  size: 8 * sizeMultiplier,
                ),
                Text(
                  "TOP 10",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                      ),
                ),
                Icon(
                  Icons.star,
                  color: Colors.white,
                  size: 8 * sizeMultiplier,
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

class OfferRatingWidget extends StatelessWidget {
  const OfferRatingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (var i = 0; i < 5; i++)
          Icon(
            Icons.star_outline,
            color: Theme.of(context).colorScheme.error,
            size: 20,
          ),
        const SizedBox(width: 8),
        Text(
          "0.0",
          style: Theme.of(context).textTheme.bodySmall,
        ),
        SizedBox(
          height: 16,
          child: VerticalDivider(
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
        Text(
          "444 avaliações",
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
}

class OfferActionsWidget extends StatelessWidget {
  const OfferActionsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          visualDensity: VisualDensity.compact,
          icon: Icon(
            Icons.favorite_outline,
            color: Theme.of(context).colorScheme.error,
            size: 20,
          ),
          onPressed: () {},
        ),
        IconButton(
          visualDensity: VisualDensity.compact,
          icon: Icon(
            Icons.share_outlined,
            color: Theme.of(context).colorScheme.error,
            size: 20,
          ),
          onPressed: () {},
        ),
        IconButton(
          visualDensity: VisualDensity.compact,
          icon: Icon(
            Icons.chat_outlined,
            color: Theme.of(context).colorScheme.error,
            size: 20,
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}

class OfferPriceWidget extends StatelessWidget {
  const OfferPriceWidget({
    super.key,
    required this.offer,
  });

  final OfferModel offer;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Text(
            RegistrationUtils().formatAsCurrency(offer.price),
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          Text(
            " /h",
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(
            width: 8,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.tertiaryContainer,
              borderRadius: BorderRadius.circular(2),
            ),
            child: Text(
              "20% OFF",
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
        ],
      ),
    );
  }
}
