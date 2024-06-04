import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_marba/src/features/search/application/query_offers_result_provider/query_offers_result_provider.dart';

import 'business_search_result_tab_view.dart';
import 'offers_search_result_tab_view.dart';

class SearchResultWidget extends StatefulWidget {
  const SearchResultWidget({super.key});

  @override
  SearchResultWidgetState createState() => SearchResultWidgetState();
}

class SearchResultWidgetState extends State<SearchResultWidget>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 2, vsync: this);
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (context, innerBoxIsScrolled) => <Widget>[
          SliverAppBar(
            automaticallyImplyLeading: false,
            title: Consumer(
              builder: (_, WidgetRef ref, __) {
                return TabBar(
                  controller: _tabController,
                  tabs: const [
                    Tab(text: 'Ofertas'),
                    Tab(text: 'Negócios'),
                  ],
                );
              },
            ),
          ),
        ],
        body: TabBarView(
          controller: _tabController,
          children: const [
            OffersSearchResultTabView(), // GridView for 'Ofertas'
            BusinessSearchResultTabView(), // Another view for 'Negócios'
          ],
        ),
      ),
    );
  }
}
