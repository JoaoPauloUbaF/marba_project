import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:project_marba/src/features/authentication/application/sign_in_screen_controller.dart';
import 'package:project_marba/src/features/authentication/data/firebase_auth_provider.dart';
import 'package:project_marba/src/features/darkmode/presentation/components/theme_switch.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          ThemeSwitch(),
        ],
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: SafeArea(
            child: Stack(
              children: [
                Consumer(
                  builder: (_, WidgetRef ref, __) {
                    return FirebaseLogin(ref: ref);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FirebaseLogin extends StatelessWidget {
  final WidgetRef ref;

  const FirebaseLogin({
    super.key,
    required this.ref,
  });

  @override
  Widget build(BuildContext context) {
    return FirebaseUIActions(
      actions: [
        AuthStateChangeAction<SignedIn>((_, state) async {
          await ref
              .read(signInScreenControllerProvider.notifier)
              .onSignIn(context, state);
        }),
      ],
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
    );
  }
}