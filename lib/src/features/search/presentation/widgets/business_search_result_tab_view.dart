import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_marba/src/core/widgets/loading_widget.dart';
import 'package:project_marba/src/features/business/presentation/widgets/business_tile_widget.dart';
import 'package:project_marba/src/features/search/application/query_business_result_provider/query_business_result_provider.dart';

class BusinessSearchResultTabView extends ConsumerStatefulWidget {
  const BusinessSearchResultTabView({
    super.key,
  });

  @override
  ConsumerState<BusinessSearchResultTabView> createState() =>
      _BusinessSearchResultTabViewState();
}

class _BusinessSearchResultTabViewState
    extends ConsumerState<BusinessSearchResultTabView> {
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
    final queryBusinessList = ref.watch(queryBusinessResultProvider);

    return queryBusinessList.when(
      data: (businesses) {
        if (businesses.isEmpty) {
          return const Center(child: Text('Nenhum resultado encontrado!'));
        }
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            controller: _scrollController,
            itemCount: businesses.length,
            itemBuilder: (context, index) {
              final business = businesses[index];
              return BusinessTileWidget(businessId: business.id);
            },
          ),
        );
      },
      loading: () => const Center(child: LoadingWidget()),
      error: (error, _) => Center(child: Text(error.toString())),
    );
  }
}
