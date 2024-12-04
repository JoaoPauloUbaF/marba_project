// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'business_orders_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$selectedOrderHash() => r'7401c5e0a8ddbe28b3c5b982e4f595a7f61b8dcf';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [selectedOrder].
@ProviderFor(selectedOrder)
const selectedOrderProvider = SelectedOrderFamily();

/// See also [selectedOrder].
class SelectedOrderFamily extends Family<AsyncValue<BusinessOrder?>> {
  /// See also [selectedOrder].
  const SelectedOrderFamily();

  /// See also [selectedOrder].
  SelectedOrderProvider call(
    String orderId,
  ) {
    return SelectedOrderProvider(
      orderId,
    );
  }

  @override
  SelectedOrderProvider getProviderOverride(
    covariant SelectedOrderProvider provider,
  ) {
    return call(
      provider.orderId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'selectedOrderProvider';
}

/// See also [selectedOrder].
class SelectedOrderProvider extends StreamProvider<BusinessOrder?> {
  /// See also [selectedOrder].
  SelectedOrderProvider(
    String orderId,
  ) : this._internal(
          (ref) => selectedOrder(
            ref as SelectedOrderRef,
            orderId,
          ),
          from: selectedOrderProvider,
          name: r'selectedOrderProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$selectedOrderHash,
          dependencies: SelectedOrderFamily._dependencies,
          allTransitiveDependencies:
              SelectedOrderFamily._allTransitiveDependencies,
          orderId: orderId,
        );

  SelectedOrderProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.orderId,
  }) : super.internal();

  final String orderId;

  @override
  Override overrideWith(
    Stream<BusinessOrder?> Function(SelectedOrderRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SelectedOrderProvider._internal(
        (ref) => create(ref as SelectedOrderRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        orderId: orderId,
      ),
    );
  }

  @override
  StreamProviderElement<BusinessOrder?> createElement() {
    return _SelectedOrderProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SelectedOrderProvider && other.orderId == orderId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, orderId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin SelectedOrderRef on StreamProviderRef<BusinessOrder?> {
  /// The parameter `orderId` of this provider.
  String get orderId;
}

class _SelectedOrderProviderElement
    extends StreamProviderElement<BusinessOrder?> with SelectedOrderRef {
  _SelectedOrderProviderElement(super.provider);

  @override
  String get orderId => (origin as SelectedOrderProvider).orderId;
}

String _$businessOrdersViewModelHash() =>
    r'b01686416e536e4f39ab54e5050fbc01643d7435';

/// See also [BusinessOrdersViewModel].
@ProviderFor(BusinessOrdersViewModel)
final businessOrdersViewModelProvider = AutoDisposeStreamNotifierProvider<
    BusinessOrdersViewModel, List<BusinessOrder>>.internal(
  BusinessOrdersViewModel.new,
  name: r'businessOrdersViewModelProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$businessOrdersViewModelHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$BusinessOrdersViewModel
    = AutoDisposeStreamNotifier<List<BusinessOrder>>;
String _$businessOrdersStatusFilterHash() =>
    r'4f5b93170b8176821e9cf3036b73fc77edba1a6e';

/// See also [BusinessOrdersStatusFilter].
@ProviderFor(BusinessOrdersStatusFilter)
final businessOrdersStatusFilterProvider = AutoDisposeNotifierProvider<
    BusinessOrdersStatusFilter, BusinessOrderStatus?>.internal(
  BusinessOrdersStatusFilter.new,
  name: r'businessOrdersStatusFilterProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$businessOrdersStatusFilterHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$BusinessOrdersStatusFilter
    = AutoDisposeNotifier<BusinessOrderStatus?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
