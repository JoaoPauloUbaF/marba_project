import 'package:flutter/material.dart';
import 'package:project_marba/src/features/top_ten/presentation/widgets/top_ten_badge_widget.dart';
import 'package:project_marba/src/shared/models/offer/offer_model.dart';

class OfferHeaderWidget extends StatelessWidget {
  const OfferHeaderWidget({
    super.key,
    required this.offer,
  });

  final OfferModel offer;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            offer.title,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: [
              TopTenBadgeWidget(),
            ],
          ),
        ),
      ],
    );
  }
}
