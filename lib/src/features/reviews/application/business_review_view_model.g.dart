// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'business_review_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$businessReviewsHash() => r'e70d54660894317b55e4bc130a7ab2611d50f9b0';

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

/// See also [businessReviews].
@ProviderFor(businessReviews)
const businessReviewsProvider = BusinessReviewsFamily();

/// See also [businessReviews].
class BusinessReviewsFamily extends Family<AsyncValue<List<ReviewModel>>> {
  /// See also [businessReviews].
  const BusinessReviewsFamily();

  /// See also [businessReviews].
  BusinessReviewsProvider call(
    String uid,
    int? limit,
    String? lastReviewId,
  ) {
    return BusinessReviewsProvider(
      uid,
      limit,
      lastReviewId,
    );
  }

  @override
  BusinessReviewsProvider getProviderOverride(
    covariant BusinessReviewsProvider provider,
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
  String? get name => r'businessReviewsProvider';
}

/// See also [businessReviews].
class BusinessReviewsProvider
    extends AutoDisposeFutureProvider<List<ReviewModel>> {
  /// See also [businessReviews].
  BusinessReviewsProvider(
    String uid,
    int? limit,
    String? lastReviewId,
  ) : this._internal(
          (ref) => businessReviews(
            ref as BusinessReviewsRef,
            uid,
            limit,
            lastReviewId,
          ),
          from: businessReviewsProvider,
          name: r'businessReviewsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$businessReviewsHash,
          dependencies: BusinessReviewsFamily._dependencies,
          allTransitiveDependencies:
              BusinessReviewsFamily._allTransitiveDependencies,
          uid: uid,
          limit: limit,
          lastReviewId: lastReviewId,
        );

  BusinessReviewsProvider._internal(
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
    FutureOr<List<ReviewModel>> Function(BusinessReviewsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: BusinessReviewsProvider._internal(
        (ref) => create(ref as BusinessReviewsRef),
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
    return _BusinessReviewsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is BusinessReviewsProvider &&
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
mixin BusinessReviewsRef on AutoDisposeFutureProviderRef<List<ReviewModel>> {
  /// The parameter `uid` of this provider.
  String get uid;

  /// The parameter `limit` of this provider.
  int? get limit;

  /// The parameter `lastReviewId` of this provider.
  String? get lastReviewId;
}

class _BusinessReviewsProviderElement
    extends AutoDisposeFutureProviderElement<List<ReviewModel>>
    with BusinessReviewsRef {
  _BusinessReviewsProviderElement(super.provider);

  @override
  String get uid => (origin as BusinessReviewsProvider).uid;
  @override
  int? get limit => (origin as BusinessReviewsProvider).limit;
  @override
  String? get lastReviewId => (origin as BusinessReviewsProvider).lastReviewId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
