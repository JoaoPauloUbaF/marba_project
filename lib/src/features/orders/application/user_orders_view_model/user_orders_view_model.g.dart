// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_orders_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userOrdersViewModelHash() =>
    r'b7b031b6e54f333247fa38f803da4e020afcd331';

/// See also [UserOrdersViewModel].
@ProviderFor(UserOrdersViewModel)
final userOrdersViewModelProvider = AutoDisposeStreamNotifierProvider<
    UserOrdersViewModel, List<OrderModel>>.internal(
  UserOrdersViewModel.new,
  name: r'userOrdersViewModelProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$userOrdersViewModelHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$UserOrdersViewModel = AutoDisposeStreamNotifier<List<OrderModel>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member