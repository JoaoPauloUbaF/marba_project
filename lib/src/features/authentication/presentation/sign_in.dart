import 'package:flutter/material.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SignInScreen(
      providers: [],
      actions: [
        AuthStateChangeAction((context, state) {
          Navigator.pushReplacementNamed(context, '/profile');
        })
      ],
    );
  }
}
