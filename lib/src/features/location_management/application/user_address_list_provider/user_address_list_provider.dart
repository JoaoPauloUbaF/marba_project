import 'package:project_marba/src/features/authentication/data/firebase_auth_provider.dart';
import 'package:project_marba/src/features/user_profile/data/user_profile_provider.dart';
import 'package:project_marba/src/core/models/address/address.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'user_address_list_provider.g.dart';

@riverpod
Stream<List<AddressModel>> userAddressList(UserAddressListRef ref) {
  ref.watch(authStateChangeProvider);
  final user = ref.watch(authRepositoryProvider).getCurrentUser();
  if (user != null) {
    Future.delayed(const Duration(milliseconds: 1000));
    return ref
        .watch(userProfileDataProvider)
        .getDeliveryAddresses(uid: user.uid);
  }
  return const Stream.empty();
}
