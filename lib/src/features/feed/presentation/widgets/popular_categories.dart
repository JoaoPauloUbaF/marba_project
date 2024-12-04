import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:project_marba/src/core/utils/view_utils.dart';
import 'package:project_marba/src/features/feed/application/feed_screen_controller/feed_view_model.dart';
import 'package:project_marba/src/features/search/application/search_view_model/search_view_model.dart';
import 'package:project_marba/src/features/search/presentation/widgets/search_body_widget.dart';

class PopularCategories extends ConsumerWidget {
  const PopularCategories({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categories =
        ref.read(feedViewModelProvider.notifier).getPopularCategories();

    return SizedBox(
      height: 120, // Aumenta um pouco a altura para suportar textos maiores
      child: GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          final label = category.businessCategoryTranslation(context);
          final icon = category.icon;

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: InkWell(
              onTap: () async {
                showLoader(context);
                await ref
                    .read(searchViewModelProvider.notifier)
                    .onSearchSubmit(query: label)
                    .then((_) {
                  hideLoader(context);
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (context) {
                        return Scaffold(
                          appBar: AppBar(
                            title: Text(label),
                          ),
                          body: const SearchBodyWidget(
                            searchViewState: SearchViewState.result,
                          ),
                        );
                      },
                    ),
                  );
                });
              },
              child: Container(
                width: 90, // Aumenta a largura para textos mais longos
                margin: const EdgeInsets.symmetric(horizontal: 2.0),
                padding: const EdgeInsets.all(4.0),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.tertiary,
                  borderRadius: BorderRadius.circular(12.0),
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
                      label,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2, // Permite até duas linhas
                      softWrap: true,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Theme.of(context).colorScheme.onTertiary,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          crossAxisSpacing: 4,
          mainAxisSpacing: 4,
        ),
      ),
    );
  }
}
