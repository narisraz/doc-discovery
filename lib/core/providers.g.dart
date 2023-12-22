// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$firestoreHash() => r'fc477234de9bccabafed2df842ced616b6c37f5c';

/// See also [firestore].
@ProviderFor(firestore)
final firestoreProvider = AutoDisposeProvider<FirebaseFirestore>.internal(
  firestore,
  name: r'firestoreProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$firestoreHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FirestoreRef = AutoDisposeProviderRef<FirebaseFirestore>;
String _$practitionerRepositoryHash() =>
    r'cd41842b85d2b640cc05f126e0f07b87316a11b8';

/// See also [practitionerRepository].
@ProviderFor(practitionerRepository)
final practitionerRepositoryProvider =
    AutoDisposeProvider<PractitionerRepository>.internal(
  practitionerRepository,
  name: r'practitionerRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$practitionerRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef PractitionerRepositoryRef
    = AutoDisposeProviderRef<PractitionerRepository>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
