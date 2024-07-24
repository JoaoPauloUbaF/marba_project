import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

import '../../application/home_screen_controller/home_screen_view_model.dart';

class WideScreenDrawerWidget extends ConsumerWidget {
  const WideScreenDrawerWidget({super.key, required this.onItemTapped});
  final void Function(int index) onItemTapped;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeScreenViewModel = ref.read(homeScreenViewModelProvider.notifier);

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          SizedBox(
            height: 100,
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
              ),
              child: Image.asset(
                'assets/images/logo.png',
                fit: BoxFit.cover,
                scale: 3,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.search_sharp),
            title: const Text('Buscar'),
            onTap: () {
              Navigator.pop(context);
              onItemTapped(0);
            },
          ),
          ListTile(
            leading: const Icon(Icons.shopping_bag_sharp),
            title: const Text('Ofertas'),
            onTap: () {
              Navigator.pop(context);
              onItemTapped(1);
            },
          ),
          ListTile(
            leading: const Icon(Icons.receipt_sharp),
            title: const Text('Pedidos'),
            onTap: () {
              Navigator.pop(context);
              onItemTapped(2);
            },
          ),
          ListTile(
            leading: const Icon(Icons.person_sharp),
            title: const Text('Configurações'),
            onTap: () {
              Navigator.pop(context);
              onItemTapped(3);
            },
          ),
          homeScreenViewModel.thisUserHasBusiness() == true &&
                  homeScreenViewModel.thisUserHasBusiness() != null
              ? ListTile(
                  leading: const Icon(Icons.monetization_on_sharp),
                  title: const Text('Negócios'),
                  onTap: () {
                    Navigator.pop(context);
                    onItemTapped(4);
                  },
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
