// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$firestoreHash() => r'57116d7f1e2dda861cf1362ca8fe50edc7a149b3';

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
    r'86a21d8603fe51759d2f12040e3aa2aaab5acb94';

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
String _$savePractitionerUseCaseHash() =>
    r'8beb226ef43214260d4e5df9eae6cdbd9dd57639';

/// See also [savePractitionerUseCase].
@ProviderFor(savePractitionerUseCase)
final savePractitionerUseCaseProvider =
    AutoDisposeProvider<SavePractitionerUseCase>.internal(
  savePractitionerUseCase,
  name: r'savePractitionerUseCaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$savePractitionerUseCaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SavePractitionerUseCaseRef
    = AutoDisposeProviderRef<SavePractitionerUseCase>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
