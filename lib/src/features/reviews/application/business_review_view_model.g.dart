// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'business_review_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$businessReviewsHash() => r'ac5f85760f938008af55467fcc4f1d4929be2209';

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
  ) {
    return BusinessReviewsProvider(
      uid,
    );
  }

  @override
  BusinessReviewsProvider getProviderOverride(
    covariant BusinessReviewsProvider provider,
  ) {
    return call(
      provider.uid,
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
  ) : this._internal(
          (ref) => businessReviews(
            ref as BusinessReviewsRef,
            uid,
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
        );

  BusinessReviewsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.uid,
  }) : super.internal();

  final String uid;

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
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<ReviewModel>> createElement() {
    return _BusinessReviewsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is BusinessReviewsProvider && other.uid == uid;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, uid.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin BusinessReviewsRef on AutoDisposeFutureProviderRef<List<ReviewModel>> {
  /// The parameter `uid` of this provider.
  String get uid;
}

class _BusinessReviewsProviderElement
    extends AutoDisposeFutureProviderElement<List<ReviewModel>>
    with BusinessReviewsRef {
  _BusinessReviewsProviderElement(super.provider);

  @override
  String get uid => (origin as BusinessReviewsProvider).uid;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
