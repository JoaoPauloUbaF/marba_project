import 'package:project_marba/src/features/shopping/application/delivery_address_provider/delivery_address_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'cart_address_view_model.g.dart';

@riverpod
class CartAddressViewModel extends _$CartAddressViewModel {
  @override
  FutureOr<void> build() {}

  AsyncValue getSelectedDeliveryAddress() {
    return ref.watch(deliveryAddressProvider);
  }
}
