import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:project_marba/src/core/models/offer/offer_model.dart';
import 'package:project_marba/src/core/utils/registration_utils.dart';
import 'package:project_marba/src/features/darkmode/application/theme_provider.dart';

class OfferPriceWidget extends ConsumerWidget {
  const OfferPriceWidget({
    super.key,
    required this.offer,
    required this.fontSize,
  });

  final OfferModel offer;
  final double fontSize;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
      child: Row(
        children: [
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Visibility(
                  visible: offer.discount != null && offer.discount != 0.0,
                  child: Text(
                    RegistrationUtils().doubleAsCurrency(offer.getPrice),
                    style: textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.errorContainer,
                      decoration: TextDecoration.lineThrough,
                      fontSize: 10,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  RegistrationUtils().doubleAsCurrency(offer.getPrice -
                      ((offer.discount ?? 0) / 100 * offer.getPrice)),
                  style: textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w800,
                    color: Theme.of(context).colorScheme.onSecondary,
                    fontSize: fontSize,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Visibility(
            visible: offer.discount != null && offer.discount != 0.0,
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Text(
                " -${offer.discountValue.toStringAsFixed(0)}% ",
                style: textTheme.labelSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: ref.watch(darkModeProvider) == ThemeMode.light
                        ? Colors.lightGreen
                        : Colors.green.shade900),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
