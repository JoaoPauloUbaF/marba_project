import 'package:project_marba/src/features/search/application/query_business_result_provider/query_business_result_provider.dart';
import 'package:project_marba/src/features/user_profile/application/current_user_profile_provider/current_user_profile_provider.dart';
import 'package:project_marba/src/features/user_profile/data/user_profile_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../hot_business_provider/hot_businesses_provider.dart';
import '../hot_offers_provider/hot_offers_provider.dart';
import '../query_offers_result_provider/query_offers_result_provider.dart';
part 'search_view_model.g.dart';

@riverpod
class SearchViewModel extends _$SearchViewModel {
  String searchText = '';

  @override
  SearchViewState build() {
    setUpView();
    return SearchViewState.loading;
  }

  Future<void> setUpView() async {
    await Future.delayed(const Duration(milliseconds: 1));
    await ref.watch(hotOffersProvider.notifier).fetchHotOffers();
    await ref.watch(hotBusinessesProvider.notifier).fetchHotBusinesses();
    if (state == SearchViewState.loading) {
      state = SearchViewState.display;
    }
  }

  void onSearchTap() {
    state = SearchViewState.searching;
  }

  Future<void> onSearchSubmit({required String? query}) async {
    if (query == null || query.isEmpty) {
      return;
    }
    ref.read(userProfileDataProvider).addQueryToSearchHistory(
        query: query, uid: ref.read(currentUserProvider)?.id ?? '');
    await ref.read(queryOffersResultProvider.notifier).queryOffers(
        queryStr:
            query); //Todo: offers must have an address too, at least the city
    await ref
        .read(queryBusinessResultProvider.notifier)
        .queryBusinessesAt(queryStr: query);
    state = SearchViewState.result;
  }

  void onSearchCancel() {
    state = SearchViewState.display;
    searchText = '';
  }

  Future<List<String>>? getSuggestions() async {
    final userId = ref.read(currentUserProvider)?.id;
    if (userId == null) {
      return [];
    }
    return await ref
        .read(userProfileDataProvider)
        .getSearchHistory(uid: userId);
  }

  String getSearchFieldText() {
    return searchText;
  }

  String setSearchFieldText(String newPlaceHolder) {
    searchText = newPlaceHolder;
    return searchText;
  }

  Future<void> clearSearchHistory() async {
    final userId = ref.read(currentUserProvider)?.id;
    if (userId == null) {
      return;
    }
    await ref.read(userProfileDataProvider).clearSearchHistory(uid: userId);
  }
}

enum SearchViewState { loading, display, searching, result, error }
