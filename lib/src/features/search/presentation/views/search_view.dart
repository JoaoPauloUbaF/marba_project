import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:project_marba/src/core/models/business/business.dart';
import 'package:project_marba/src/core/models/offer/offer_model.dart';
import 'package:project_marba/src/core/utils/registration_utils.dart';
import 'package:project_marba/src/core/widgets/medium_vertical_space_widget.dart';

import '../../application/search_view_model.dart';

class SearchView extends ConsumerWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchViewModel = ref.watch(searchViewModelProvider.notifier);
    final hotOffers = searchViewModel.getHotOffers();
    final hotBusinesses = searchViewModel.getHotBusinesses();
    return Padding(
      padding: const EdgeInsets.only(bottom: kBottomNavigationBarHeight),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                "Do que você precisa?",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              // Add your search field here
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: "Eletricista, Barbeiro, Martelo, Vaso...",
                    suffixIcon: IconButton(
                        onPressed: () {}, icon: const Icon(Icons.search)),
                  ),
                ),
              ),
              HotBusinessesWidget(hotBusinesses: hotBusinesses),
              HotOffersWidget(hotOffers: hotOffers),
              const VerticalSpaceMediumWidget(),
              const VerticalSpaceMediumWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class HotBusinessesWidget extends StatelessWidget {
  final Future<List<Business>> hotBusinesses;

  const HotBusinessesWidget({
    super.key,
    required this.hotBusinesses,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Business>>(
      future: hotBusinesses, // replace with your function to fetch categories
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return CarouselSlider(
            items: snapshot.data!.map((business) {
              return Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Center(
                  child: Column(
                    children: [
                      Expanded(
                        child: Image.network(
                          business.imageUrl ?? '',
                          fit: BoxFit.cover,
                          width: MediaQuery.of(context).size.width,
                        ),
                      ),
                      ListTile(
                        style: ListTileStyle.drawer,
                        title: Text(
                          business.name,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        subtitle: Text(
                          business.categories.first.toString().split('.').last,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
            options: CarouselOptions(
              autoPlay: true,
              autoPlayAnimationDuration: const Duration(seconds: 2),
              autoPlayInterval: const Duration(seconds: 2),
            ),
          );
        }
      },
    );
  }
}

class HotOffersWidget extends StatelessWidget {
  const HotOffersWidget({
    super.key,
    required this.hotOffers,
  });

  final Future<List<OfferModel>> hotOffers;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<OfferModel>>(
      future: hotOffers, // replace with your function to fetch hot offers
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return CarouselSlider(
            items: snapshot.data!
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
                              ),
                            ),
                            ListTile(
                              style: ListTileStyle.drawer,
                              title: Text(
                                offer.title,
                                overflow: TextOverflow.ellipsis,
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                              ),
                              subtitle: Text(
                                RegistrationUtils()
                                    .doubleAsCurrency(offer.price),
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge
                                    ?.copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary),
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
          );
        }
      },
    );
  }
}
