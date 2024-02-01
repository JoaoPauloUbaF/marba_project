import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:project_marba/src/features/authentication/data/authentication_data_provider.dart';
import 'package:project_marba/src/features/darkmode/presentation/theme_switch.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: const [
        ThemeSwitch(),
      ]),
      body: Center(
        child: SingleChildScrollView(
          child: SafeArea(
            child: Stack(
              children: [
                Consumer(
                  builder: (_, WidgetRef ref, __) {
                    return FirebaseUIActions(
                      actions: [
                        AuthStateChangeAction<SignedIn>((context, state) async {
                          bool isRegistered = await ref
                              .read(authRepositoryProvider)
                              .checkUserRegistration(state.user?.uid ?? '');

                          if (isRegistered) {
                            // Usuário já registrado, redirecione para a tela principal
                            Navigator.pushReplacementNamed(context, '/home');
                          } else {
                            // Usuário não registrado, redirecione para a tela de formulário
                            Navigator.pushReplacementNamed(
                                context, '/profile-form');
                          }
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
