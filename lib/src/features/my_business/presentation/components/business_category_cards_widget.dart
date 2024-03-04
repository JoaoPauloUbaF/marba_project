import 'package:flutter/material.dart';
import '../../../../shared/models/business/business.dart';

class BusinessCategoryCards extends StatefulWidget {
  final Set<BusinessCategory> selectedCategories;
  final ValueChanged<Set<BusinessCategory>> onChanged;

  BusinessCategoryCards(
      {required this.selectedCategories, required this.onChanged});

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
        return GestureDetector(
          onTap: () {
            setState(() {
              if (isSelected) {
                widget.selectedCategories.remove(category);
              } else {
                widget.selectedCategories.add(category);
              }
              widget.onChanged(widget.selectedCategories);
            });
          },
          child: SizedBox(
            width: MediaQuery.of(context).size.width / 3,
            height: MediaQuery.of(context).size.height / 10,
            child: Card(
              color:
                  isSelected ? const Color.fromARGB(255, 65, 107, 142) : null,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  translatedCategory,
                  style: const TextStyle(fontSize: 12),
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
