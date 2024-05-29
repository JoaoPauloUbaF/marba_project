import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_marba/src/features/business/application/business_profile_screen_controller/business_profile_screen_controller.dart';
import 'package:project_marba/src/features/business/presentation/screens/business_dashboard_view.dart';
import 'package:project_marba/src/features/business/presentation/screens/business_offers_screen.dart';
import 'package:project_marba/src/features/business/presentation/screens/business_profile_screen.dart';
import 'package:project_marba/src/features/business/presentation/screens/business_settings_view.dart';

class MyBusinessHomeScreen extends ConsumerStatefulWidget {
  const MyBusinessHomeScreen({super.key});

  @override
  BusinessHomeScreenState createState() => BusinessHomeScreenState();
}

class BusinessHomeScreenState extends ConsumerState<MyBusinessHomeScreen> {
  int _selectedIndex = 0; //TODO: search on business products

  static final List<Widget> _widgetOptions = <Widget>[
    const BusinessProfileScreen(),
    const BusinessDashboardView(),
    const MyBusinessOffersScreen(),
    const BusinessSettingsView(),
  ];

  @override
  Widget build(BuildContext context) {
    ref.watch(businessProfileViewModelProvider);
    final viewController = ref.read(businessProfileViewModelProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: AppBarWidget(viewController: viewController),
        automaticallyImplyLeading: true,
        actions: [
          IconButton(
            icon: Icon(Icons.home_sharp,
                color: Theme.of(context).colorScheme.primary),
            onPressed: () {
              viewController.dispose();
              Navigator.pushNamed(context, '/home');
            },
          ),
        ],
      ),
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: ClipRRect(
        child: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Perfil',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.dashboard),
              label: 'Dashboard',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Ofertas',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Configurações',
            ),
          ],
          currentIndex: _selectedIndex,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Theme.of(context).colorScheme.primary,
          backgroundColor: Theme.of(context).colorScheme.background,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
      ),
    );
  }
}

class AppBarWidget extends StatefulWidget {
  const AppBarWidget({
    super.key,
    required this.viewController,
  });

  final BusinessProfileViewModel viewController;

  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {
  bool isEditingBusinessName = false;
  late TextEditingController _businessNameController;

  @override
  void initState() {
    _businessNameController =
        TextEditingController(text: widget.viewController.getBusinessName());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.viewController.isOwner
        ? InkWell(
            onTap: () => setState(() {
              isEditingBusinessName = true;
            }),
            child: isEditingBusinessName
                ? TextField(
                    focusNode: FocusNode()..requestFocus(),
                    controller: _businessNameController,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.check),
                        onPressed: () {
                          widget.viewController.updateBusinessName(
                              context, _businessNameController.text);
                          setState(() {
                            isEditingBusinessName = false;
                          });
                        },
                      ),
                    ),
                    maxLines: null,
                  )
                : Text(
                    widget.viewController.getBusinessName(),
                    style: Theme.of(context).textTheme.headlineSmall!,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                  ),
          )
        : const Text('Negócio');
  }
}
