import 'package:project_marba/src/features/authentication/data/firebase_auth_provider.dart';
import 'package:project_marba/src/features/my_business/data/business_profile_data/business_profile_provider.dart';
import 'package:project_marba/src/features/offers_management/data/offer_data_repository_provider.dart';
import 'package:project_marba/src/features/user_profile/data/user_profile_provider.dart';
import 'package:project_marba/src/shared/models/business/business.dart';
import 'package:project_marba/src/shared/models/offer/offer_model.dart';
import 'package:project_marba/src/shared/models/product/product.dart';
import 'package:project_marba/src/shared/models/service/service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'feed_screen_controller.g.dart';

@riverpod
class FeedScreenController extends _$FeedScreenController {
  @override
  FutureOr<void> build() {}

  Future<List<OfferModel>> getOffersNearby() async {
    final userRepo = ref.watch(userProfileDataProvider);
    final businessRepo = ref.watch(businessProfileDataProvider);
    final user = ref.watch(authRepositoryProvider);

    final userData =
        await userRepo.getProfileData(uid: user.getCurrentUser()?.uid ?? '');
    final userLocation = userData?.address.city;
    final business =
        await businessRepo.getBusinessesAt(city: userLocation ?? '');
    Stream<List<OfferModel>> offers = const Stream.empty();

    return [];
  }

  void onOfferSelected(OfferModel offer) {}

  List<BusinessCategory> getCategories() {
    return [];
  }

  List<ProductCategory> getProductCategories() {
    return [];
  }

  List<ServiceCategory> getServiceCategories() {
    return [];
  }
}
