import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_marba/src/features/authentication/data/firebase_auth_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sign_in_screen_controller.g.dart';

@riverpod
class SignInScreenController extends _$SignInScreenController {
  @override
  FutureOr<void> build() {}

  Future<void> onSignIn(BuildContext context, SignedIn state) async {
    await ref
        .read(authRepositoryProvider)
        .checkUserRegistration(state.user?.uid ?? '')
        .then(
          (value) => value
              ? Navigator.pushReplacementNamed(context, '/home')
              : Navigator.pushReplacementNamed(context, '/profile-form'),
        );
  }
}
