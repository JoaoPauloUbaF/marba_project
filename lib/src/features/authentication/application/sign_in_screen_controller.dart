import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_marba/main.dart';
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
              ? navigatorKey.currentState?.pop()
              : navigatorKey.currentState
                  ?.pushReplacementNamed('/profile-form'),
        );
  }

  void goToUserForm(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(
        context, '/profile-form', (route) => false);
  }

  void setGoToRoute(String route) {
    state = route;
  }
}
