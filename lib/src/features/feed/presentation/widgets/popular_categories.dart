import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

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
    {'icon': Icons.more_horiz, 'label': 'Mais'},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceVariant,
      ),
      height: 100,
      child: GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        scrollDirection: Axis.horizontal,
        itemCount: _categories.length,
        itemBuilder: (context, index) {
          final category = _categories[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: InkWell(
              onTap: () {},
              child: Container(
                width: 80,
                margin: const EdgeInsets.symmetric(horizontal: 2.0),
                padding: const EdgeInsets.all(2.0),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.tertiary,
                  borderRadius: BorderRadius.circular(12.0),
                  border: Border.all(
                    color:
                        Theme.of(context).colorScheme.secondary.withAlpha(100),
                  ),
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
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Theme.of(context).colorScheme.onTertiary,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ],
                ),
              ),
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
