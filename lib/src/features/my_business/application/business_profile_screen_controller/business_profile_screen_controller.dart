import 'package:project_marba/src/shared/models/business/business.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'business_profile_screen_controller.g.dart';

@Riverpod(keepAlive: true)
class BusinessProfileScreenController
    extends _$BusinessProfileScreenController {
  @override
  Business? build() {
    return null;
  }

  void setSelectedBusiness(Business business) {
    state = business;
  }

  String getBusinessName() {
    return state?.name ?? '';
  }
}
