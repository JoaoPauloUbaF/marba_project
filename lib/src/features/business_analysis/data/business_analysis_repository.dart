import 'dart:io';

import 'business_analysis.dart';

abstract class BusinessAnalysisRepository {
  Future<void> uploadBusinessAnalysis(BusinessAnalysis businessAnalysis);
  Future<List<BusinessAnalysis>> getBusinessesAnalysis();
  Future<void> updateBusinessAnalysis(BusinessAnalysis businessAnalysis);
  Future<String> uploadImage(File image, {required String cpfOrCNPJ});
}
