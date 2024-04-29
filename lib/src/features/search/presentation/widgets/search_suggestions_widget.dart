import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:project_marba/src/core/widgets/loading_widget.dart';

import '../../application/search_view_model/search_view_model.dart';

class SearchingSuggestionsWidget extends ConsumerStatefulWidget {
  const SearchingSuggestionsWidget({
    super.key,
  });

  @override
  ConsumerState<SearchingSuggestionsWidget> createState() =>
      _SearchingSuggestionsWidgetState();
}

class _SearchingSuggestionsWidgetState
    extends ConsumerState<SearchingSuggestionsWidget> {
  @override
  Widget build(BuildContext context) {
    final searchViewModel = ref.watch(searchViewModelProvider.notifier);
    final suggestions = searchViewModel.getSuggestions();
    return FutureBuilder<List<String>>(
      future: suggestions, // replace this with your actual method
      builder: (BuildContext context, AsyncSnapshot<List<String>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingWidget(); // show loading spinner while waiting for data
        } else if (snapshot.hasError) {
          return Text(
              'Error: ${snapshot.error}'); // show error if something went wrong
        } else {
          List<String> suggestions = snapshot.data ?? [];
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  const SizedBox(
                    width: 8,
                  ),
                  const Text('Histórico de buscas'),
                  const Spacer(),
                  ElevatedButton.icon(
                    icon: const Icon(Icons.clear),
                    onPressed: () {
                      searchViewModel.clearSearchHistory();
                      setState(() {});
                    },
                    label: const Text('Limpar'),
                  ),
                ],
              ),
              ListView.separated(
                shrinkWrap: true,
                itemCount: suggestions.length,
                separatorBuilder: (context, index) => const Divider(),
                itemBuilder: (context, index) => ListTile(
                  title: Text(suggestions[index]),
                  trailing: const Icon(Icons.history),
                  onTap: () {
                    searchViewModel.onSearchSubmit(query: suggestions[index]);
                  },
                ),
              ),
            ],
          );
        }
      },
    );
  }
}
