import 'package:flutter/material.dart';
import 'package:project_marba/src/core/models/offer/offer_model.dart';

class OfferTitleWidget extends StatelessWidget {
  const OfferTitleWidget({
    super.key,
    required this.offer,
    required this.fontSize,
  });
  final OfferModel offer;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          offer.getTitle,
          style: textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.w800,
            color: Theme.of(context).colorScheme.onSecondary,
            fontSize: fontSize,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis, // Adjust number of lines
        ),
      ),
    );
  }
}
