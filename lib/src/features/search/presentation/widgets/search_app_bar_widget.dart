import 'package:flutter/material.dart';

import '../../application/search_view_model/search_view_model.dart';

class SearchAppBarWidget extends StatefulWidget {
  final SearchViewState searchViewState;
  final TextEditingController searchController;
  final SearchViewModel searchViewModel;

  const SearchAppBarWidget({
    super.key,
    required this.searchViewState,
    required this.searchController,
    required this.searchViewModel,
  });

  @override
  SearchAppBarWidgetState createState() => SearchAppBarWidgetState();
}

class SearchAppBarWidgetState extends State<SearchAppBarWidget>
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
  void didUpdateWidget(covariant SearchAppBarWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      toolbarHeight: kToolbarHeight * 1.2,
      pinned: true,
      floating: true,
      title: FadeTransition(
        opacity: _controller,
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: widget.searchController,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(8),
                  hintText: "Eletricista, Barbeiro, Martelo, Vaso...",
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () => widget.searchViewModel
                        .onSearchSubmit(query: widget.searchController.text),
                  ),
                ),
                onSubmitted: (value) => widget.searchViewModel.onSearchSubmit(
                  query: widget.searchController.text,
                ),
                onTap: () => widget.searchViewModel.onSearchTap(),
              ),
            ),
            Visibility(
              visible: widget.searchViewState == SearchViewState.searching ||
                  widget.searchViewState == SearchViewState.result,
              child: IconButton(
                icon: const Icon(Icons.cancel),
                onPressed: () {
                  widget.searchController.clear();
                  widget.searchViewModel.onSearchCancel();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
