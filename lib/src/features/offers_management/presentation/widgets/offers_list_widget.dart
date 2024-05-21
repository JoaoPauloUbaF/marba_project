// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:project_marba/src/features/offers_management/application/offer_list/feed_offers_type_filter_provider.dart';
import 'package:project_marba/src/features/offers_management/application/offer_list/offer_list_general_filter_provider.dart';
import 'package:project_marba/src/features/offers_management/presentation/widgets/offer_card/offer_card_widget.dart';
import 'package:project_marba/src/core/models/offer/offer_model.dart';

import '../../application/offer_list/offer_product_category_filter_provider.dart';
import '../../application/offer_list/offer_service_category_filter_provider.dart';

class OfferListWidget extends ConsumerStatefulWidget {
  final dynamic offerProviderNotifier;

  final AsyncValue<List<OfferModel>> offerProvider;

  const OfferListWidget({
    super.key,
    required this.offerProviderNotifier,
    required this.offerProvider,
  });

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
    await Future.delayed(const Duration(milliseconds: 500));
    try {
      List<OfferModel> newItems =
          await widget.offerProviderNotifier.fetchNewOffers(
        lastOffer: _pagingController.itemList?.last,
      );
      final offerTypeFilter = ref.read(feedOffersTypeFilterProvider);

      if (offerTypeFilter != null) {
        if (offerTypeFilter == OfferType.product) {
          final productCategoryFilter = ref.read(productCategoryFilterProvider);

          if (productCategoryFilter.isNotEmpty) {
            newItems = newItems
                .where((element) => element.offerType == offerTypeFilter)
                .where((element) => productCategoryFilter.any((category) =>
                    element.categories.contains(category.toString())))
                .toList();
          }
        }
        if (offerTypeFilter == OfferType.service) {
          final serviceCategoryFilter = ref.read(serviceCategoryFilterProvider);
          if (serviceCategoryFilter.isNotEmpty) {
            newItems = newItems
                .where((element) => element.offerType == offerTypeFilter)
                .where((element) => serviceCategoryFilter.any((category) =>
                    element.categories.contains(category.toString())))
                .toList();
          }
        }

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
    final _ = ref.watch(offerListFilterProvider);

    return RefreshIndicator(
      onRefresh: () => Future.sync(
        () => _pagingController.refresh(),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: PagedMasonryGridView.count(
          pagingController: _pagingController,
          builderDelegate: PagedChildBuilderDelegate<OfferModel>(
            animateTransitions: true,
            transitionDuration: const Duration(milliseconds: 1),
            newPageProgressIndicatorBuilder: (context) => const Center(
              child: Padding(
                padding: EdgeInsets.all(40.0),
                child: CircularProgressIndicator(),
              ),
            ),
            newPageErrorIndicatorBuilder: (context) => const Center(
              child: Text('Erro ao carregar novas ofertas'),
            ),
            firstPageErrorIndicatorBuilder: (context) => const Center(
              child: Text('Erro ao carregar ofertas'),
            ),
            noItemsFoundIndicatorBuilder: (context) => const Center(
              child: Text('Nenhuma oferta encontrada'),
            ),
            itemBuilder: (context, item, index) => OfferCardWidget(
              offer: item,
            ),
          ),
          crossAxisCount: MediaQuery.sizeOf(context).width > 600 ? 4 : 2,
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }
}
