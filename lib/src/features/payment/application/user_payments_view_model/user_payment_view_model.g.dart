// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_payment_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$creditCardListHash() => r'e4b41ca391a610448ce07c2d864a65833a3aaf36';

/// See also [creditCardList].
@ProviderFor(creditCardList)
final creditCardListProvider =
    AutoDisposeStreamProvider<List<CreditCardModel>>.internal(
  creditCardList,
  name: r'creditCardListProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$creditCardListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CreditCardListRef = AutoDisposeStreamProviderRef<List<CreditCardModel>>;
String _$userPaymentViewModelHash() =>
    r'bf648361311cefb01d11ae4a904a8a82af50c26b';

/// See also [UserPaymentViewModel].
@ProviderFor(UserPaymentViewModel)
final userPaymentViewModelProvider =
    AsyncNotifierProvider<UserPaymentViewModel, void>.internal(
  UserPaymentViewModel.new,
  name: r'userPaymentViewModelProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$userPaymentViewModelHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$UserPaymentViewModel = AsyncNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
