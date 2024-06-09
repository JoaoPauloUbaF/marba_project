import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/models/business/business.dart';
import '../../../business/data/business_profile_data/business_profile_provider.dart';
import '../../../location_management/application/current_location_provider/current_location_provider.dart';
part 'hot_businesses_provider.g.dart';

@riverpod
class HotBusinesses extends _$HotBusinesses {
  @override
  Future<List<BusinessModel>?> build() {
    return Future.value([]);
  }

  Future<void> fetchHotBusinesses() async {
    state = const AsyncValue.loading();

    try {
      await Future.delayed(const Duration(seconds: 2)); // Simulate loading
      final location =
          ref.read(currentLocationProvider).requireValue?.city ?? '';

      final businesses = await ref
          .read(businessProfileDataProvider)
          .getBusinessesAt(city: location);
      state = AsyncValue.data(businesses);
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    }
  }
}
