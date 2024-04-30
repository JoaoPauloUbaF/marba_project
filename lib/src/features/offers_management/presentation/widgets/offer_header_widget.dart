import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_marba/src/features/offers_management/application/offer_details/offer_details_view_model.dart';
import 'package:project_marba/src/features/offers_management/data/offer_data_repository_provider.dart';
import 'package:project_marba/src/features/top_ten/presentation/widgets/top_ten_badge_widget.dart';
import 'package:project_marba/src/core/models/offer/offer_model.dart';

class OfferHeaderWidget extends ConsumerStatefulWidget {
  const OfferHeaderWidget({
    super.key,
    required this.offer,
  });

  final OfferModel offer;

  @override
  ConsumerState<OfferHeaderWidget> createState() => _OfferHeaderWidgetState();
}

class _OfferHeaderWidgetState extends ConsumerState<OfferHeaderWidget> {
  bool isEditing = false;
  String newTitle = '';

  @override
  Widget build(BuildContext context) {
    ref.read(offersDataRepositoryProvider);
    final offerDetailsViewModel =
        ref.read(offerDetailsViewModelProvider.notifier);

    return Row(
      children: [
        Expanded(
          child: InkWell(
            onTap: () => setState(
              () {
                offerDetailsViewModel
                    .isOfferOwner(widget.offer.businessId)
                    .then((value) => isEditing = value);
              },
            ),
            child: !isEditing
                ? Text(
                    widget.offer.getTitle,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  )
                : TextFormField(
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 8.0),
                      suffixIcon: InkWell(
                        child: const Icon(Icons.check),
                        onTap: () {
                          setState(() {
                            offerDetailsViewModel.updateOfferTitle(
                              offerId: widget.offer.id,
                              newTitle: newTitle,
                            );
                            isEditing = false;
                          });
                        },
                      ),
                    ),
                    initialValue: widget.offer.getTitle,
                    onChanged: (value) {
                      setState(() {
                        newTitle = value;
                      });
                    },
                  ),
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
