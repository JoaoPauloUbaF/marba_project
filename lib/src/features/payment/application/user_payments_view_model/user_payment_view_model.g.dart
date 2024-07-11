// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_payment_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$creditCardListHash() => r'95f9f3c7e332dbd91e2d04962cdee1064a5adc0d';

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
    r'adf527539d90ee93911fe76c81dad5c1352c5742';

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
