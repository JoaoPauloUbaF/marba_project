// ignore_for_file: implementation_imports
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_marba/src/features/authentication/data/firebase_auth_provider.dart';
import 'package:project_marba/src/features/authentication/presentation/screens/sign_in.dart';
import 'package:project_marba/src/features/darkmode/application/theme_provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:project_marba/src/features/home/presentation/views/home_view.dart';
import 'package:project_marba/src/features/business/presentation/screens/business_home_screen.dart';
import 'package:project_marba/src/features/business/presentation/screens/business_profile_screen.dart';
import 'package:project_marba/src/features/location_management/application/current_location_provider/current_location_provider.dart';
import 'package:project_marba/src/features/offers_management/application/offer_list/feed_offers_list_provider.dart';
import 'package:project_marba/src/features/offers_management/presentation/views/edit_offer_view.dart';
import 'package:project_marba/src/features/business/presentation/screens/my_business_list_screen.dart';
import 'package:project_marba/src/features/offers_management/presentation/views/offer_details_view.dart';
import 'package:project_marba/src/features/orders/presentation/views/checkout_view.dart';
import 'package:project_marba/src/features/settings/presentation/views/address_view.dart';
import 'package:project_marba/src/features/business_analysis/presentation/views/business_apply_view.dart';
import 'package:project_marba/src/features/settings/presentation/views/notification_view.dart';
import 'package:project_marba/src/features/user_profile/application/current_user_profile_provider/current_user_profile_provider.dart';
import 'package:project_marba/src/features/user_profile/presentation/screens/profile_view.dart';
import 'firebase_options.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:firebase_ui_localizations/firebase_ui_localizations.dart';
import 'package:firebase_ui_auth/src/providers/email_auth_provider.dart'
    as email_auth;
import 'src/features/orders/presentation/views/user_order_details_view.dart';
import 'src/features/payment/presentation/views/user_payment_view.dart';
import 'src/features/business_analysis/presentation/views/business_submission_confirmation_view.dart';
import 'src/features/settings/presentation/views/chat_list_view.dart';
import 'src/features/settings/presentation/views/privacy_view.dart';
import 'src/features/settings/presentation/views/profile_settings_screen.dart';
import 'src/features/shopping/presentation/views/shopping_cart_view.dart';
import 'src/features/user_profile/presentation/screens/profile_form_screen.dart';
import 'theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseUIAuth.configureProviders([email_auth.EmailAuthProvider()]);
  await dotenv.load(fileName: ".env");

  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextTheme textTheme =
        createTextTheme(context, "Roboto", "Roboto Condensed");

    return _EagerInitialization(
      child: MaterialApp(
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
          '/profile': (context) => const ProfileView(),
          '/profile-form': (context) => const ProfileFormScreen(),
          '/settings': (context) => const SettingsView(),
          '/business-list': (context) => const MyBusinessesView(),
          '/business-home': (context) => const MyBusinessHomeScreen(),
          '/business-profile': (context) => const BusinessProfileScreen(),
          '/edit-offer': (context) => const EditOfferView(),
          '/offer-details': (context) => const OfferDetailsView(),
          '/shopping-cart': (context) => const ShoppingCartScreen(),
          '/checkout': (context) => const CheckoutView(),
          '/user-order-details': (context) => const UserOrderDetailsView(),
          '/addresses': (context) => const AddressView(),
          '/notifications': (context) => const NotificationsView(),
          '/privacy': (context) => const PrivacyView(),
          '/chats': (context) => const ChatListView(),
          '/business-apply': (context) => const BusinessApplyView(),
          '/business-submission-confirmation': (context) =>
              const BusinessSubmissionConfirmationView(),
          '/user-payment': (context) => const UserPaymentView(),
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
      ),
    );
  }
}

class _EagerInitialization extends ConsumerWidget {
  final Widget child;

  const _EagerInitialization({required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(currentLocationProvider);
    ref.watch(feedOffersProvider);
    ref.watch(darkModeProvider);
    ref.watch(currentUserProvider);
    ref.watch(authStateChangeProvider);
    return child;
  }
}
