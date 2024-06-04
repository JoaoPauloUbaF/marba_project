import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

import '../../application/home_screen_controller/home_screen_view_model.dart';

class MobileScreenBottomNavBarWidget extends ConsumerWidget {
  const MobileScreenBottomNavBarWidget(
      {super.key, required this.onItemTapped, required this.selectedIndex});
  final void Function(int index) onItemTapped;
  final int selectedIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeScreenViewModel = ref.watch(homeScreenViewModelProvider.notifier);
    return FutureBuilder(
      future: homeScreenViewModel.hasBusiness(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        return Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(35),
              topRight: Radius.circular(35),
            ),
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(38),
              topRight: Radius.circular(38),
            ),
            child: BottomNavigationBar(
              showSelectedLabels: null,
              showUnselectedLabels: false,
              selectedLabelStyle: const TextStyle(
                  overflow: TextOverflow.ellipsis, fontSize: 10),
              items: <BottomNavigationBarItem>[
                const BottomNavigationBarItem(
                  icon: Icon(Icons.search_outlined, size: 30),
                  activeIcon: Icon(Icons.search_sharp, size: 35),
                  label: 'Buscar',
                ),
                const BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_bag_outlined, size: 30),
                  activeIcon: Icon(Icons.shopping_bag_sharp, size: 35),
                  label: 'Ofertas',
                ),
                const BottomNavigationBarItem(
                  icon: Icon(Icons.receipt_outlined, size: 30),
                  activeIcon: Icon(Icons.receipt_sharp, size: 35),
                  label: 'Pedidos',
                ),
                const BottomNavigationBarItem(
                  icon: Icon(Icons.person_outlined, size: 30),
                  activeIcon: Icon(Icons.person_sharp, size: 35),
                  label: 'Perfil',
                ),
                if (snapshot.data != null && snapshot.data)
                  const BottomNavigationBarItem(
                    icon: Icon(Icons.monetization_on_outlined, size: 35),
                    activeIcon: Icon(Icons.monetization_on_sharp, size: 35),
                    label: 'Negócios',
                  ),
              ],
              currentIndex: selectedIndex,
              selectedItemColor: Theme.of(context).colorScheme.primary,
              unselectedItemColor: Theme.of(context).colorScheme.secondary,
              type: BottomNavigationBarType.fixed,
              onTap: onItemTapped,
            ),
          ),
        );
      },
    );
  }
}
