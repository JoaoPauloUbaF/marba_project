import 'package:flutter/material.dart';
import '../../../../shared/models/business/business.dart';

class BusinessCategoryCards extends StatefulWidget {
  late Set<BusinessCategory> selectedCategories;

  BusinessCategoryCards({required this.selectedCategories});

  @override
  _BusinessCategoryCardsState createState() => _BusinessCategoryCardsState();
}

class _BusinessCategoryCardsState extends State<BusinessCategoryCards> {
  // Mapa de traduções
  Map<String, String> translations = {
    'aesthetics': 'Estética',
    'entertainment': 'Entretenimento',
    'cooking': 'Culinária',
    'transport': 'Transporte',
    'food': 'Alimentos',
    'clothing': 'Vestuário',
    'electronics': 'Eletrônicos',
    'services': 'Serviços',
  };

  // Função para capitalizar a primeira letra
  String capitalize(String s) => s[0].toUpperCase() + s.substring(1);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.0, // gap between adjacent chips
      runSpacing: 4.0, // gap between lines
      children: BusinessCategory.values.map((category) {
        bool isSelected = widget.selectedCategories.contains(category);
        String categoryName = category.toString().split('.').last;
        // Traduzir e capitalizar a categoria
        String translatedCategory = translations[categoryName] ?? categoryName;
        translatedCategory = capitalize(translatedCategory);
        return GestureDetector(
          onTap: () {
            setState(() {
              if (isSelected) {
                widget.selectedCategories.remove(category);
              } else {
                widget.selectedCategories.add(category);
              }
            });
          },
          child: Card(
            color: isSelected ? Colors.blue : null,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                translatedCategory,
                style: const TextStyle(fontSize: 12),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
