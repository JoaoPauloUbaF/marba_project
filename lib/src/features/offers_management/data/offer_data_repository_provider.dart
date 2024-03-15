import 'package:project_marba/src/features/offers_management/data/offers_data_repository.dart';
import 'package:project_marba/src/features/offers_management/data/offers_firebase_data_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'offer_data_repository_provider.g.dart';

@riverpod
OffersDataRepository offersDataRepository(OffersDataRepositoryRef ref) {
  return OffersFirebaseDataRepository();
}
