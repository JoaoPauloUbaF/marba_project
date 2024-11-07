// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'business_order_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getBusinessOrderHash() => r'42aeaccab0312dcbdbd8be201ccb3ef8bbcae3f0';

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

/// See also [getBusinessOrder].
@ProviderFor(getBusinessOrder)
const getBusinessOrderProvider = GetBusinessOrderFamily();

/// See also [getBusinessOrder].
class GetBusinessOrderFamily extends Family<AsyncValue<BusinessOrder?>> {
  /// See also [getBusinessOrder].
  const GetBusinessOrderFamily();

  /// See also [getBusinessOrder].
  GetBusinessOrderProvider call({
    required String businessOrderId,
  }) {
    return GetBusinessOrderProvider(
      businessOrderId: businessOrderId,
    );
  }

  @override
  GetBusinessOrderProvider getProviderOverride(
    covariant GetBusinessOrderProvider provider,
  ) {
    return call(
      businessOrderId: provider.businessOrderId,
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
  String? get name => r'getBusinessOrderProvider';
}

/// See also [getBusinessOrder].
class GetBusinessOrderProvider
    extends AutoDisposeStreamProvider<BusinessOrder?> {
  /// See also [getBusinessOrder].
  GetBusinessOrderProvider({
    required String businessOrderId,
  }) : this._internal(
          (ref) => getBusinessOrder(
            ref as GetBusinessOrderRef,
            businessOrderId: businessOrderId,
          ),
          from: getBusinessOrderProvider,
          name: r'getBusinessOrderProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getBusinessOrderHash,
          dependencies: GetBusinessOrderFamily._dependencies,
          allTransitiveDependencies:
              GetBusinessOrderFamily._allTransitiveDependencies,
          businessOrderId: businessOrderId,
        );

  GetBusinessOrderProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.businessOrderId,
  }) : super.internal();

  final String businessOrderId;

  @override
  Override overrideWith(
    Stream<BusinessOrder?> Function(GetBusinessOrderRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetBusinessOrderProvider._internal(
        (ref) => create(ref as GetBusinessOrderRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        businessOrderId: businessOrderId,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<BusinessOrder?> createElement() {
    return _GetBusinessOrderProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetBusinessOrderProvider &&
        other.businessOrderId == businessOrderId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, businessOrderId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GetBusinessOrderRef on AutoDisposeStreamProviderRef<BusinessOrder?> {
  /// The parameter `businessOrderId` of this provider.
  String get businessOrderId;
}

class _GetBusinessOrderProviderElement
    extends AutoDisposeStreamProviderElement<BusinessOrder?>
    with GetBusinessOrderRef {
  _GetBusinessOrderProviderElement(super.provider);

  @override
  String get businessOrderId =>
      (origin as GetBusinessOrderProvider).businessOrderId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
