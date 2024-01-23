import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:project_marba/src/features/darkmode/presentation/theme_switch.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            const ThemeSwitch(),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FirebaseUIActions(
                    actions: [
                      AuthStateChangeAction<SignedIn>((context, state) {
                        Navigator.pushReplacementNamed(context, '/home');
                      }),
                    ],
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: LoginView(
                          showPasswordVisibilityToggle: true,
                          action: AuthAction.signIn,
                          providers: FirebaseUIAuth.providersFor(
                            FirebaseAuth.instance.app,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
