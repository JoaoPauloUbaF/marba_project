// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'business_sales_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$businessSaleDataHash() => r'e5a0ccfe5277bc93426fbeab449b91d31575edf9';

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
    r'12ee3c8a4379800bc236861a22b4b48dba88ae79';

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
