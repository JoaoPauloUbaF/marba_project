import 'package:project_marba/src/features/authentication/data/firebase_auth_provider.dart';
import 'package:project_marba/src/features/user_profile/data/user_profile_provider.dart';
import 'package:project_marba/src/shared/models/address/address.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'user_address_list_provider.g.dart';

@riverpod
class UserAddressList extends _$UserAddressList {
  @override
  Stream<List<Address>> build() {
    Stream<List<Address>> addresses = Stream.empty();
    final user = ref.watch(authRepositoryProvider).getCurrentUser();
    if (user != null) {
      addresses = ref
          .watch(userProfileDataProvider)
          .getDeliveryAddresses(uid: user.uid);
    }
    return addresses;
  }
}
