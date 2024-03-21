import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_marba/src/features/authentication/data/firebase_auth_provider.dart';
import 'package:project_marba/src/features/darkmode/presentation/components/theme_switch_widget.dart';
import 'package:project_marba/src/features/feed/presentation/screens/feed_screen.dart';
import 'package:project_marba/src/features/my_business/presentation/screens/my_business_list_screen.dart';
import 'package:project_marba/src/features/settings/presentation/settings_screen.dart';

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
    FeedScreen(),
    Placeholder(),
    Placeholder(),
    SettingsScreen(shouldRenderAppBar: false),
    MyBusinessListScreen(
      shouldRenderAppBar: false,
    ),
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
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: SizedBox(
          height: 40,
          child: TextField(
            decoration: InputDecoration(
              hintText: ' "Encanador", "Vidros"',
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(0),
                ),
              ),
              contentPadding: const EdgeInsets.all(5),
              suffixIcon: InkWell(
                onTap: () {
                  log('Search');
                },
                child: const Icon(
                  Icons.search,
                ),
              ),
            ),
          ),
        ),
        actions: [
          IconButton(
            padding: EdgeInsets.zero,
            visualDensity: VisualDensity.compact,
            onPressed: () {},
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
          return BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              const BottomNavigationBarItem(
                icon: Icon(Icons.shopping_bag_sharp),
                label: 'Ofertas',
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.video_camera_back_sharp),
                label: 'Posts',
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.receipt_sharp),
                label: 'Pedidos',
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.settings_sharp),
                label: 'Settings',
              ),
              if (snapshot.data != null && snapshot.data)
                const BottomNavigationBarItem(
                  icon: Icon(Icons.monetization_on_sharp),
                  label: 'Negócios',
                ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Theme.of(context).colorScheme.primary,
            type: BottomNavigationBarType.fixed,
            onTap: _onItemTapped,
          );
        },
      ),
    );
  }
}
