import 'package:project_marba/src/features/business_profile/application/my_business_list_screen_controller/my_business_list_screen_controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../shared/models/business/business.dart';

part 'business_list_provider.g.dart';

@riverpod
Future<List<Business?>> ownedBusiness(OwnedBusinessRef ref) async {
  return ref
      .read(myBusinessListScreenControllerProvider.notifier)
      .getUserBusinessList();
}
