import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:project_marba/src/features/authentication/application/sign_in_screen_controller.dart';
import 'package:project_marba/src/features/darkmode/presentation/components/theme_switch_widget.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          ThemeSwitchWidget(),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: SafeArea(
            child: Consumer(
              builder: (_, WidgetRef ref, __) {
                return FirebaseLogin(ref: ref);
              },
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
        AuthStateChangeAction<UserCreated>((context, state) {
          ref
              .read(signInScreenControllerProvider.notifier)
              .showSuccessAndNavigate(context);
        }),
        AuthStateChangeAction<AuthFailed>((context, state) {
          // Cria a snackbar
          final snackBar = SnackBar(
            content: ErrorText(exception: state.exception),
            action: SnackBarAction(
              label: 'OK',
              onPressed: () {
                // Fecha a snackbar quando o botão "OK" é pressionado
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
              },
            ),
          );

          // Mostra a snackbar
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }),
      ],
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.1),
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
