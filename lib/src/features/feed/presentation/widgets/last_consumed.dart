import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:project_marba/src/features/feed/application/feed_screen_controller/feed_view_model.dart';
import 'package:project_marba/util.dart';

import '../../../../core/utils/view_utils.dart';
import '../../../search/application/search_view_model/search_view_model.dart';
import '../../../search/presentation/widgets/search_body_widget.dart';

class PopularServicesWidget extends ConsumerWidget {
  const PopularServicesWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final popularServices =
        ref.read(feedViewModelProvider.notifier).getPopularServices();

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              getAppLocalizations(context).popular_services,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          const Gap(8),
          SizedBox(
            height: 100,
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              scrollDirection: Axis.horizontal,
              itemCount: popularServices.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                mainAxisSpacing: 8.0,
                mainAxisExtent: 150.0,
              ),
              itemBuilder: (BuildContext context, int index) {
                final category = popularServices[index];
                return Consumer(
                  builder: (_, WidgetRef ref, __) {
                    return InkWell(
                      onTap: () async {
                        showLoader(context);
                        await ref
                            .read(searchViewModelProvider.notifier)
                            .onSearchSubmit(
                                query: category
                                    .getServiceCategoryTranslation(context))
                            .then((_) {
                          hideLoader(context);
                          Navigator.of(context).push(
                            MaterialPageRoute<void>(
                              builder: (context) {
                                return Scaffold(
                                    appBar: AppBar(
                                      title: Text(
                                        category.getServiceCategoryTranslation(
                                            context),
                                      ),
                                    ),
                                    body: const SearchBodyWidget(
                                      searchViewState: SearchViewState.result,
                                    ));
                              },
                            ),
                          );
                        });
                      },
                      child: PopularServiceTile(
                        icon: category.icon,
                        text: category.getServiceCategoryTranslation(context),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class PopularServiceTile extends ConsumerWidget {
  final IconData icon;
  final String text;

  const PopularServiceTile({
    super.key,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: 80,
      margin: const EdgeInsets.symmetric(horizontal: 2.0),
      padding: const EdgeInsets.all(2.0),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.tertiary,
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(
          color: Theme.of(context).colorScheme.secondary.withAlpha(100),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 40,
            color: Theme.of(context).colorScheme.onTertiary,
          ),
          const Gap(8),
          Text(
            text,
            overflow: TextOverflow.fade,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).colorScheme.onTertiary,
                  fontWeight: FontWeight.w600,
                ),
          ),
        ],
      ),
    );
  }
}
