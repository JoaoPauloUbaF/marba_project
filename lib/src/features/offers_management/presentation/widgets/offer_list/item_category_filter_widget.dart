import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_marba/src/core/widgets/modal_center_top_line_widget.dart';
import 'package:project_marba/src/features/offers_management/application/offer_creation/offer_creation_controller.dart';
import 'package:project_marba/src/features/offers_management/application/offer_list/feed_offers_type_filter_provider.dart';
import 'package:project_marba/src/core/models/offer/offer_model.dart';

class ItemCategoryFilterWidget extends ConsumerWidget {
  final dynamic categories;
  final dynamic categoryFilterProvider;
  final dynamic categoryFilterProviderNotifier;

  const ItemCategoryFilterWidget({
    super.key,
    required this.categories,
    required this.categoryFilterProvider,
    required this.categoryFilterProviderNotifier,
  });

  onChipSelected(dynamic category) {
    if (categoryFilterProvider.contains(category)) {
      categoryFilterProviderNotifier.removeCategoryFilter(category);
    } else {
      categoryFilterProviderNotifier.addCategoryFilter(category);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final offerCreationController =
        ref.read(offerCreationControllerProvider.notifier);
    final offerType = ref.read(feedOffersTypeFilterProvider);

    final randomCategories = categoryFilterProviderNotifier.randomCategories;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            for (var category in randomCategories)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: ChoiceChip.elevated(
                  label: Text(
                    offerCreationController.getCategoryTranslation(
                        category, offerType ?? OfferType.product),
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                  selected: categoryFilterProvider.contains(category),
                  onSelected: (value) {
                    onChipSelected(category);
                  },
                ),
              ),
            const SizedBox(width: 8.0),
            ChoiceChip.elevated(
              label: Row(
                children: [
                  Text(
                    'Ver todos',
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                  const SizedBox(width: 4.0),
                  const Icon(Icons.filter_list_sharp, size: 16.0),
                ],
              ),
              selected: false,
              selectedColor: Theme.of(context).colorScheme.onPrimary,
              onSelected: (value) {
                showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return AllFiltersModalWidget(
                        categories: categories,
                        offerCreationController: offerCreationController,
                        offerType: offerType,
                        categoryFilterProvider: categoryFilterProvider,
                        categoryFilterProviderNotifier:
                            categoryFilterProviderNotifier,
                      );
                    });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class AllFiltersModalWidget extends StatefulWidget {
  const AllFiltersModalWidget({
    super.key,
    required this.categories,
    required this.offerCreationController,
    required this.offerType,
    required this.categoryFilterProvider,
    required this.categoryFilterProviderNotifier,
  });

  final List<dynamic> categories;
  final dynamic categoryFilterProvider;
  final OfferType? offerType;
  final OfferCreationController offerCreationController;
  final dynamic categoryFilterProviderNotifier;

  @override
  State<AllFiltersModalWidget> createState() => _AllFiltersModalWidgetState();
}

class _AllFiltersModalWidgetState extends State<AllFiltersModalWidget> {
  final List<dynamic> selectedCategories = [];
  List<dynamic> filteredCategories = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredCategories = widget.categories;
    searchController.addListener(() {
      filterCategories();
    });
  }

  void filterCategories() {
    final query = searchController.text.toLowerCase();
    setState(() {
      filteredCategories = widget.categories
          .where((category) => widget.offerCreationController
              .getCategoryTranslation(
                  category, widget.offerType ?? OfferType.product)
              .toLowerCase()
              .contains(query))
          .toList();
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      width: screenWidth,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const ModalCenterTopLineWidget(),
            const SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                controller: searchController,
                decoration: const InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  labelText: 'Buscar filtro',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            Expanded(
              child: Container(
                width: screenWidth,
                decoration: BoxDecoration(
                  border:
                      Border.all(color: Theme.of(context).colorScheme.primary),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Scrollbar(
                  trackVisibility: true,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Wrap(
                        children: [
                          for (var category in filteredCategories)
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4.0),
                              child: ChoiceChip(
                                label: Text(
                                  widget.offerCreationController
                                      .getCategoryTranslation(
                                          category,
                                          widget.offerType ??
                                              OfferType.product),
                                  style: Theme.of(context).textTheme.labelSmall,
                                ),
                                selected: selectedCategories.contains(category),
                                onSelected: (value) {
                                  setState(() {
                                    if (selectedCategories.contains(category)) {
                                      selectedCategories.remove(category);
                                    } else {
                                      selectedCategories.add(category);
                                    }
                                  });
                                },
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                for (var category in selectedCategories) {
                  if (!widget.categoryFilterProvider.contains(category)) {
                    widget.categoryFilterProviderNotifier
                        .addCategoryFilter(category);
                  }
                }
                Navigator.pop(context);
              },
              child: const Text('Aplicar filtros'),
            ),
            const SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }
}
