import 'package:project_marba/src/features/my_business/application/business_profile_screen_controller/business_profile_screen_controller.dart';
import 'package:project_marba/src/features/offers_management/data/offer_data_repository_provider.dart';
import 'package:project_marba/src/shared/models/offer/offer_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'business_offers_provider.g.dart';

@riverpod
class BusinessOffers extends _$BusinessOffers {
  @override
  Stream<List<OfferModel>> build() {
    final business = ref.read(businessProfileScreenControllerProvider);
    if (business?.id == null) {
      return const Stream.empty();
    }
    return ref.read(offerRepositoryProviderProvider).getOffersByBusinessId(
        ref.read(businessProfileScreenControllerProvider)!.id);
  }
}
