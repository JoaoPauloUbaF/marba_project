import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_marba/src/features/darkmode/presentation/components/theme_switch_widget.dart';
import 'package:project_marba/src/features/feed/presentation/screens/feed_screen.dart';
import 'package:project_marba/src/features/business/presentation/screens/my_business_list_screen.dart';
import 'package:project_marba/src/features/home/presentation/widgets/animated_logo_loading_widget.dart';
import 'package:project_marba/src/features/orders/presentation/views/user_orders_view.dart';
import 'package:project_marba/src/features/settings/presentation/profile_settings_screen.dart';

import '../../../../core/utils/view_utils.dart';
import '../../../search/presentation/views/search_view.dart';
import '../../application/home_screen_controller/home_screen_view_model.dart';
import '../widgets/mobile_screen_bottom_navbar_widget.dart';
import '../widgets/wide_screen_drawer_widget.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  int _selectedIndex = 0;
  final TextEditingController _searchController = TextEditingController();

  static const List<Widget> _widgetOptions = <Widget>[
    SearchView(),
    FeedOffersView(),
    UserOrdersView(),
    ProfileSettingsScreen(),
    MyBusinessListScreen(),
  ];

  void _itemNavigation(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final homeScreenState = ref.watch(homeScreenViewModelProvider);
    final homeScreenViewModel = ref.read(homeScreenViewModelProvider.notifier);

    homeScreenViewModel.isUserRegistrationComplete(context);

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 1000),
      child: homeBody(
        homeScreenState,
        context,
        homeScreenViewModel,
      ),
    );
  }

  Widget homeBody(HomeScreenState homeScreenState, BuildContext context,
      HomeScreenViewModel homeScreenViewModel) {
    switch (homeScreenState) {
      case HomeScreenState.loading:
        return const AnimatedLogoLoadingWidget();
      case HomeScreenState.error:
        return const Scaffold(
          body: Center(
            child: Text(
              'Erro ao carregar a página.\n Tente novamente mais tarde.',
              textAlign: TextAlign.center,
            ),
          ),
        );
      case HomeScreenState.loaded:
        return Scaffold(
          extendBody: true,
          appBar: AppBar(
            titleSpacing: 0,
            backgroundColor: isWideScreen(context)
                ? Theme.of(context).colorScheme.primaryContainer
                : Theme.of(context).colorScheme.primary,
            automaticallyImplyLeading: false,
            title: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      _itemNavigation(1);
                    },
                    child: SizedBox(
                      child: Image.asset(
                        'assets/images/logo.png',
                        fit: BoxFit.cover,
                        scale: 3,
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                isWideScreen(context) && _selectedIndex != 0
                    ? SizedBox(
                        width: MediaQuery.of(context).size.width * 0.45,
                        child: TextField(
                          controller: _searchController,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(4),
                            hintText: 'Pesquisar',
                            hintStyle: TextStyle(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onPrimaryContainer,
                            ),
                            prefixIcon: const Icon(Icons.search_sharp),
                            suffixIcon: IconButton(
                              icon: const Icon(Icons.done_sharp),
                              onPressed: () {
                                homeScreenViewModel.onSearch(
                                    query: _searchController.text,
                                    onItemTap: _itemNavigation);
                              },
                            ),
                            border: const OutlineInputBorder(),
                          ),
                          style: TextStyle(
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer,
                          ),
                          cursorColor: Theme.of(context).colorScheme.onPrimary,
                        ),
                      )
                    : const SizedBox.shrink(),
                const Spacer(),
              ],
            ),
            leading: isWideScreen(context)
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
          drawer: !isWideScreen(context)
              ? null
              : WideScreenDrawerWidget(onItemTapped: _itemNavigation),
          bottomNavigationBar: isWideScreen(context)
              ? null
              : MobileScreenBottomNavBarWidget(
                  onItemTapped: _itemNavigation, selectedIndex: _selectedIndex),
        );

      default:
        return const SizedBox.shrink();
    }
  }
}
