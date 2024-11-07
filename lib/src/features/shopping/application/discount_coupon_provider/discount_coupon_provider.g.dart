// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'discount_coupon_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$shoppingCartDiscountHash() =>
    r'429c25c0928928343a8bb294213abe5671548cf1';

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

/// See also [shoppingCartDiscount].
@ProviderFor(shoppingCartDiscount)
const shoppingCartDiscountProvider = ShoppingCartDiscountFamily();

/// See also [shoppingCartDiscount].
class ShoppingCartDiscountFamily extends Family<String> {
  /// See also [shoppingCartDiscount].
  const ShoppingCartDiscountFamily();

  /// See also [shoppingCartDiscount].
  ShoppingCartDiscountProvider call(
    double total,
  ) {
    return ShoppingCartDiscountProvider(
      total,
    );
  }

  @override
  ShoppingCartDiscountProvider getProviderOverride(
    covariant ShoppingCartDiscountProvider provider,
  ) {
    return call(
      provider.total,
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
  String? get name => r'shoppingCartDiscountProvider';
}

/// See also [shoppingCartDiscount].
class ShoppingCartDiscountProvider extends AutoDisposeProvider<String> {
  /// See also [shoppingCartDiscount].
  ShoppingCartDiscountProvider(
    double total,
  ) : this._internal(
          (ref) => shoppingCartDiscount(
            ref as ShoppingCartDiscountRef,
            total,
          ),
          from: shoppingCartDiscountProvider,
          name: r'shoppingCartDiscountProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$shoppingCartDiscountHash,
          dependencies: ShoppingCartDiscountFamily._dependencies,
          allTransitiveDependencies:
              ShoppingCartDiscountFamily._allTransitiveDependencies,
          total: total,
        );

  ShoppingCartDiscountProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.total,
  }) : super.internal();

  final double total;

  @override
  Override overrideWith(
    String Function(ShoppingCartDiscountRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ShoppingCartDiscountProvider._internal(
        (ref) => create(ref as ShoppingCartDiscountRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        total: total,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<String> createElement() {
    return _ShoppingCartDiscountProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ShoppingCartDiscountProvider && other.total == total;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, total.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ShoppingCartDiscountRef on AutoDisposeProviderRef<String> {
  /// The parameter `total` of this provider.
  double get total;
}

class _ShoppingCartDiscountProviderElement
    extends AutoDisposeProviderElement<String> with ShoppingCartDiscountRef {
  _ShoppingCartDiscountProviderElement(super.provider);

  @override
  double get total => (origin as ShoppingCartDiscountProvider).total;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
