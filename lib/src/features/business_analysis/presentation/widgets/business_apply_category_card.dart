import 'package:flutter/material.dart';

class BusinessApplyCategoryCard extends StatelessWidget {
  final IconData icon;

  final String title;

  final String subtitle;

  final void Function() onTap;

  const BusinessApplyCategoryCard(
      {super.key,
      required this.icon,
      required this.title,
      required this.subtitle,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        leading:
            Icon(icon, color: Theme.of(context).colorScheme.primary, size: 40),
        title: Text(title, style: Theme.of(context).textTheme.titleMedium),
        subtitle: Text(subtitle),
        onTap: onTap,
      ),
    );
  }
}
