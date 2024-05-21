import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_marba/src/core/models/business/business.dart';
import 'package:project_marba/src/core/utils/translations_provider.dart';
import 'package:project_marba/src/features/business/application/business_profile_screen_controller/business_profile_screen_controller.dart';

import '../../../../core/widgets/loading_widget.dart';
import '../../application/hot_business_provider/hot_businesses_provider.dart';

class HotBusinessesWidget extends ConsumerWidget {
  const HotBusinessesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hotBusinesses = ref.watch(hotBusinessesProvider);
    final translations = ref.read(translationsProvider.notifier);
    return hotBusinesses.when(
      data: (businesses) => businesses == null
          ? const SizedBox.shrink()
          : CarouselSlider(
              items: businesses
                  .map((business) => HotBusinessCardWidget(
                      translations: translations, business: business))
                  .toList(),
              options: CarouselOptions(
                autoPlay: true,
                autoPlayAnimationDuration: const Duration(seconds: 2),
                autoPlayInterval: const Duration(seconds: 2),
                aspectRatio: 2.0,
              ),
            ),
      loading: () => const LoadingWidget(),
      error: (error, stackTrace) {
        return const Card(
          child: Center(
              child: Padding(
            padding: EdgeInsets.all(50.0),
            child:
                Text('Erro ao carregar negócios,\ntente novamente mais tarde.'),
          )),
        );
      },
    );
  }
}

class HotBusinessCardWidget extends ConsumerWidget {
  const HotBusinessCardWidget({
    super.key,
    required this.translations,
    required this.business,
  });

  final Translations translations;
  final BusinessModel business;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () => ref
          .read(businessProfileViewModelProvider.notifier)
          .onBusinessDetailsTap(context, business),
      child: Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Stack(
            children: [
              Image.network(
                business.imageUrl ?? '',
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
                loadingBuilder: (context, child, loadingProgress) =>
                    loadingProgress == null
                        ? child
                        : const Center(
                            child: CircularProgressIndicator(),
                          ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                child: Container(
                  color:
                      Theme.of(context).colorScheme.background.withOpacity(0.7),
                  padding: const EdgeInsets.all(4.0),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Text(
                          business.name,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.75,
                        child: Text(
                          business.categories
                              .take(3)
                              .map((category) => translations
                                  .getBusinessCategoryTranslation(category))
                              .join(', '),
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
