import 'package:project_marba/src/features/business_analysis/data/repository/business_analysis_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'business_analysis_repository_firebase.dart';

part 'business_analysis_repository_provider.g.dart';

@riverpod
BusinessAnalysisRepository businessAnalysisRepository(
    BusinessAnalysisRepositoryRef ref) {
  return BusinessAnalysisRepositoryFirebase();
}
