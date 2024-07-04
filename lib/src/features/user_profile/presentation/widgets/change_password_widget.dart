import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import '../../application/profile_screen_controller/profile_screen_controller.dart';

class ChangePasswordWidget extends ConsumerStatefulWidget {
  const ChangePasswordWidget({
    super.key,
  });

  @override
  ConsumerState<ChangePasswordWidget> createState() =>
      _ChangePasswordWidgetState();
}

class _ChangePasswordWidgetState extends ConsumerState<ChangePasswordWidget> {
  final _formKey = GlobalKey<FormState>();
  final _currentPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  bool _showResult = false;
  String result = '';
  bool _isLoading = false;

  @override
  void dispose() {
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = ref.watch(profileScreenControllerProvider.notifier);

    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Alterar senha',
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge
                    ?.copyWith(color: Theme.of(context).colorScheme.primary),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _currentPasswordController,
                decoration: const InputDecoration(
                  labelText: 'Senha atual',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(horizontal: 8),
                ),
                validator: (value) => viewModel.validateCurrentPassword(value),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _newPasswordController,
                decoration: const InputDecoration(
                  labelText: 'Nova senha',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(horizontal: 8),
                ),
                validator: (value) => viewModel.validateNewPassword(value),
              ),
              const Gap(16),
              Visibility(
                visible: _showResult,
                child: Container(
                  decoration: BoxDecoration(
                    color: result == 'Senha atualizada com sucesso'
                        ? Colors.green
                        : Colors.red,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      result,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              const Gap(16),
              _isLoading
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            _isLoading = true;
                            _showResult = false;
                          });
                          result = await viewModel.changePassword(
                            currentPassword: _currentPasswordController.text,
                            newPassword: _newPasswordController.text,
                          );
                          setState(() {
                            _isLoading = false;
                            _showResult = true;
                          });
                        }
                      },
                      child: const Text('Salvar'),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
