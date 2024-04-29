import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:project_marba/src/core/utils/registration_utils.dart';
import 'package:project_marba/src/core/widgets/loading_widget.dart';
import 'package:project_marba/src/core/widgets/medium_vertical_space_widget.dart';
import 'package:project_marba/src/features/search/application/hot_offers_provider/hot_offers_provider.dart';

import '../../application/hot_business_provider/hot_businesses_provider.dart';
import '../../application/search_view_model/search_view_model.dart';
import '../widgets/search_app_bar_widget.dart';
import '../widgets/search_body_widget.dart';
import '../widgets/search_view_headline_widget.dart';

class SearchView extends ConsumerStatefulWidget {
  const SearchView({super.key});

  @override
  ConsumerState<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends ConsumerState<SearchView> {
  late TextEditingController searchController;
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    searchController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final searchViewState = ref.watch(searchViewModelProvider);
    final searchViewModel = ref.watch(searchViewModelProvider.notifier);
    // searchViewModel.setUpView();

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          ref.invalidate(searchViewModelProvider);
        },
        child: NestedScrollView(
          controller: _scrollController,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SearchViewHeadlineWidget(searchViewState: searchViewState),
              SearchAppBarWidget(
                searchViewState: searchViewState,
                searchController: searchController,
                searchViewModel: searchViewModel,
              ),
            ];
          },
          body: SearchBodyWidget(searchViewState: searchViewState),
        ),
      ),
    );
  }
}
