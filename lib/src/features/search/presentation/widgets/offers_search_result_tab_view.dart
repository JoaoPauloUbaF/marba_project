import 'package:flutter/material.dart';

class OffersSearchResultTabView extends StatefulWidget {
  const OffersSearchResultTabView({
    super.key,
  });

  @override
  State<OffersSearchResultTabView> createState() =>
      _OffersSearchResultTabViewState();
}

class _OffersSearchResultTabViewState extends State<OffersSearchResultTabView> {
  late ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      controller: _scrollController,
      itemCount: 20,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: Center(
            child: Text('Item $index'),
          ),
        );
      },
    );
  }
}
