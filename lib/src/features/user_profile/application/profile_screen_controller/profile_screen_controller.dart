import 'package:flutter/material.dart';
import 'package:project_marba/src/features/authentication/data/firebase_auth_provider.dart';
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
        .getProfileData(uid: userAuthRepository.getCurrentUser()!.uid);
    return userData?.address;
  }

  Future<String?> getUserPhoneNumber() async {
    final userAuthRepository = ref.read(authRepositoryProvider);
    final userData = await ref
        .read(userProfileDataProvider)
        .getProfileData(uid: userAuthRepository.getCurrentUser()!.uid);
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
        'onPressed': () {},
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
}

enum ProfileViewState { initial, loading, loaded, error }
