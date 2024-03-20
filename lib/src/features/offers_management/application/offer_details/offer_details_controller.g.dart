// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offer_details_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$otherBusinessOffersHash() =>
    r'1d01d3893656e5568c8e7fbb8b2fc9b28f5e86e0';

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

/// See also [otherBusinessOffers].
@ProviderFor(otherBusinessOffers)
const otherBusinessOffersProvider = OtherBusinessOffersFamily();

/// See also [otherBusinessOffers].
class OtherBusinessOffersFamily extends Family<AsyncValue<List<OfferModel>>> {
  /// See also [otherBusinessOffers].
  const OtherBusinessOffersFamily();

  /// See also [otherBusinessOffers].
  OtherBusinessOffersProvider call(
    String businessId,
  ) {
    return OtherBusinessOffersProvider(
      businessId,
    );
  }

  @override
  OtherBusinessOffersProvider getProviderOverride(
    covariant OtherBusinessOffersProvider provider,
  ) {
    return call(
      provider.businessId,
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
  String? get name => r'otherBusinessOffersProvider';
}

/// See also [otherBusinessOffers].
class OtherBusinessOffersProvider
    extends AutoDisposeStreamProvider<List<OfferModel>> {
  /// See also [otherBusinessOffers].
  OtherBusinessOffersProvider(
    String businessId,
  ) : this._internal(
          (ref) => otherBusinessOffers(
            ref as OtherBusinessOffersRef,
            businessId,
          ),
          from: otherBusinessOffersProvider,
          name: r'otherBusinessOffersProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$otherBusinessOffersHash,
          dependencies: OtherBusinessOffersFamily._dependencies,
          allTransitiveDependencies:
              OtherBusinessOffersFamily._allTransitiveDependencies,
          businessId: businessId,
        );

  OtherBusinessOffersProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.businessId,
  }) : super.internal();

  final String businessId;

  @override
  Override overrideWith(
    Stream<List<OfferModel>> Function(OtherBusinessOffersRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: OtherBusinessOffersProvider._internal(
        (ref) => create(ref as OtherBusinessOffersRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        businessId: businessId,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<List<OfferModel>> createElement() {
    return _OtherBusinessOffersProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is OtherBusinessOffersProvider &&
        other.businessId == businessId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, businessId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin OtherBusinessOffersRef on AutoDisposeStreamProviderRef<List<OfferModel>> {
  /// The parameter `businessId` of this provider.
  String get businessId;
}

class _OtherBusinessOffersProviderElement
    extends AutoDisposeStreamProviderElement<List<OfferModel>>
    with OtherBusinessOffersRef {
  _OtherBusinessOffersProviderElement(super.provider);

  @override
  String get businessId => (origin as OtherBusinessOffersProvider).businessId;
}

String _$offerDetailsControllerHash() =>
    r'3cef6bc288dd0597b812a26ac693a8e123c601c1';

/// See also [OfferDetailsController].
@ProviderFor(OfferDetailsController)
final offerDetailsControllerProvider =
    NotifierProvider<OfferDetailsController, OfferModel?>.internal(
  OfferDetailsController.new,
  name: r'offerDetailsControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$offerDetailsControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$OfferDetailsController = Notifier<OfferModel?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
