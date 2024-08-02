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
    r'3ce9d0bc0dbc6684b2faa9b4d0d7908d7e6625c4';

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
