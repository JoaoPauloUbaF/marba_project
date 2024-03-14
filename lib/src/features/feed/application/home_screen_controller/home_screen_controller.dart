import 'package:project_marba/src/features/authentication/data/firebase_auth_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../user_profile/data/user_profile_provider.dart';

part 'home_screen_controller.g.dart';

@riverpod
class HomeScreenController extends _$HomeScreenController {
  @override
  int build() {
    return 0;
  }

  Future<bool?> hasBusiness() async {
    final hasBusiness = await ref
        .read(userProfileDataProvider)
        .getOwnedBusinessIds(
            uid: ref.read(authRepositoryProvider).getCurrentUser()!.uid);
    return hasBusiness.isNotEmpty;
  }
}
