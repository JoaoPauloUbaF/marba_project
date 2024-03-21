import 'package:flutter/material.dart';
import '../../../../shared/models/business/enums.dart';

class BusinessCategoryCards extends StatefulWidget {
  final Set<BusinessCategory> selectedCategories;
  final ValueChanged<Set<BusinessCategory>> onChanged;

  const BusinessCategoryCards(
      {super.key, required this.selectedCategories, required this.onChanged});

  @override
  BusinessCategoryCardsState createState() => BusinessCategoryCardsState();
}

class BusinessCategoryCardsState extends State<BusinessCategoryCards> {
  // Mapa de traduções
  Map<BusinessCategory, String> translations = businessCategoryTranslations;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 4,
      children: BusinessCategory.values.map((category) {
        bool isSelected = widget.selectedCategories.contains(category);
        String categoryName = category.toString().split('.').last;
        // Traduzir e capitalizar a categoria
        String translatedCategory = translations[category] ?? categoryName;
        return ChoiceChip(
          labelPadding: EdgeInsets.zero,
          label: Text(
            translatedCategory,
            style: const TextStyle(fontSize: 10),
          ),
          selected: isSelected,
          onSelected: (bool selected) {
            setState(() {
              if (selected) {
                widget.selectedCategories.add(category);
              } else {
                widget.selectedCategories.remove(category);
              }
              widget.onChanged(widget.selectedCategories);
            });
          },
          selectedColor: Theme.of(context).colorScheme.onPrimary,
        );
      }).toList(),
    );
  }
}
