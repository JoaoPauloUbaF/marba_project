import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

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

    return RefreshIndicator(
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
    );
  }
}
