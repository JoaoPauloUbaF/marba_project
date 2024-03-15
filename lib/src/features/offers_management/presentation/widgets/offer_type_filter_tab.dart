import 'package:flutter/material.dart';

class OfferTypeFilterTab extends StatelessWidget {
  final VoidCallback onTap;
  final IconData icon;
  final String text;
  final bool isSelected;

  const OfferTypeFilterTab({
    super.key,
    required this.onTap,
    required this.icon,
    required this.text,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: SizedBox(
        width: 70,
        height: 70,
        child: Tab(
          icon: Icon(
            icon,
            color: isSelected
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.primary.withAlpha(100),
          ),
          text: text,
        ),
      ),
    );
  }
}
