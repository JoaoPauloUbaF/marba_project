import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'user_firestore_profile_data_provider.dart';
import 'user_profile_data_repository.dart';

final userProfileDataProvider = Provider<ProfileDataRepository>(
  (ref) => FirestoreProfileDataRepository(),
);
