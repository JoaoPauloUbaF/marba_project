import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:project_marba/src/core/utils/view_utils.dart';
import 'package:project_marba/src/features/search/application/search_view_model/search_view_model.dart';

import '../../../search/presentation/widgets/search_body_widget.dart';

class PopularCategories extends StatefulWidget {
  const PopularCategories({super.key});

  @override
  PopularCategoriesState createState() => PopularCategoriesState();
}

class PopularCategoriesState extends State<PopularCategories> {
  final List<Map<String, dynamic>> _categories = [
    {'icon': Icons.kitchen, 'label': 'Eletros'},
    {'icon': Icons.brush, 'label': 'Artesanato'},
    {'icon': Icons.directions_car, 'label': 'Auto'},
    {'icon': Icons.spa, 'label': 'Beleza'},
    {'icon': Icons.book, 'label': 'Papelaria'},
    {'icon': Icons.checkroom, 'label': 'Vestuário'},
    {'icon': Icons.devices, 'label': 'Eletrônicos'},
    {'icon': Icons.health_and_safety, 'label': 'Saúde'},
    {'icon': Icons.home, 'label': 'Casa'},
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        scrollDirection: Axis.horizontal,
        itemCount: _categories.length,
        itemBuilder: (context, index) {
          final category = _categories[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Consumer(
              builder: (_, WidgetRef ref, __) {
                return InkWell(
                  onTap: () async {
                    showLoader(context);
                    await ref
                        .read(searchViewModelProvider.notifier)
                        .onSearchSubmit(query: category['label'])
                        .then((_) {
                      hideLoader(context);
                      Navigator.of(context).push(
                        MaterialPageRoute<void>(
                          builder: (context) {
                            return Scaffold(
                                appBar: AppBar(
                                  title: Text(category['label']),
                                ),
                                body: const SearchBodyWidget(
                                  searchViewState: SearchViewState.result,
                                ));
                          },
                        ),
                      );
                    });
                  },
                  child: Container(
                    width: 80,
                    margin: const EdgeInsets.symmetric(horizontal: 2.0),
                    padding: const EdgeInsets.all(2.0),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.tertiary,
                      borderRadius: BorderRadius.circular(12.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          category['icon'],
                          size: 40,
                          color: Theme.of(context).colorScheme.onTertiary,
                        ),
                        const Gap(8),
                        Text(
                          category['label'],
                          overflow: TextOverflow.fade,
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(
                                color: Theme.of(context).colorScheme.onTertiary,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        },
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          crossAxisSpacing: 4,
          mainAxisSpacing: 4,
        ),
      ),
    );
  }
}
