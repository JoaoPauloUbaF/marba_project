import 'package:flutter/material.dart';

import '../../application/search_view_model/search_view_model.dart';

class SearchViewHeadlineWidget extends StatefulWidget {
  final SearchViewState searchViewState;

  const SearchViewHeadlineWidget({super.key, required this.searchViewState});

  @override
  SearchViewHeadlineWidgetState createState() =>
      SearchViewHeadlineWidgetState();
}

class SearchViewHeadlineWidgetState extends State<SearchViewHeadlineWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    )..forward();
  }

  @override
  void didUpdateWidget(covariant SearchViewHeadlineWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.searchViewState != widget.searchViewState &&
        (widget.searchViewState == SearchViewState.display ||
            widget.searchViewState == SearchViewState.loading)) {
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
    return widget.searchViewState == SearchViewState.display ||
            widget.searchViewState == SearchViewState.loading
        ? SliverAppBar(
            automaticallyImplyLeading: false,
            title: FadeTransition(
              opacity: _controller,
              child: Text(
                "Do que você precisa?",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
          )
        : const SliverToBoxAdapter(child: SizedBox.shrink());
  }
}
