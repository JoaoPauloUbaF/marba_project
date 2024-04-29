import 'package:flutter/material.dart';
import 'package:project_marba/src/features/search/presentation/widgets/search_suggestions_widget.dart';

import '../../../../core/widgets/medium_vertical_space_widget.dart';
import '../../application/search_view_model/search_view_model.dart';
import 'hot_business_widget.dart';
import 'hot_offers_widget.dart';
import 'search_result_widget.dart';

class SearchBodyWidget extends StatefulWidget {
  final SearchViewState searchViewState;

  const SearchBodyWidget({super.key, required this.searchViewState});

  @override
  SearchBodyWidgetState createState() => SearchBodyWidgetState();
}

class SearchBodyWidgetState extends State<SearchBodyWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    )..forward();
  }

  @override
  void didUpdateWidget(covariant SearchBodyWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.searchViewState != widget.searchViewState) {
      _controller.reset();
      _controller.forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _controller,
      child: Builder(
        builder: (BuildContext context) {
          Widget child;
          switch (widget.searchViewState) {
            case SearchViewState.loading:
              child = const Center(child: CircularProgressIndicator());
              break;
            case SearchViewState.display:
              child = const Column(
                children: [
                  HotOffersWidget(),
                  VerticalSpaceMediumWidget(),
                  HotBusinessesWidget(),
                ],
              );
              break;
            case SearchViewState.searching:
              child = const SearchingSuggestionsWidget();
              break;
            case SearchViewState.result:
              child = const SearchResultWidget();
              break;
            default:
              child = const SizedBox.shrink();
          }
          return child;
        },
      ),
    );
  }
}
