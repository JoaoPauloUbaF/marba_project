import 'package:flutter/material.dart';
import '../../../../shared/models/business/enums.dart';

class BusinessCategoryChipsWidget extends StatefulWidget {
  final Set<BusinessCategory> selectedCategories;
  final ValueChanged<Set<BusinessCategory>> onChanged;

  const BusinessCategoryChipsWidget(
      {super.key, required this.selectedCategories, required this.onChanged});

  @override
  BusinessCategoryChipsWidgetState createState() =>
      BusinessCategoryChipsWidgetState();
}

class BusinessCategoryChipsWidgetState
    extends State<BusinessCategoryChipsWidget> {
  // Mapa de traduções
  Map<BusinessCategory, String> translations = businessCategoryTranslations;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Serviços",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 4,
          children: BusinessCategory.values
              .where((category) => category.toString().contains('Services'))
              .map(
            (category) {
              bool isSelected = widget.selectedCategories.contains(category);
              String categoryName = category.toString().split('.').last;
              // Traduzir e capitalizar a categoria
              String translatedCategory =
                  translations[category] ?? categoryName;
              return ChoiceChip(
                labelPadding: EdgeInsets.zero,
                label: Text(
                  translatedCategory,
                  style: const TextStyle(fontSize: 10),
                ),
                selected: isSelected,
                onSelected: (bool selected) {
                  setState(
                    () {
                      if (selected) {
                        widget.selectedCategories.add(category);
                      } else {
                        widget.selectedCategories.remove(category);
                      }
                      widget.onChanged(widget.selectedCategories);
                    },
                  );
                },
                selectedColor: Theme.of(context).colorScheme.tertiaryContainer,
              );
            },
          ).toList(),
        ),
        const SizedBox(height: 8),
        Text(
          "Produtos",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 4,
          children: BusinessCategory.values
              .where((category) => !category.toString().contains('Services'))
              .map(
            (category) {
              bool isSelected = widget.selectedCategories.contains(category);
              String categoryName = category.toString().split('.').last;
              // Traduzir e capitalizar a categoria
              String translatedCategory =
                  translations[category] ?? categoryName;
              return ChoiceChip(
                labelPadding: EdgeInsets.zero,
                label: Text(
                  translatedCategory,
                  style: const TextStyle(fontSize: 10),
                ),
                selected: isSelected,
                onSelected: (bool selected) {
                  setState(
                    () {
                      if (selected) {
                        widget.selectedCategories.add(category);
                      } else {
                        widget.selectedCategories.remove(category);
                      }
                      widget.onChanged(widget.selectedCategories);
                    },
                  );
                },
                selectedColor: Theme.of(context).colorScheme.onPrimary,
              );
            },
          ).toList(),
        ),
      ],
    );
  }
}
