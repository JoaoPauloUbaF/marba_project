// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delivery_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$deliveryTaxHash() => r'41f80c6c0b6fb010bf7627486b4b48a476e18f3a';

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

/// See also [deliveryTax].
@ProviderFor(deliveryTax)
const deliveryTaxProvider = DeliveryTaxFamily();

/// See also [deliveryTax].
class DeliveryTaxFamily extends Family<AsyncValue<String>> {
  /// See also [deliveryTax].
  const DeliveryTaxFamily();

  /// See also [deliveryTax].
  DeliveryTaxProvider call({
    required List<CartItemModel> cartOffers,
  }) {
    return DeliveryTaxProvider(
      cartOffers: cartOffers,
    );
  }

  @override
  DeliveryTaxProvider getProviderOverride(
    covariant DeliveryTaxProvider provider,
  ) {
    return call(
      cartOffers: provider.cartOffers,
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
  String? get name => r'deliveryTaxProvider';
}

/// See also [deliveryTax].
class DeliveryTaxProvider extends AutoDisposeFutureProvider<String> {
  /// See also [deliveryTax].
  DeliveryTaxProvider({
    required List<CartItemModel> cartOffers,
  }) : this._internal(
          (ref) => deliveryTax(
            ref as DeliveryTaxRef,
            cartOffers: cartOffers,
          ),
          from: deliveryTaxProvider,
          name: r'deliveryTaxProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$deliveryTaxHash,
          dependencies: DeliveryTaxFamily._dependencies,
          allTransitiveDependencies:
              DeliveryTaxFamily._allTransitiveDependencies,
          cartOffers: cartOffers,
        );

  DeliveryTaxProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.cartOffers,
  }) : super.internal();

  final List<CartItemModel> cartOffers;

  @override
  Override overrideWith(
    FutureOr<String> Function(DeliveryTaxRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DeliveryTaxProvider._internal(
        (ref) => create(ref as DeliveryTaxRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        cartOffers: cartOffers,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<String> createElement() {
    return _DeliveryTaxProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DeliveryTaxProvider && other.cartOffers == cartOffers;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, cartOffers.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin DeliveryTaxRef on AutoDisposeFutureProviderRef<String> {
  /// The parameter `cartOffers` of this provider.
  List<CartItemModel> get cartOffers;
}

class _DeliveryTaxProviderElement
    extends AutoDisposeFutureProviderElement<String> with DeliveryTaxRef {
  _DeliveryTaxProviderElement(super.provider);

  @override
  List<CartItemModel> get cartOffers =>
      (origin as DeliveryTaxProvider).cartOffers;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
