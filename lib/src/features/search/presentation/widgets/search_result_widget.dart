import 'package:flutter/material.dart';

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
            title: TabBar(
              controller: _tabController,
              tabs: const [
                Tab(text: 'Ofertas'),
                Tab(text: 'Negócios'),
              ],
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
