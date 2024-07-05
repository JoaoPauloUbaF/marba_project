import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class VerifyEmailWidget extends StatelessWidget {
  final User? user;
  final VoidCallback onDismiss;

  const VerifyEmailWidget({
    super.key,
    required this.user,
    required this.onDismiss,
  });

  @override
  Widget build(BuildContext context) {
    if (user == null || user!.emailVerified) {
      return const SizedBox.shrink();
    }

    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Text(
            'Email não verificado',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  user?.sendEmailVerification();
                  onDismiss();
                },
                child: Text(
                  'Enviar email de verificação',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Theme.of(context).colorScheme.secondaryContainer,
                      ),
                ),
              ),
              TextButton(
                onPressed: onDismiss,
                child: Text(
                  'Dispensar',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Theme.of(context).colorScheme.errorContainer,
                      ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
