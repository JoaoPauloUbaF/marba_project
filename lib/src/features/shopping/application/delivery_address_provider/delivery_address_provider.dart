import 'package:project_marba/src/features/location_management/application/current_location_provider/current_location_provider.dart';
import 'package:project_marba/src/features/location_management/application/user_address_list_provider/user_address_list_provider.dart';
import 'package:project_marba/src/core/models/address/address.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'delivery_address_provider.g.dart';

@Riverpod(keepAlive: true)
class DeliveryAddress extends _$DeliveryAddress {
  @override
  Future<Address?> build() {
    Address? address;
    ref
        .read(userAddressListProvider)
        .whenData((value) => address = value.first);

    return Future.value(address);
  }

  setDeliveryAddress(Address userAddress) {
    state = AsyncValue.data(userAddress);
    ref
        .read(currentLocationProvider.notifier)
        .setCurrentLocationAddress(userAddress);
  }

  fetchDeliveryAddress() {
    ref.read(userAddressListProvider).whenData((value) {
      state = AsyncValue.data(value.first);
    });
  }
}
