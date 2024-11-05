import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import '../../../../core/utils/view_utils.dart';
import '../../../search/application/search_view_model/search_view_model.dart';
import '../../../search/presentation/widgets/search_body_widget.dart';

// Defina uma lista de dados para as categorias populares
final List<Map<String, dynamic>> popularServices = [
  {'icon': Icons.home, 'text': 'Conserto de Eletrodomésticos'},
  {'icon': Icons.flash_on, 'text': 'Eletricista'},
  {'icon': Icons.water_drop_sharp, 'text': 'Encanador'},
  {'icon': Icons.tv, 'text': 'Serviços de TV a Cabo'},
  {'icon': Icons.pool, 'text': 'Limpeza de Piscinas'},
  {'icon': Icons.landscape, 'text': 'Jardineiro'},
  {'icon': Icons.cleaning_services, 'text': 'Limpeza de Vidros'},
  {'icon': Icons.brush, 'text': 'Pintor(a)'},
  {'icon': Icons.person, 'text': 'Babá'},
];

class PopularServicesWidget extends StatelessWidget {
  const PopularServicesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              'Serviços Populares',
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
                return Consumer(
                  builder: (_, WidgetRef ref, __) {
                    return InkWell(
                      onTap: () async {
                        showLoader(context);
                        await ref
                            .read(searchViewModelProvider.notifier)
                            .onSearchSubmit(
                                query: popularServices[index]['text'])
                            .then((_) {
                          hideLoader(context);
                          Navigator.of(context).push(
                            MaterialPageRoute<void>(
                              builder: (context) {
                                return Scaffold(
                                    appBar: AppBar(
                                      title:
                                          Text(popularServices[index]['text']),
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
                        icon: popularServices[index]['icon'],
                        text: popularServices[index]['text'],
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
