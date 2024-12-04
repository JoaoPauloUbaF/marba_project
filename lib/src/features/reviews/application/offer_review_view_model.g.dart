// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offer_review_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$offerReviewsHash() => r'7844a50df445cfbfee9891354e39adc4cb0c211a';

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

/// See also [offerReviews].
@ProviderFor(offerReviews)
const offerReviewsProvider = OfferReviewsFamily();

/// See also [offerReviews].
class OfferReviewsFamily extends Family<AsyncValue<List<ReviewModel>>> {
  /// See also [offerReviews].
  const OfferReviewsFamily();

  /// See also [offerReviews].
  OfferReviewsProvider call(
    String uid,
    int? limit,
    String? lastReviewId,
  ) {
    return OfferReviewsProvider(
      uid,
      limit,
      lastReviewId,
    );
  }

  @override
  OfferReviewsProvider getProviderOverride(
    covariant OfferReviewsProvider provider,
  ) {
    return call(
      provider.uid,
      provider.limit,
      provider.lastReviewId,
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
  String? get name => r'offerReviewsProvider';
}

/// See also [offerReviews].
class OfferReviewsProvider
    extends AutoDisposeFutureProvider<List<ReviewModel>> {
  /// See also [offerReviews].
  OfferReviewsProvider(
    String uid,
    int? limit,
    String? lastReviewId,
  ) : this._internal(
          (ref) => offerReviews(
            ref as OfferReviewsRef,
            uid,
            limit,
            lastReviewId,
          ),
          from: offerReviewsProvider,
          name: r'offerReviewsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$offerReviewsHash,
          dependencies: OfferReviewsFamily._dependencies,
          allTransitiveDependencies:
              OfferReviewsFamily._allTransitiveDependencies,
          uid: uid,
          limit: limit,
          lastReviewId: lastReviewId,
        );

  OfferReviewsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.uid,
    required this.limit,
    required this.lastReviewId,
  }) : super.internal();

  final String uid;
  final int? limit;
  final String? lastReviewId;

  @override
  Override overrideWith(
    FutureOr<List<ReviewModel>> Function(OfferReviewsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: OfferReviewsProvider._internal(
        (ref) => create(ref as OfferReviewsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        uid: uid,
        limit: limit,
        lastReviewId: lastReviewId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<ReviewModel>> createElement() {
    return _OfferReviewsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is OfferReviewsProvider &&
        other.uid == uid &&
        other.limit == limit &&
        other.lastReviewId == lastReviewId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, uid.hashCode);
    hash = _SystemHash.combine(hash, limit.hashCode);
    hash = _SystemHash.combine(hash, lastReviewId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin OfferReviewsRef on AutoDisposeFutureProviderRef<List<ReviewModel>> {
  /// The parameter `uid` of this provider.
  String get uid;

  /// The parameter `limit` of this provider.
  int? get limit;

  /// The parameter `lastReviewId` of this provider.
  String? get lastReviewId;
}

class _OfferReviewsProviderElement
    extends AutoDisposeFutureProviderElement<List<ReviewModel>>
    with OfferReviewsRef {
  _OfferReviewsProviderElement(super.provider);

  @override
  String get uid => (origin as OfferReviewsProvider).uid;
  @override
  int? get limit => (origin as OfferReviewsProvider).limit;
  @override
  String? get lastReviewId => (origin as OfferReviewsProvider).lastReviewId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
