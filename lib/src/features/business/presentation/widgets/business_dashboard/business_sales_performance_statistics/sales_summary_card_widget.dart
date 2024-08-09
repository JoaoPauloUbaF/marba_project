import 'package:flutter/material.dart';

class SalesSummaryCardWidget extends StatelessWidget {
  const SalesSummaryCardWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.color,
    required this.textColor,
  });

  final String title;
  final String subtitle;
  final Color color;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      child: ListTile(
        title: Text(
          title,
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(color: textColor),
        ),
        subtitle: Text(
          subtitle,
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(color: textColor),
        ),
      ),
    );
  }
}
