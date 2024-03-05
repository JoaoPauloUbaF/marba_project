import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:project_marba/src/features/offers_management/data/business_offers_provider.dart';

class BusinessOfferListWidget extends ConsumerWidget {
  const BusinessOfferListWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final offerList = ref.watch(businessOffersProvider);
    return offerList.when(
      data: (offers) {
        return GridView.builder(
          itemCount: offers.length,
          itemBuilder: (context, index) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: MediaQuery.of(context).size.height * 0.15,
                      child: Image.network(offers[index].imageUrl,
                          fit: BoxFit.fill, loadingBuilder:
                              (BuildContext context, Widget child,
                                  ImageChunkEvent? loadingProgress) {
                        if (loadingProgress == null) {
                          return child;
                        }
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }),
                    ),
                    Text(offers[index].title),
                    Text(offers[index].description),
                  ],
                )
              ],
            );
          },
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 4.0,
            mainAxisSpacing: 4.0,
          ),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) => Center(child: Text('Error: $error')),
    );
  }
}
