import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../offers_management/data/offer_data_repository_provider.dart';

part 'my_business_offers_screen_controller.g.dart';

@Riverpod(keepAlive: true)
class MyBusinessOffersScreenController
    extends _$MyBusinessOffersScreenController {
  @override
  FutureOr<void> build() {}

  Future<void> fetchBusinessOffers(String businessId) async {
    final offers = await ref
        .read(offerRepositoryProviderProvider)
        .getOffersByBusinessId(businessId);
    ref.read(businessOffersProviderProvider).addAll(offers);
  }
}
