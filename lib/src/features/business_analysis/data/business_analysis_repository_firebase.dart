import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:project_marba/src/features/business_analysis/data/business_analysis_repository.dart';

import 'business_analysis.dart';

class BusinessAnalysisRepositoryFirebase extends BusinessAnalysisRepository {
  final CollectionReference _businessAnalysisCollection =
      FirebaseFirestore.instance.collection('business_analysis');
  final Reference _storageReference = FirebaseStorage.instance.ref();

  @override
  Future<void> uploadBusinessAnalysis(BusinessAnalysis businessAnalysis) {
    return _businessAnalysisCollection.doc(businessAnalysis.id).set(
          businessAnalysis.toJson(),
        );
  }

  @override
  Future<List<BusinessAnalysis>> getBusinessesAnalysis() {
    return _businessAnalysisCollection.get().then((snapshot) {
      return snapshot.docs
          .map((doc) =>
              BusinessAnalysis.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
    });
  }

  @override
  Future<void> updateBusinessAnalysis(BusinessAnalysis businessAnalysis) {
    return _businessAnalysisCollection
        .doc(businessAnalysis.id)
        .update(businessAnalysis.toJson());
  }

  @override
  Future<String> uploadImage(File image, {required String? cpfOrCNPJ}) {
    final ref = _storageReference.child('business_analysis/$cpfOrCNPJ');
    return ref.putFile(image).then((task) => task.ref.getDownloadURL());
  }
}
