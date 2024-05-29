import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_marba/src/features/authentication/data/firebase_auth_provider.dart';
import 'package:project_marba/src/features/darkmode/presentation/components/theme_switch_widget.dart';
import 'package:project_marba/src/features/feed/presentation/screens/feed_screen.dart';
import 'package:project_marba/src/features/business/presentation/screens/my_business_list_screen.dart';
import 'package:project_marba/src/features/orders/presentation/views/user_orders_view.dart';
import 'package:project_marba/src/features/settings/presentation/profile_settings_screen.dart';
import 'package:project_marba/src/features/user_profile/application/current_user_profile_provider/current_user_profile_provider.dart';

import '../../../search/presentation/views/search_view.dart';
import '../../../feed/application/home_screen_controller/home_screen_controller.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    SearchView(),
    FeedOffersView(),
    UserOrdersView(),
    ProfileSettingsScreen(),
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
    controller.isUserRegistrationComplete(context);

    final isWideScreen = MediaQuery.of(context).size.width > 600;

    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        titleSpacing: 0,
        backgroundColor: isWideScreen
            ? Theme.of(context).colorScheme.primaryContainer
            : Theme.of(context).colorScheme.primary,
        automaticallyImplyLeading: false,
        title: InkWell(
          onTap: () {
            _onItemTapped(1);
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              'assets/images/logo.png',
              fit: BoxFit.cover,
              scale: 4,
            ),
          ),
        ),
        leading: isWideScreen
            ? Builder(builder: (context) {
                return IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                );
              })
            : null,
        actions: [
          isWideScreen
              ? SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: TextField(
                    // Add TextField
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(4),
                      hintText: 'Pesquisar',
                      hintStyle: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                      prefixIcon: const Icon(Icons.search_sharp),
                      border: const OutlineInputBorder(),
                    ),
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                    cursorColor: Theme.of(context).colorScheme.onPrimary,
                    onChanged: (value) {
                      if (value.isNotEmpty) {
                        Navigator.pushNamed(context, '/search',
                            arguments: value);
                      }
                    },
                  ),
                )
              : const SizedBox.shrink(),
          IconButton(
            padding: EdgeInsets.zero,
            visualDensity: VisualDensity.compact,
            onPressed: () {
              Navigator.pushNamed(context, '/shopping-cart');
            },
            icon: Icon(
              Icons.shopping_cart_sharp,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
          const ThemeSwitchWidget(),
        ],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      drawer: !isWideScreen
          ? null
          : WideScreenDrawerWidget(
              onItemTapped: _onItemTapped, controller: controller),
      bottomNavigationBar: isWideScreen
          ? null
          : MobileScreenBottomNavBarWidget(
              onItemTapped: _onItemTapped,
              controller: controller,
              selectedIndex: _selectedIndex),
    );
  }
}

class WideScreenDrawerWidget extends StatelessWidget {
  const WideScreenDrawerWidget(
      {super.key, required this.onItemTapped, required this.controller});
  final void Function(int index) onItemTapped;
  final HomeScreenController controller;
  @override
  Widget build(BuildContext context) {
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
          FutureBuilder(
              future: controller.hasBusiness(),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                return snapshot.data != null && snapshot.data
                    ? ListTile(
                        leading: const Icon(Icons.monetization_on_sharp),
                        title: const Text('Negócios'),
                        onTap: () {
                          Navigator.pop(context);
                          onItemTapped(4);
                        },
                      )
                    : const SizedBox.shrink();
              }),
        ],
      ),
    );
  }
}

class MobileScreenBottomNavBarWidget extends StatelessWidget {
  const MobileScreenBottomNavBarWidget(
      {super.key,
      required this.onItemTapped,
      required this.controller,
      required this.selectedIndex});
  final void Function(int index) onItemTapped;
  final HomeScreenController controller;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: controller.hasBusiness(),
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
