// ignore_for_file: implementation_imports

import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_marba/src/features/authentication/presentation/screens/sign_in.dart';
import 'package:project_marba/src/features/darkmode/application/theme_provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:project_marba/src/features/home/presentation/views/home_screen.dart';
import 'package:project_marba/src/features/business/presentation/screens/business_home_screen.dart';
import 'package:project_marba/src/features/business/presentation/screens/business_profile_screen.dart';
import 'package:project_marba/src/features/offers_management/presentation/views/edit_offer_view.dart';
import 'package:project_marba/src/features/business/presentation/screens/my_business_list_screen.dart';
import 'package:project_marba/src/features/offers_management/presentation/views/offer_details_view.dart';
import 'package:project_marba/src/features/orders/presentation/views/checkout_view.dart';
import 'package:project_marba/src/features/user_profile/presentation/screens/app_profile_screen.dart';
import 'firebase_options.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:firebase_ui_localizations/firebase_ui_localizations.dart';
import 'package:firebase_ui_auth/src/providers/email_auth_provider.dart'
    as email_auth;
import 'src/features/orders/presentation/views/user_order_details_view.dart';
import 'src/features/settings/presentation/settings_screen.dart';
import 'src/features/shopping/presentation/views/shopping_cart_view.dart';
import 'src/features/user_profile/presentation/screens/profile_form_screen.dart';
import 'theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseUIAuth.configureProviders([email_auth.EmailAuthProvider()]);
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) =>
          const ProviderScope(child: MainApp()), // Wrap your app
    ),
  );
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextTheme textTheme =
        createTextTheme(context, "Roboto", "Roboto Condensed");

    return MaterialApp(
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      themeAnimationCurve: Curves.easeInOut,
      themeAnimationDuration: const Duration(milliseconds: 500),
      debugShowCheckedModeBanner: false,
      title: 'Onktem', //Onktem
      theme: MaterialTheme(textTheme).light(),
      darkTheme: MaterialTheme(textTheme).dark(),
      themeMode: ref.watch(darkModeProvider),
      initialRoute: '/home',
      routes: {
        '/home': (context) => const HomeView(),
        '/sign-in': (context) => const SignIn(),
        '/profile': (context) => const AppProfileScreen(),
        '/profile-form': (context) => const ProfileFormScreen(),
        '/settings': (context) => const SettingsScreen(),
        '/business-list': (context) => const MyBusinessListScreen(),
        '/business-home': (context) => const MyBusinessHomeScreen(),
        '/business-profile': (context) => const BusinessProfileScreen(),
        '/edit-offer': (context) => const EditOfferView(),
        '/offer-details': (context) => const OfferDetailsView(),
        '/shopping-cart': (context) => const ShoppingCartScreen(),
        '/checkout': (context) => const CheckoutView(),
        '/user-order-details': (context) => const UserOrderDetailsView(),
      },
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        FirebaseUILocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('pt', 'BR'),
      ],
    );
  }
}
