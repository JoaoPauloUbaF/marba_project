import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_marba/src/features/offers_management/application/offer_details/offer_details_view_model.dart';

class OfferActionsWidget extends ConsumerStatefulWidget {
  //TODO: share feature
  const OfferActionsWidget({
    super.key,
  });

  @override
  ConsumerState<OfferActionsWidget> createState() => _OfferActionsWidgetState();
}

class _OfferActionsWidgetState extends ConsumerState<OfferActionsWidget> {
  @override
  Widget build(BuildContext context) {
    final offersDetailsViewModel =
        ref.watch(offerDetailsViewModelProvider.notifier);

    return Row(
      children: [
        FutureBuilder(
          builder: (context, snapshot) {
            return IconButton(
              visualDensity: VisualDensity.compact,
              icon: snapshot.data == true
                  ? Icon(
                      Icons.favorite,
                      color: Theme.of(context).colorScheme.error,
                      size: 20,
                    )
                  : Icon(
                      Icons.favorite_outline,
                      color: Theme.of(context).colorScheme.error,
                      size: 20,
                    ),
              onPressed: () async {
                await offersDetailsViewModel.onFavoriteOfferPressed();
                setState(() {});
              },
            );
          },
          future: offersDetailsViewModel.isFavoriteOffer(),
        ),
        IconButton(
          visualDensity: VisualDensity.compact,
          icon: Icon(
            Icons.share_outlined,
            color: Theme.of(context).colorScheme.onPrimaryContainer,
            size: 20,
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}
