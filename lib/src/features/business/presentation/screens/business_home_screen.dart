import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_marba/src/features/business/application/business_profile_screen_controller/business_profile_screen_controller.dart';
import 'package:project_marba/src/features/business/presentation/screens/business_offers_screen.dart';
import 'package:project_marba/src/features/business/presentation/screens/business_profile_screen.dart';

class MyBusinessHomeScreen extends ConsumerStatefulWidget {
  const MyBusinessHomeScreen({super.key});

  @override
  BusinessHomeScreenState createState() => BusinessHomeScreenState();
}

class BusinessHomeScreenState extends ConsumerState<MyBusinessHomeScreen> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    const BusinessProfileScreen(),
    const MyBusinessOffersScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final _ = ref.watch(businessProfileScreenControllerProvider);
    final viewController =
        ref.read(businessProfileScreenControllerProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          viewController.getBusinessName(),
          style: Theme.of(context).textTheme.headlineSmall!,
        ),
        automaticallyImplyLeading: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.home_sharp),
            onPressed: () {
              viewController.dispose();
              Navigator.pushNamed(context, '/home');
            },
          ),
        ],
      ),
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Preview',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Ofertas',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}