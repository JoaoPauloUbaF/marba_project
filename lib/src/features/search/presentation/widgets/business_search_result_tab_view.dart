import 'package:flutter/material.dart';

class BusinessSearchResultTabView extends StatefulWidget {
  const BusinessSearchResultTabView({
    super.key,
  });

  @override
  State<BusinessSearchResultTabView> createState() =>
      _BusinessSearchResultTabViewState();
}

class _BusinessSearchResultTabViewState
    extends State<BusinessSearchResultTabView> {
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
    return ListView.builder(
      controller: _scrollController,
      itemCount: 20,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: ListTile(
            title: Text('Negócio $index'),
            subtitle: Text('Categoria $index'),
          ),
        );
      },
    );
  }
}
