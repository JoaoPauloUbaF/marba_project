import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diacritic/diacritic.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:project_marba/src/core/models/business/business.dart';
import 'package:project_marba/src/core/models/review/review_model.dart';
import 'package:project_marba/src/core/utils/translations_utils.dart';
import 'package:riverpod/riverpod.dart';

import '../../../../core/models/address/address.dart';
import '../../../../core/models/business/enums.dart';
import 'business_profile_data_repository.dart';

final firestoreBusinessProfileDataProvider =
    Provider<BusinessProfileDataRepository>((ref) {
  return BusinessFirebaseProfileDataProvider();
});

/// A data provider for managing business profiles in Firebase.
class BusinessFirebaseProfileDataProvider
    implements BusinessProfileDataRepository {
  final CollectionReference _businessCollection =
      FirebaseFirestore.instance.collection('businesses');

  // *** Business Profile CRUD Operations ***

  @override
  Future<DocumentSnapshot?> createBusinessProfile({
    required BusinessModel business,
  }) async {
    await _businessCollection.doc(business.id).set(business.toJson());
    return await _businessCollection.doc(business.id).get();
  }

  @override
  Future<void> updateBusinessProfile({
    required BusinessModel business,
  }) async {
    await _businessCollection.doc(business.id).update(business.toJson());
  }

  @override
  Future<void> deleteBusinessProfile({required String uid}) async {
    await _businessCollection.doc(uid).delete().then((value) async {
      await deleteBusinessFolder(uid: uid);
      log('Business profile deleted');
    }).catchError((error) {
      log('Error deleting business profile: $error');
    });
  }

  @override
  Future<BusinessModel?> getBusinessProfileData({required String uid}) async {
    DocumentSnapshot docSnapshot = await _businessCollection.doc(uid).get();
    if (docSnapshot.exists) {
      Map<String, dynamic> data = docSnapshot.data() as Map<String, dynamic>;
      data.remove('reviews');
      final business = BusinessModel.fromJson(data);
      return business;
    } else {
      return null;
    }
  }

  @override
  Future<void> deleteBusinessFolder({required String uid}) async {
    String storagePath = 'business_profile_images/$uid';
    Reference storageRef = FirebaseStorage.instance.ref().child(storagePath);

    // List all files and folders inside the business folder
    ListResult result = await storageRef.listAll();

    // Delete all files
    for (Reference fileRef in result.items) {
      await fileRef.delete();
    }

    // Delete all subfolders recursively
    for (Reference folderRef in result.prefixes) {
      await deleteFolderContents(folderRef);
    }
  }

  Future<void> deleteFolderContents(Reference folderRef) async {
    // List all files and folders inside the folder
    ListResult result = await folderRef.listAll();

    // Delete all files
    for (Reference fileRef in result.items) {
      await fileRef.delete();
    }

    // Delete all subfolders recursively
    for (Reference subfolderRef in result.prefixes) {
      await deleteFolderContents(subfolderRef);
    }
  }

  // *** Business Profile Updates ***

  @override
  Future<void> updateBusinessName({
    required String uid,
    required String businessName,
  }) async {
    final business = await getBusinessProfileData(uid: uid);
    if (business == null) return;
    await updateBusinessProfile(
        business: business.copyWith(
            name: businessName,
            nameWords: businessName.toLowerCase().split(" ")));
  }

  @override
  Future<void> updateBusinessEmail({
    required String uid,
    required String businessEmail,
  }) async {
    final business = await getBusinessProfileData(uid: uid);
    if (business == null) return;
    await updateBusinessProfile(
        business: business.copyWith(email: businessEmail));
  }

  @override
  Future<void> updateBusinessPhoneNumber({
    required String uid,
    required String businessPhoneNumber,
  }) async {
    final business = await getBusinessProfileData(uid: uid);
    if (business == null) return;
    await updateBusinessProfile(
        business: business.copyWith(phoneNumber: businessPhoneNumber));
  }

  @override
  Future<void> updateBusinessAddress({
    required String uid,
    required Map<String, dynamic> address,
  }) async {
    final business = await getBusinessProfileData(uid: uid);
    if (business == null) return;
    await updateBusinessProfile(
        business: business.copyWith(address: AddressModel.fromJson(address)));
  }

  @override
  Future<void> updateBusinessStatus({
    required String uid,
    required BusinessStatus status,
  }) async {
    final business = await getBusinessProfileData(uid: uid);
    if (business == null) return;
    await updateBusinessProfile(business: business.copyWith(status: status));
  }

  @override
  Future<void> updateBusinessCategory({
    required String uid,
    required List<BusinessCategory> businessCategories,
  }) async {
    final businessCategoriesWords = businessCategories
        .map((e) =>
            removeDiacritics(getBusinessCategoryTranslation(e).toLowerCase()))
        .toSet();
    final business = await getBusinessProfileData(uid: uid);
    if (business == null) return;
    await updateBusinessProfile(
        business: business.copyWith(
            categories: businessCategories.toSet(),
            categoriesWords: businessCategoriesWords));
  }

  @override
  Future<void> updateBusinessOpeningHours({
    required String uid,
    required openingHours,
  }) {
    return _businessCollection.doc(uid).update({
      'openingHours': openingHours,
    });
  }

  @override
  Future<void> updateBusinessOffers({
    required String uid,
    required Set<String> offersIds,
  }) {
    return _businessCollection.doc(uid).update({
      'offersIds': offersIds.toList(),
    });
  }

  @override
  Future<void> updateBusinessProfileImage({
    required String uid,
    required File imageFile,
  }) async {
    String storagePath = 'business_profile_images/$uid/profileImage';
    Reference storageRef = FirebaseStorage.instance.ref().child(storagePath);
    UploadTask uploadTask = storageRef.putFile(imageFile);
    TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);
    String downloadUrl = await taskSnapshot.ref.getDownloadURL();
    final business = await getBusinessProfileData(uid: uid);
    if (business == null) return;
    await updateBusinessProfile(
      business: business.copyWith(profileImageUrl: downloadUrl),
    );
  }

  @override
  Future<void> updateBusinessDelivery({
    required String uid,
    required double deliveryFee,
  }) {
    return _businessCollection.doc(uid).update({
      'deliveryFee': deliveryFee,
    });
  }

  // *** Business Queries ***

  @override
  Future<List<BusinessModel>?> queryBusinessAt({
    required String queryStr,
    required String city,
  }) async {
    List<BusinessModel> businesses = [];

    final businessByName =
        await queryBusinessesByName(city: city, queryStr: queryStr);
    if (businessByName != null) {
      businesses.addAll(businessByName);
    }

    queryStr = normalizeString(str: queryStr);
    final List<String> categoriesMatches = businessCategoryTranslations.entries
        .where(
            (element) => normalizeString(str: element.value).contains(queryStr))
        .map((e) => e.key.name)
        .toList();

    final businessByCategory = await queryBusinessesByCategory(
        city: city, categories: categoriesMatches.take(30).toList());
    if (businessByCategory != null) {
      businesses.addAll(businessByCategory);
    }

    return businesses;
  }

  @override
  Future<List<BusinessModel>?> queryBusinessesByCategory({
    required String city,
    required List<String> categories,
  }) {
    if (categories.isEmpty) {
      return Future(() => null);
    }
    Query query = _businessCollection
        .where('categories', arrayContainsAny: categories)
        .where('address.city', isEqualTo: city);

    return getBusinesses(query: query);
  }

  @override
  Future<List<BusinessModel>?> getBusinesses({required Query query}) {
    return query.get().then((querySnapshot) {
      if (querySnapshot.docs.isEmpty) {
        return null;
      }
      final businesses = querySnapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        final business = BusinessModel.fromJson(data);
        return business;
      }).toList();

      return businesses;
    });
  }

  @override
  getBusinessesAt({required String city}) async {
    Query query = _businessCollection.where('address.city', isEqualTo: city);
    return await getBusinesses(query: query);
  }

  @override
  Future<List<BusinessModel>?> queryBusinessesByName({
    required String city,
    required String queryStr,
  }) {
    Query query = _businessCollection
        .where('nameWords', arrayContainsAny: queryStr.toLowerCase().split(" "))
        .where('address.city', isEqualTo: city);

    return getBusinesses(query: query);
  }

  // *** Business Delivery Fee ***

  @override
  Future<double> getBusinessDeliveryFee(businessId) async {
    try {
      final docSnapshot = await _businessCollection.doc(businessId).get();
      if (docSnapshot.exists) {
        final data = docSnapshot.data() as Map<String, dynamic>;
        return data['deliveryFee'] ?? 0.0;
      } else {
        return 0.0;
      }
    } catch (e) {
      log('Error getting delivery fee: $e');
      return 0.0;
    }
  }

  // *** Reviews ***
  @override
  Future<List<ReviewModel>> fetchReviews({
    required String businessId,
    String? lastReviewId,
    int limit = 3,
  }) async {
    Query query = _businessCollection
        .doc(businessId)
        .collection('reviews')
        .orderBy('createdAt', descending: true)
        .limit(limit);

    if (lastReviewId != null) {
      DocumentSnapshot lastDocument = await _businessCollection
          .doc(businessId)
          .collection('reviews')
          .doc(lastReviewId)
          .get();
      query = query.startAfterDocument(lastDocument);
    }

    QuerySnapshot querySnapshot = await query.get();

    List<ReviewModel> reviews = querySnapshot.docs.map((doc) {
      final data = doc.data() as Map<String, dynamic>;
      return ReviewModel.fromJson(data);
    }).toList();

    return reviews;
  }

  @override
  Future<void> writeReview(
      {required String businessId, required ReviewModel review}) {
    return _businessCollection
        .doc(businessId)
        .collection('reviews')
        .doc(review.id)
        .set(review.toJson());
  }

  @override
  Future<void> deleteReview(
      {required String businessId, required String reviewId}) {
    return _businessCollection
        .doc(businessId)
        .collection('reviews')
        .doc(reviewId)
        .delete();
  }
}
