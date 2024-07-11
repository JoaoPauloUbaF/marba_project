import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class TwoFactorAuthWidget extends StatefulWidget {
  const TwoFactorAuthWidget({super.key});

  @override
  State<TwoFactorAuthWidget> createState() => _TwoFactorAuthWidgetState();
}

class _TwoFactorAuthWidgetState extends State<TwoFactorAuthWidget> {
  bool _is2FAEnabled = false;
  bool _isEmailEnabled = false;
  bool _isSMSEnabled = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Autenticação de dois fatores',
              style: theme.textTheme.titleLarge?.copyWith(
                color: theme.colorScheme.primary,
              ),
            ),
            const Gap(20),
            Text(
              'EM BREVE!',
              style: theme.textTheme.headlineMedium?.copyWith(
                color: theme.colorScheme.onSurface,
              ),
            ),
            const Gap(10),
            Text(
              '  A autenticação de dois fatores é uma camada adicional de segurança para sua conta. \n  Quando ativada, você precisará de um código de verificação para fazer login.',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurface,
              ),
            ),
            const Gap(20),
            SwitchListTile(
              value: _is2FAEnabled,
              onChanged: (value) {
                setState(() {
                  _is2FAEnabled = value;
                  if (!value) {
                    _isEmailEnabled = false;
                    _isSMSEnabled = false;
                  }
                });
              },
              title: const Text('Ativar autenticação de dois fatores'),
            ),
            if (_is2FAEnabled) ...[
              RadioListTile<bool>(
                value: true,
                groupValue: _isEmailEnabled,
                onChanged: (value) {
                  setState(() {
                    _isEmailEnabled = true;
                    _isSMSEnabled = false;
                  });
                },
                title: const Text('Usar Email para 2FA'),
              ),
              RadioListTile<bool>(
                value: true,
                groupValue: _isSMSEnabled,
                onChanged: (value) {
                  setState(() {
                    _isEmailEnabled = false;
                    _isSMSEnabled = true;
                  });
                },
                title: const Text('Usar SMS para 2FA'),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
