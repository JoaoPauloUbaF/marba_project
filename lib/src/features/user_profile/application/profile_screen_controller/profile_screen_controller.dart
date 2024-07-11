import 'dart:async';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_marba/src/features/authentication/data/firebase_auth_provider.dart';
import 'package:project_marba/src/features/user_profile/application/current_user_profile_provider/current_user_profile_provider.dart';
import 'package:project_marba/src/features/user_profile/data/user_profile_provider.dart';
import 'package:project_marba/src/core/models/address/address.dart';
import 'package:project_marba/src/features/user_profile/presentation/widgets/two_factor_auth_widget.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../presentation/widgets/change_password_widget.dart';

part 'profile_screen_controller.g.dart';

@riverpod
class ProfileScreenController extends _$ProfileScreenController {
  final List<AssetImage> avatars = List.generate(
    19,
    (index) => AssetImage('assets/avatars/avatar$index.png'),
  );

  @override
  ProfileViewState build() {
    return ProfileViewState.initial;
  }

  Future<AddressModel?> getUserAddress() async {
    final userAuthRepository = ref.read(authRepositoryProvider);
    final userData = await ref
        .read(userProfileDataProvider)
        .getProfileData(uid: userAuthRepository.getCurrentUser()!.uid)
        .first;
    return userData?.address;
  }

  Future<String?> getUserPhoneNumber() async {
    final userAuthRepository = ref.read(authRepositoryProvider);
    final userData = await ref
        .read(userProfileDataProvider)
        .getProfileData(uid: userAuthRepository.getCurrentUser()!.uid)
        .first;
    return userData?.phoneNumber;
  }

  Future<ImageProvider<Object>> getProfileImage() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    if (sharedPreferences.getString('photoURL') != null) {
      return AssetImage(sharedPreferences.getString('photoURL')!);
    } else {
      return const AssetImage('assets/avatars/avatar1.png');
    }
  }

  Future<void> updateProfileImage(String assetName) async {
    state = ProfileViewState.loading;
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.setString('photoURL', assetName);
    state = ProfileViewState.loaded;
  }

  List<Map<String, Object>> getUserSettingsCardsContent(BuildContext context) {
    final userSettingsCardsContent = [
      {
        'icon': Icons.lock_sharp,
        'title': 'Senha',
        'onPressed': () {
          showDialog(
            context: context,
            builder: (context) {
              return const ChangePasswordWidget();
            },
          );
        }
      },
      {
        'icon': Icons.security_sharp,
        'title': '2FA',
        'onPressed': () {
          showDialog(
            context: context,
            builder: (context) {
              return const TwoFactorAuthWidget();
            },
          );
        },
      },
      {
        'icon': Icons.credit_card_sharp,
        'title': 'Pagamentos',
        'onPressed': () {
          Navigator.pushNamed(context, '/user-payment');
        },
      },
      {
        'icon': Icons.discount_sharp,
        'title': 'Cupons',
        'onPressed': () {},
      },
      {
        'icon': Icons.help_sharp,
        'title': 'Ajuda',
        'onPressed': () {},
      },
    ];
    return userSettingsCardsContent;
  }

  validateCurrentPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Campo obrigatório';
    }
  }

  validateNewPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Campo obrigatório';
    }
  }

  Future<String> changePassword(
      {required String currentPassword, required String newPassword}) {
    final userAuthRepository = ref.read(authRepositoryProvider);
    return userAuthRepository.changePassword(
      currentPassword: currentPassword,
      newPassword: newPassword,
    );
  }

  Future<void> updatePhoneNumber(String value) async {
    state = ProfileViewState.loading;
    final userProfileRepository = ref.read(userProfileDataProvider);
    final user = ref.read(currentUserProvider);
    if (value.isEmpty || value == user?.phoneNumber || user == null) {
      state = ProfileViewState.loaded;
      return;
    }
    await userProfileRepository
        .updateProfile(user: user.copyWith(phoneNumber: value))
        .catchError((error) {
      log(error.toString());
      state = ProfileViewState.loaded;
    }).then((_) {
      state = ProfileViewState.loaded;
    });
  }

  Future<void> updateDisplayName(String value, User? user) async {
    if (value.isEmpty || value == user?.displayName) {
      return;
    }
    state = ProfileViewState.loading;
    await user?.updateDisplayName(value);
    //ref.read(userProfileDataProvider).updateDisplayName(value, user?.uid);
    state = ProfileViewState.loaded;
  }

  Future<void> updateEmail(String newEmail, BuildContext context) async {
    final user = FirebaseAuth.instance.currentUser;

    if (newEmail.isEmpty || newEmail == user?.email || user == null) {
      return;
    }
    final result = await showDialog<bool>(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Troca de e-mail'),
            content: RichText(
              text: TextSpan(
                style: DefaultTextStyle.of(context)
                    .style, // Use the default text style of the context
                children: <TextSpan>[
                  const TextSpan(text: 'Opa! Para trocar seu e-mail para '),
                  TextSpan(
                    text: newEmail, // Highlight newEmail
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight
                            .bold), // Make newEmail bold or use any other style
                  ),
                  const TextSpan(
                      text:
                          ', é necessário que logue novamente. Deseja continuar?'),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: const Text('Cancelar'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed(
                    '/sign-in',
                  )
                      .then((_) {
                    Navigator.of(context).pop(true);
                  });
                },
                child: const Text('Confirmar'),
              ),
            ],
          );
        });
    if (result == true) {
      state = ProfileViewState.loading;
      await ref
          .read(authRepositoryProvider)
          .changeEmail(newEmail: newEmail)
          .then((_) async {
        state = ProfileViewState.loaded;
        await showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Sucesso'),
              content: const Text(
                  'Foi enviado um e-mail de confirmação. Sua sessão será encerrada, por favor, confirme o e-mail e logue novamente.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Ok'),
                ),
              ],
            );
          },
        ).then((_) {
          startEmailCheckTimer(context, newEmail);
        });
      }).catchError((error) {
        log(error.toString());
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Erro'),
              content: Text(
                  'Erro ao atualizar e-mail: $error, tente novamente mais tarde.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Ok'),
                ),
              ],
            );
          },
        );
        state = ProfileViewState.loaded;
      });
    }
  }

  void startEmailCheckTimer(BuildContext context, String newEmail) {
    Timer.periodic(const Duration(seconds: 5), (timer) async {
      final user = FirebaseAuth.instance.currentUser;

      if (user == null) {
        log('User is null');
        return;
      }

      await user.reload().catchError((error) {
        timer.cancel();
        log(error.toString());
      });
    });
  }
}

enum ProfileViewState { initial, loading, loaded, error }
