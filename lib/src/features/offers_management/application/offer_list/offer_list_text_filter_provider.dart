import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'offer_list_text_filter_provider.g.dart';

@riverpod
class OfferListTextFilter extends _$OfferListTextFilter {
  @override
  String? build() {
    return null;
  }

  void filterOffers(String value) {
    state = value;
  }
}
