import 'package:flutter/material.dart';
import 'package:project_marba/src/core/utils/view_utils.dart';
import 'package:project_marba/util.dart';

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
    return Padding(
      padding: isWideScreen(context)
          ? EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.05)
          : EdgeInsets.zero,
      child: Scaffold(
        body: NestedScrollView(
          controller: _scrollController,
          headerSliverBuilder: (context, innerBoxIsScrolled) => <Widget>[
            SliverToBoxAdapter(
              child: Column(
                children: [
                  TabBar(
                    controller: _tabController,
                    dividerColor: Colors.transparent,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicatorColor: Theme.of(context).colorScheme.primary,
                    tabs: [
                      Tab(
                        text: getAppLocalizations(context).offers,
                        icon: Icon(Icons.local_offer),
                      ),
                      Tab(
                        text: getAppLocalizations(context).business,
                        icon: Icon(Icons.add_business),
                      ),
                    ],
                  ),
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
      ),
    );
  }
}
