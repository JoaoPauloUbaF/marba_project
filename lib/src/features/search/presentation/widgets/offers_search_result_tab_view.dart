import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:project_marba/src/features/offers_management/presentation/widgets/offer_card/offer_card_widget.dart';
import 'package:project_marba/util.dart';

import '../../application/query_offers_result_provider/query_offers_result_provider.dart';

class OffersSearchResultTabView extends ConsumerStatefulWidget {
  const OffersSearchResultTabView({
    super.key,
  });

  @override
  ConsumerState<OffersSearchResultTabView> createState() =>
      _OffersSearchResultTabViewState();
}

class _OffersSearchResultTabViewState
    extends ConsumerState<OffersSearchResultTabView> {
  late ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final queryOffers = ref.watch(queryOffersResultProvider);
    return queryOffers.when(
      data: (offers) {
        if (offers.isEmpty) {
          return Center(
            child: Text('${getAppLocalizations(context).no_offer_found}!'),
          );
        }
        return MasonryGridView.builder(
          controller: _scrollController,
          itemCount: offers.length,
          gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemBuilder: (BuildContext context, int index) {
            return OfferCardWidget(offer: offers[index]);
          },
        );
      },
      loading: () {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
      error: (error, stackTrace) {
        return Center(
          child: Text('Error: $error'),
        );
      },
    );
  }
}
