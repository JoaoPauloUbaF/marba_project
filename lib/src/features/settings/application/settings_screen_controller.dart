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
    return '/profile';
  }

  String onAddressTaped() {
    bool userIsLoggedIn =
        ref.read(authRepositoryProvider).getCurrentUser() != null;
    ref.read(signInScreenControllerProvider.notifier).setGoToRoute('/settings');
    String result = userIsLoggedIn ? '/addresses' : '/sign-in';
    return result;
  }

  String onNotificationTaped() {
    bool userIsLoggedIn =
        ref.read(authRepositoryProvider).getCurrentUser() != null;
    ref.read(signInScreenControllerProvider.notifier).setGoToRoute('/settings');
    String result = userIsLoggedIn ? '/notifications' : '/sign-in';
    return result;
  }

  String onChatTaped() {
    bool userIsLoggedIn =
        ref.read(authRepositoryProvider).getCurrentUser() != null;
    ref.read(signInScreenControllerProvider.notifier).setGoToRoute('/settings');
    String result = userIsLoggedIn ? '/chats' : '/sign-in';
    return result;
  }

  String onBusinessApplyTaped() {
    bool userIsLoggedIn =
        ref.read(authRepositoryProvider).getCurrentUser() != null;
    ref.read(signInScreenControllerProvider.notifier).setGoToRoute('/settings');
    String result = userIsLoggedIn ? '/business-apply' : '/sign-in';
    return result;
  }
}
