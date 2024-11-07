// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_view_model_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$reviewViewModelHash() => r'04f348612b6081ae9344998851730b6dc6be1f0d';

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

/// See also [reviewViewModel].
@ProviderFor(reviewViewModel)
const reviewViewModelProvider = ReviewViewModelFamily();

/// See also [reviewViewModel].
class ReviewViewModelFamily extends Family<ReviewViewModel> {
  /// See also [reviewViewModel].
  const ReviewViewModelFamily();

  /// See also [reviewViewModel].
  ReviewViewModelProvider call({
    required ReviewViewModelType type,
    required WidgetRef widgetRef,
  }) {
    return ReviewViewModelProvider(
      type: type,
      widgetRef: widgetRef,
    );
  }

  @override
  ReviewViewModelProvider getProviderOverride(
    covariant ReviewViewModelProvider provider,
  ) {
    return call(
      type: provider.type,
      widgetRef: provider.widgetRef,
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
  String? get name => r'reviewViewModelProvider';
}

/// See also [reviewViewModel].
class ReviewViewModelProvider extends AutoDisposeProvider<ReviewViewModel> {
  /// See also [reviewViewModel].
  ReviewViewModelProvider({
    required ReviewViewModelType type,
    required WidgetRef widgetRef,
  }) : this._internal(
          (ref) => reviewViewModel(
            ref as ReviewViewModelRef,
            type: type,
            widgetRef: widgetRef,
          ),
          from: reviewViewModelProvider,
          name: r'reviewViewModelProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$reviewViewModelHash,
          dependencies: ReviewViewModelFamily._dependencies,
          allTransitiveDependencies:
              ReviewViewModelFamily._allTransitiveDependencies,
          type: type,
          widgetRef: widgetRef,
        );

  ReviewViewModelProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.type,
    required this.widgetRef,
  }) : super.internal();

  final ReviewViewModelType type;
  final WidgetRef widgetRef;

  @override
  Override overrideWith(
    ReviewViewModel Function(ReviewViewModelRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ReviewViewModelProvider._internal(
        (ref) => create(ref as ReviewViewModelRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        type: type,
        widgetRef: widgetRef,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<ReviewViewModel> createElement() {
    return _ReviewViewModelProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ReviewViewModelProvider &&
        other.type == type &&
        other.widgetRef == widgetRef;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, type.hashCode);
    hash = _SystemHash.combine(hash, widgetRef.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ReviewViewModelRef on AutoDisposeProviderRef<ReviewViewModel> {
  /// The parameter `type` of this provider.
  ReviewViewModelType get type;

  /// The parameter `widgetRef` of this provider.
  WidgetRef get widgetRef;
}

class _ReviewViewModelProviderElement
    extends AutoDisposeProviderElement<ReviewViewModel>
    with ReviewViewModelRef {
  _ReviewViewModelProviderElement(super.provider);

  @override
  ReviewViewModelType get type => (origin as ReviewViewModelProvider).type;
  @override
  WidgetRef get widgetRef => (origin as ReviewViewModelProvider).widgetRef;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
