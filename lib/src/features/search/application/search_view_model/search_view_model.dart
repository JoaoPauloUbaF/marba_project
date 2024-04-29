import 'package:project_marba/src/features/business/data/business_profile_data/business_profile_provider.dart';
import 'package:project_marba/src/features/offers_management/data/offer_data_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/models/business/business.dart';
import '../../../../core/models/offer/offer_model.dart';
import '../hot_business_provider/hot_businesses_provider.dart';
import '../hot_offers_provider/hot_offers_provider.dart';
part 'search_view_model.g.dart';

@riverpod
class SearchViewModel extends _$SearchViewModel {
  @override
  SearchViewState build() {
    setUpView();
    return SearchViewState.loading;
  }

  Future<void> setUpView() async {
    await Future.delayed(const Duration(seconds: 2)); // Simulate loading

    await ref.watch(hotOffersProvider.notifier).fetchHotOffers();
    await ref.watch(hotBusinessesProvider.notifier).fetchHotBusinesses();
    state = SearchViewState.display;
  }

  Future<List<OfferModel>> fetchHotOffers() async {
    final offers =
        await ref.read(offersDataRepositoryProvider).getOffers().take(5).first;
    if (offers.isEmpty) {
      return [];
    }
    return offers;
  }

  Future<List<Business>> fetchHotBusinesses() async {
    final businesses = await ref
        .read(businessProfileDataProvider)
        .getBusinessesAt(city: 'Lavras');
    if (businesses == null) {
      return [];
    }
    return businesses.take(5).toList();
  }

  void onSearchTap() {
    state = SearchViewState.searching;
  }

  void onSearchSubmit({required String? query}) {
    if (query == null || query.isEmpty) {
      return;
    }
    state = SearchViewState.result;
  }

  void onSearchCancel() {
    state = SearchViewState.display;
  }
}

enum SearchViewState { loading, display, searching, result, error }
