import 'package:project_marba/src/features/authentication/application/sign_in_screen_controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../authentication/data/firebase_auth_provider.dart';
part 'settings_screen_controller.g.dart';

@riverpod
class SettingsScreenController extends _$SettingsScreenController {
  @override
  FutureOr<void> build() {}

  String onAccountTaped() {
    bool userIsLoggedIn =
        ref.read(authRepositoryProvider).getCurrentUser() != null;
    ref.read(signInScreenControllerProvider.notifier).setGoToRoute('/settings');
    String result = userIsLoggedIn ? '/profile' : '/sign-in';
    return result;
  }
}
