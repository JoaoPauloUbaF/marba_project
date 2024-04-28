import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_marba/src/features/authentication/data/firebase_auth_provider.dart';
import 'package:project_marba/src/features/darkmode/presentation/components/theme_switch_widget.dart';
import 'package:project_marba/src/features/feed/presentation/screens/feed_screen.dart';
import 'package:project_marba/src/features/business/presentation/screens/my_business_list_screen.dart';
import 'package:project_marba/src/features/orders/presentation/views/user_orders_view.dart';
import 'package:project_marba/src/features/settings/presentation/settings_screen.dart';
import 'package:project_marba/src/features/user_profile/application/current_user_profile_provider/current_user_profile_provider.dart';

import '../../../search/presentation/views/search_view.dart';
import '../../application/home_screen_controller/home_screen_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const BottomNavigation();
  }
}

class BottomNavigation extends ConsumerStatefulWidget {
  const BottomNavigation({super.key});

  @override
  ConsumerState<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends ConsumerState<BottomNavigation> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    SearchView(),
    OffersFeedView(),
    UserOrdersView(),
    SettingsScreen(shouldRenderAppBar: false),
    MyBusinessListScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = ref.read(homeScreenControllerProvider.notifier);
    final _ = ref.watch(authStateChangeProvider);
    ref.watch(currentUserProvider);
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            padding: EdgeInsets.zero,
            visualDensity: VisualDensity.compact,
            onPressed: () {
              Navigator.pushNamed(context, '/shopping-cart');
            },
            icon: const Icon(
              Icons.shopping_cart_sharp,
            ),
          ),
          IconButton(
            padding: EdgeInsets.zero,
            visualDensity: VisualDensity.compact,
            onPressed: () {},
            icon: const Icon(
              Icons.chat_sharp,
            ),
          ),
          const ThemeSwitchWidget(),
        ],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: FutureBuilder(
        future: controller.hasBusiness(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          return ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(35),
              topRight: Radius.circular(35),
            ),
            child: BottomNavigationBar(
              backgroundColor: Theme.of(context).colorScheme.primary,
              showSelectedLabels: false,
              showUnselectedLabels: false,
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
                  icon: Icon(Icons.settings_outlined, size: 30),
                  activeIcon: Icon(Icons.settings_sharp, size: 35),
                  label: 'Configurações',
                ),
                if (snapshot.data != null && snapshot.data)
                  const BottomNavigationBarItem(
                    icon: Icon(Icons.monetization_on_outlined, size: 35),
                    activeIcon: Icon(Icons.monetization_on_sharp, size: 35),
                    label: 'Negócios',
                  ),
              ],
              currentIndex: _selectedIndex,
              selectedItemColor: Theme.of(context).colorScheme.onPrimary,
              unselectedItemColor:
                  Theme.of(context).colorScheme.onPrimary.withAlpha(200),
              type: BottomNavigationBarType.fixed,
              onTap: _onItemTapped,
            ),
          );
        },
      ),
    );
  }
}
