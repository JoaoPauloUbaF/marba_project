import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:project_marba/src/features/my_business/presentation/components/offers_list_widget.dart';
import 'package:project_marba/src/features/offers_management/data/offer_data_repository_provider.dart';
import 'package:project_marba/src/shared/models/business/business.dart';

class FeedScreen extends ConsumerWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 8,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Container(
                  width: 150,
                  height: 150,
                  color: Colors.red,
                ),
                Container(
                  width: 150,
                  height: 150,
                  color: Colors.blue,
                ),
                Container(
                  width: 150,
                  height: 150,
                  color: Colors.green,
                ),
                Container(
                  width: 150,
                  height: 150,
                  color: Colors.yellow,
                ),
                Container(
                  width: 150,
                  height: 150,
                  color: Colors.orange,
                ),
                Container(
                  width: 150,
                  height: 150,
                  color: Colors.purple,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            'Categorias',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 16,
                mainAxisExtent: MediaQuery.of(context).size.height * 0.075,
              ),
              itemCount: BusinessCategory.values.length,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Theme.of(context).colorScheme.secondaryContainer,
                  ),
                  margin: const EdgeInsets.all(8),
                );
              },
              physics: const NeverScrollableScrollPhysics(),
            ),
          ),
          Text(
            'Promoções',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(
            height: 8,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.red,
                ),
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.blue,
                ),
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.green,
                ),
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.yellow,
                ),
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.orange,
                ),
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.purple,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Tab(
                icon: Icon(Icons.shopping_cart_sharp),
                text: 'Produtos',
              ),
              Tab(
                icon: Icon(Icons.build_sharp),
                text: 'Serviços',
              ),
            ],
          ),
          // Wrap(
          //   spacing: 4.0,
          //   children: [
          //     for (var category in ProductCategory.values)
          //       ChoiceChip(
          //         label: Text(
          //           category.toString().split('.').last,
          //         ),
          //         selected: false,
          //         selectedColor:
          //             Theme.of(context).colorScheme.secondaryContainer,
          //         onSelected: (value) {},
          //       ),
          //   ],
          // ),
          // Wrap(
          //   spacing: 4.0,
          //   children: [
          //     for (var category in ServiceCategory.values)
          //       ChoiceChip(
          //         label: Text(
          //           category.toString().split('.').last,
          //         ),
          //         selected: false,
          //         selectedColor:
          //             Theme.of(context).colorScheme.secondaryContainer,
          //         onSelected: (value) {},
          //       ),
          //   ],
          // ),
          // OfferListWidget(offerProvider: offerRepositoryProviderProvider, offerProviderNotifier: offerRepositoryProviderProvider.notifier),
        ],
      ),
    ));
  }
}
