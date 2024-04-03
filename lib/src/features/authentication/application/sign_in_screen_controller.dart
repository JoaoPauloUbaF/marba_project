import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_marba/src/features/authentication/data/firebase_auth_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sign_in_screen_controller.g.dart';

@Riverpod(keepAlive: true)
class SignInScreenController extends _$SignInScreenController {
  @override
  String build() {
    return '/home';
  }

  Future<void> onSignIn(BuildContext context, SignedIn state,
      {String goTo = '/home'}) async {
    await ref
        .read(authRepositoryProvider)
        .checkUserRegistration(state.user?.uid ?? '')
        .then(
          (value) => value
              ? Navigator.pushReplacementNamed(context, '/home')
              : Navigator.pushReplacementNamed(context, '/profile-form'),
        );
  }

  void showSuccessAndNavigate(BuildContext context) {
    // Cria a snackbar
    final snackBar = SnackBar(
      content: const Text('Criação foi um sucesso!'),
      action: SnackBarAction(
        label: 'OK',
        onPressed: () {
          // Fecha a snackbar quando o botão "OK" é pressionado
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        },
      ),
    );

    // Mostra a snackbar
    ScaffoldMessenger.of(context).showSnackBar(snackBar).closed.then(
      (reason) {
        // Navega para a tela de sign-in após a snackbar ser fechada
        Navigator.pushNamedAndRemoveUntil(
            context, '/profile-form', (route) => false);
      },
    );
  }

  void setGoToRoute(String route) {
    state = route;
  }
}
