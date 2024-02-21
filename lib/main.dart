// ignore_for_file: implementation_imports

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:project_marba/src/features/authentication/presentation/screens/sign_in.dart';
import 'package:project_marba/src/features/business_profile/presentation/screens/my_business_list_screen.dart';
import 'package:project_marba/src/features/darkmode/application/theme_provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:project_marba/src/features/feed/presentation/screens/home_screen.dart';
import 'package:project_marba/src/features/user_profile/presentation/screens/app_profile_screen.dart';
import 'firebase_options.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:firebase_ui_localizations/firebase_ui_localizations.dart';
import 'package:firebase_ui_auth/src/providers/email_auth_provider.dart'
    as email_auth;

import 'src/features/settings/presentation/settings_screen.dart';
import 'src/features/user_profile/presentation/screens/profile_form_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseUIAuth.configureProviders([email_auth.EmailAuthProvider()]);
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Marba Rato', //Onkten
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      darkTheme: ThemeData.dark(),
      themeMode: ref.watch(darkModeProvider),
      initialRoute: '/home',
      routes: {
        '/home': (context) => const HomeScreen(),
        '/sign-in': (context) => const SignIn(),
        '/profile': (context) => const AppProfileScreen(),
        '/profile-form': (context) => const ProfileFormScreen(),
        '/settings': (context) => const SettingsScreen(),
        '/business-list': (context) => const MyBusinessListScreen(),
      },
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        FirebaseUILocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('pt', 'BR'), // Português Brasil
        // Adicione outros idiomas que você deseja suportar
      ],
    );
  }
}
