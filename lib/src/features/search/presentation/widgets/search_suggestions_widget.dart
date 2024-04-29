import 'package:flutter/material.dart';

class SearchingSuggestionsWidget extends StatelessWidget {
  const SearchingSuggestionsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 10,
      separatorBuilder: (context, index) => const Divider(),
      itemBuilder: (context, index) => ListTile(
        title: Text('Sugestão de busca $index'),
        onTap: () {},
      ),
    );
  }
}
