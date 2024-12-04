import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'business_profile_data_repository.dart';
import 'business_firebase_profile_data_provider.dart';

final businessProfileDataProvider = Provider<BusinessProfileDataRepository>(
  (ref) => BusinessFirebaseProfileDataProvider(),
);
