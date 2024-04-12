// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getBusinessOrdersHash() => r'fdb2e1dace0b04dcc445c55805f8aa335215c7cd';

/// See also [getBusinessOrders].
@ProviderFor(getBusinessOrders)
final getBusinessOrdersProvider =
    AutoDisposeStreamProvider<List<BusinessOrder>>.internal(
  getBusinessOrders,
  name: r'getBusinessOrdersProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getBusinessOrdersHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetBusinessOrdersRef
    = AutoDisposeStreamProviderRef<List<BusinessOrder>>;
String _$orderViewModelHash() => r'05de2295ae242ecf833009d28947fbefe1c0c948';

/// See also [OrderViewModel].
@ProviderFor(OrderViewModel)
final orderViewModelProvider =
    NotifierProvider<OrderViewModel, OrderModel?>.internal(
  OrderViewModel.new,
  name: r'orderViewModelProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$orderViewModelHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$OrderViewModel = Notifier<OrderModel?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
