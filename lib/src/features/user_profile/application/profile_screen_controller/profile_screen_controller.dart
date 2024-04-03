import 'package:project_marba/src/features/authentication/data/firebase_auth_provider.dart';
import 'package:project_marba/src/features/user_profile/data/user_profile_provider.dart';
import 'package:project_marba/src/core/models/address/address.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'profile_screen_controller.g.dart';

@riverpod
class ProfileScreenController extends _$ProfileScreenController {
  @override
  FutureOr<void> build() {}

  Future<Address?> getUserAddress() async {
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
}
