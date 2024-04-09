import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_marba/src/features/business/application/business_profile_screen_controller/business_profile_screen_controller.dart';
import 'package:project_marba/src/features/business/presentation/screens/business_offers_screen.dart';
import 'package:project_marba/src/features/business/presentation/screens/business_profile_screen.dart';
import 'package:project_marba/src/features/business/presentation/screens/business_settings_view.dart';

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
    const BusinessSettingsView(),
  ];

  @override
  Widget build(BuildContext context) {
    ref.watch(businessProfileScreenControllerProvider);
    final viewController =
        ref.read(businessProfileScreenControllerProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: AppBarWidget(viewController: viewController),
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
            label: 'Perfil',
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

class AppBarWidget extends StatefulWidget {
  const AppBarWidget({
    super.key,
    required this.viewController,
  });

  final BusinessProfileScreenController viewController;

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
    return FutureBuilder(
      future: widget.viewController.isBusinessOwner(),
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return snapshot.data!
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
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 8),
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
        } else {
          return const LinearProgressIndicator();
        }
      },
    );
  }
}
