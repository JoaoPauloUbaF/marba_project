import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:project_marba/src/features/feed/application/feed_screen_controller/feed_offers_type_filter_provider.dart';
import 'package:project_marba/src/features/offers_management/presentation/widgets/offer_card_widget.dart';
import 'package:project_marba/src/shared/models/offer/offer_model.dart';

class OfferListWidget extends ConsumerStatefulWidget {
  final dynamic offerProviderNotifier;

  final AsyncValue<List<OfferModel>> offerProvider;

  const OfferListWidget(
      {super.key,
      required this.offerProviderNotifier,
      required this.offerProvider});

  static const _pageSize = 10;

  @override
  ConsumerState<OfferListWidget> createState() => _OfferListWidgetState();
}

class _OfferListWidgetState extends ConsumerState<OfferListWidget> {
  final PagingController<int, OfferModel> _pagingController =
      PagingController(firstPageKey: 0);

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  Future<void> _fetchPage(int pageKey) async {
    await Future.delayed(const Duration(seconds: 1));
    try {
      List<OfferModel> newItems =
          await widget.offerProviderNotifier.fetchNewOffers(
        lastOffer: _pagingController.itemList?.last,
      );
      final offerTypeFilter = ref.read(feedOffersTypeFilterProvider);

      if (offerTypeFilter != null) {
        newItems = newItems
            .where((element) => element.offerType == offerTypeFilter)
            .toList();
      }

      final isLastPage = newItems.length < OfferListWidget._pageSize;
      if (isLastPage) {
        _pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + newItems.length;
        _pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  @override
  Widget build(BuildContext context) {
    final offersList = widget.offerProvider;
    offersList.whenData((offers) {
      _pagingController.refresh();
    });
    final _ = ref.watch(feedOffersTypeFilterProvider);

    return RefreshIndicator(
      onRefresh: () => Future.sync(
        () => _pagingController.refresh(),
      ),
      child: PagedMasonryGridView.count(
        shrinkWrap: true,
        pagingController: _pagingController,
        builderDelegate: PagedChildBuilderDelegate<OfferModel>(
          animateTransitions: true,
          transitionDuration: const Duration(milliseconds: 1),
          itemBuilder: (context, item, index) => OfferCardWidget(
            offer: item,
          ),
        ),
        crossAxisCount: 2,
        physics: const BouncingScrollPhysics(),
      ),
    );
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }
}
