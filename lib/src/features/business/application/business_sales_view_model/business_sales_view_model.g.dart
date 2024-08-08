// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'business_sales_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$businessSaleDataHash() => r'57fc9089e98f6459a764f10015d6b009f1202f70';

/// See also [businessSaleData].
@ProviderFor(businessSaleData)
final businessSaleDataProvider =
    AutoDisposeStreamProvider<List<BusinessOrder>>.internal(
  businessSaleData,
  name: r'businessSaleDataProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$businessSaleDataHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef BusinessSaleDataRef = AutoDisposeStreamProviderRef<List<BusinessOrder>>;
String _$salesDateTimeRangeFilterHash() =>
    r'20a7a2d393dd672f3c31e9ee2f89b3b79c9879ee';

/// See also [SalesDateTimeRangeFilter].
@ProviderFor(SalesDateTimeRangeFilter)
final salesDateTimeRangeFilterProvider = AutoDisposeNotifierProvider<
    SalesDateTimeRangeFilter, DateTimeRange>.internal(
  SalesDateTimeRangeFilter.new,
  name: r'salesDateTimeRangeFilterProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$salesDateTimeRangeFilterHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SalesDateTimeRangeFilter = AutoDisposeNotifier<DateTimeRange>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
