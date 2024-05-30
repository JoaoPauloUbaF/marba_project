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
      child: Tab(
          height: 40,
          iconMargin: EdgeInsets.zero,
          icon: Icon(
            icon,
            color: isSelected
                ? Theme.of(context).colorScheme.secondary
                : Theme.of(context).colorScheme.secondary.withAlpha(100),
          ),
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: isSelected
                      ? Theme.of(context).colorScheme.secondary
                      : Theme.of(context).colorScheme.secondary.withAlpha(100),
                ),
          )),
    );
  }
}
