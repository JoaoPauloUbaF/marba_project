import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:project_marba/src/features/authentication/presentation/screens/sign_in.dart';
import 'package:project_marba/src/features/darkmode/application/theme_provider.dart';
import 'package:project_marba/src/features/darkmode/presentation/components/theme_switch.dart';
import 'package:project_marba/src/features/feed/presentation/screens/home_screen.dart';
import 'firebase_options.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:firebase_ui_auth/src/providers/email_auth_provider.dart'
    as email_auth;

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
        title: 'Marba Rato', //OnQuickTem
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        darkTheme: ThemeData.dark(),
        themeMode: ref.watch(darkModeProvider),
        initialRoute: '/sign-in',
        routes: {
          '/home': (context) => const HomeScreen(),
          '/sign-in': (context) => const SignIn(),
          '/profile': (context) => ProfileScreen(
                appBar: AppBar(
                  actions: const [
                    ThemeSwitch(),
                  ],
                ),
                actions: [
                  SignedOutAction((context) {
                    Navigator.pushReplacementNamed(context, '/sign-in');
                  }),
                ],
              ),
          '/profile-form': (context) {
            return const ProfileFormScreen();
          }
        });
  }
}
