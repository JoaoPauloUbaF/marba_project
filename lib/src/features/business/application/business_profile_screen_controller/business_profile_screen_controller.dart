import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_marba/src/core/models/business/enums.dart';
import 'package:project_marba/src/features/authentication/data/firebase_auth_provider.dart';
import 'package:project_marba/src/features/business/data/business_profile_data/business_profile_provider.dart';
import 'package:project_marba/src/features/business/presentation/widgets/business_profile/edit_business_categories_dialog_widget.dart';
import 'package:project_marba/src/features/offers_management/application/offer_list/feed_offers_type_filter_provider.dart';
import 'package:project_marba/src/features/user_profile/data/user_profile_provider.dart';
import 'package:project_marba/src/core/models/business/business.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../presentation/widgets/business_modal_body/business_modal_body_widget.dart';

part 'business_profile_screen_controller.g.dart';

@Riverpod(keepAlive: true)
class BusinessProfileViewModel extends _$BusinessProfileViewModel {
  bool isOwner = false;

  @override
  BusinessModel? build() {
    return null;
  }

  void setSelectedBusiness(BusinessModel business) {
    state = business;
    fetchBusinessProfile();
  }

  String getBusinessId() {
    return state?.id ?? '';
  }

  String getBusinessName() {
    return state?.name ?? '';
  }

  Future<void> fetchBusinessProfile() async {
    ref.invalidate(feedOffersTypeFilterProvider);
    final business = await ref
        .read(businessProfileDataProvider)
        .getBusinessProfileData(uid: state!.id);
    if (business != null) {
      state = business;
    }
  }

  Color getBusinessStatusColor() {
    switch (state?.status) {
      case BusinessStatus.open:
        return Colors.green;
      case BusinessStatus.closed:
        return Colors.red;
      case BusinessStatus.pending:
        return Colors.orange;
      case BusinessStatus.rejected:
        return Colors.red;
      case BusinessStatus.suspended:
        return Colors.amber;
      case BusinessStatus.deleted:
        return Colors.black;
      default:
        return Colors.black;
    }
  }

  Future<void> updateBusinessProfileImage() async {
    final image = await pickNewBusinessProfileImage();
    if (image == null) {
      return;
    }
    ref.read(imageUploadingStatusProvider.notifier).state = true;
    await ref
        .read(businessProfileDataProvider)
        .updateBusinessProfileImage(
          uid: state?.id ?? '',
          imageFile: image,
        )
        .then((_) => {
              fetchBusinessProfile().then((value) => ref
                  .read(imageUploadingStatusProvider.notifier)
                  .state = false),
            });
  }

  Future<File?> pickNewBusinessProfileImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return null;
      final imageTemp = File(image.path);
      return imageTemp;
    } on PlatformException catch (e) {
      log('Failed to pick image: $e');
    }
    return null;
  }

  Future<Widget> getBusinessProfileImage({required double width}) async {
    return Stack(
      children: [
        state?.imageUrl != null
            ? Image(
                width: width,
                height: width * (3 / 4),
                loadingBuilder: (context, child, loadingProgress) =>
                    loadingProgress == null
                        ? child
                        : const Center(
                            child: CircularProgressIndicator(),
                          ),
                fit: BoxFit.fill,
                image: NetworkImage(
                  state?.imageUrl ?? '',
                ),
              )
            : InkWell(
                onTap: () => updateBusinessProfileImage(),
                child: SizedBox(
                  width: width,
                  child: const Icon(Icons.add_a_photo_sharp, size: 100),
                ),
              ),
        if (await isThisBusinessOwner() && state?.imageUrl != null)
          Positioned(
            bottom: 20,
            right: 10,
            child: InkWell(
              onTap: () => updateBusinessProfileImage(),
              child: const Icon(
                Icons.add_a_photo,
                shadows: [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 10,
                  )
                ],
              ),
            ),
          ),
      ],
    );
  }

  Future<bool> isThisBusinessOwner({String? businessId}) async {
    //TODO: refactor usages
    businessId ??= state?.id;
    final userId = ref.read(authRepositoryProvider).getCurrentUser()?.uid;
    if (userId == null) {
      return false;
    }
    final userBusinessIds = await ref
        .read(userProfileDataProvider)
        .getOwnedBusinessIds(uid: userId);
    isOwner = userBusinessIds.contains(businessId);
    return userBusinessIds.contains(businessId);
  }

  void dispose() {
    state = null;
  }

  void updateBusinessName(BuildContext context, String text) {
    ref
        .read(businessProfileDataProvider)
        .updateBusinessName(
          uid: state?.id ?? '',
          businessName: text,
        )
        .then((value) => fetchBusinessProfile());
  }

  void changeBusinessStatus({required String status}) {
    final statusMap = {
      'Aberto': BusinessStatus.open,
      'Fechado': BusinessStatus.closed,
      'Pendente': BusinessStatus.pending,
      'Rejeitado': BusinessStatus.rejected,
      'Suspenso': BusinessStatus.suspended,
      'Deletado': BusinessStatus.deleted,
    };
    ref
        .read(businessProfileDataProvider)
        .updateBusinessStatus(
          uid: state?.id ?? '',
          status: statusMap[status] ?? BusinessStatus.open,
        )
        .then((value) => fetchBusinessProfile());
  }

  void updateBusinessPhoneNumber(String text) {
    ref
        .read(businessProfileDataProvider)
        .updateBusinessPhoneNumber(
          uid: state?.id ?? '',
          businessPhoneNumber: text,
        )
        .then((value) => fetchBusinessProfile());
  }

  void updateBusinessEmail(String text) {
    ref
        .read(businessProfileDataProvider)
        .updateBusinessEmail(
          uid: state?.id ?? '',
          businessEmail: text,
        )
        .then((value) => fetchBusinessProfile());
  }

  void updateBusinessDelivery(double parse) {
    ref
        .read(businessProfileDataProvider)
        .updateBusinessDelivery(
          uid: state?.id ?? '',
          deliveryFee: parse,
        )
        .then((value) => fetchBusinessProfile());
  }

  Future<void> updateBusinessAddress(
      {required String businessId,
      required Map<String, String> address}) async {
    //TODO: refactor to require address model
    ref
        .read(businessProfileDataProvider)
        .updateBusinessAddress(
          uid: businessId,
          address: address,
        )
        .then((value) => fetchBusinessProfile());
  }

  Future<void> updateBusinessCategories(
      {required Set<BusinessCategory> categories}) async {
    ref
        .read(businessProfileDataProvider)
        .updateBusinessCategory(
          uid: state?.id ?? '',
          businessCategories: categories.toList(),
        )
        .then((value) => fetchBusinessProfile());
  }

  Future<dynamic> showUpdateCategoriesDialog(
    BuildContext context,
  ) {
    final businessCategories = state?.categories;
    if (!isOwner) return Future.value();

    return showDialog(
      context: context,
      builder: (context) => EditBusinessCategoriesDialogWidget(
        businessCategories: businessCategories,
      ),
    );
  }

  onBusinessDetailsTap(
    BuildContext context,
    BusinessModel business,
  ) {
    setSelectedBusiness(business);
    showModalBottomSheet(
      scrollControlDisabledMaxHeightRatio: .9,
      context: context,
      builder: (BuildContext context) {
        return BusinessDetailsModalBodyWidget(
          businessName: business.name,
        );
      },
    );
  }
}

final imageUploadingStatusProvider = StateProvider<bool>((ref) => false);
