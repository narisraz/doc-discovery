import 'package:algolia/algolia.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:docdiscovery/core/utils.dart';
import 'package:docdiscovery/data/repositories/auth_repository_impl.dart';
import 'package:docdiscovery/data/repositories/practitioner_repository_impl.dart';
import 'package:docdiscovery/data/repositories/user_repository_impl.dart';
import 'package:docdiscovery/domain/repositories/auth_repository.dart';
import 'package:docdiscovery/domain/repositories/practitioner_repository.dart';
import 'package:docdiscovery/domain/repositories/user_repository.dart';
import 'package:docdiscovery/domain/usecases/get_practitioner_info_use_case.dart';
import 'package:docdiscovery/domain/usecases/get_practitioner_profile_use_case.dart';
import 'package:docdiscovery/domain/usecases/save_practitioner_use_case.dart';
import 'package:docdiscovery/domain/usecases/search_practitioner_use_case.dart';
import 'package:docdiscovery/domain/usecases/sign_in_use_case.dart';
import 'package:docdiscovery/domain/usecases/sign_up_user_use_case.dart';
import 'package:docdiscovery/domain/usecases/upload_practitioner_profile_use_case.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers.g.dart';

Algolia algolia = const Algolia.init(
  applicationId: '8YZ48XJ0HG',
  apiKey: 'e77655febba41c13440d5898bcfec7b7',
);

@riverpod
PractitionerRepository practitionerRepository(PractitionerRepositoryRef ref) =>
    PractitionerRepositoryImpl(
        FirebaseFirestore.instance, algolia.instance, FirebaseStorage.instance);

@riverpod
AuthRepository authRepository(ProviderRef ref) =>
    AuthRepositoryImpl(auth: FirebaseAuth.instance);

@riverpod
UserRepository userRepository(ProviderRef ref) =>
    UserRepositoryImpl(firestore: FirebaseFirestore.instance);

@riverpod
SavePractitionerUseCase savePractitionerUseCase(
        SavePractitionerUseCaseRef ref) =>
    SavePractitionerUseCase(
        practitionerRepository: ref.read(practitionerRepositoryProvider));

@riverpod
GetPractitionerInfoUseCase getPractitionerInfoUseCase(
        GetPractitionerInfoUseCaseRef ref) =>
    GetPractitionerInfoUseCase(
        practitionerRepository: ref.read(practitionerRepositoryProvider));

@riverpod
SearchPractitionerUseCase searchPractitionerUseCase(
        SearchPractitionerUseCaseRef ref) =>
    SearchPractitionerUseCase(
        practitionerRepository: ref.read(practitionerRepositoryProvider));

@riverpod
UploadPractitionerProfileUseCase uploadPractitionerProfileUseCase(
        UploadPractitionerProfileUseCaseRef ref) =>
    UploadPractitionerProfileUseCase(
        practitionerRepository: ref.read(practitionerRepositoryProvider));

@riverpod
GetPractitionerProfileUseCase getPractitionerProfileUseCase(
        GetPractitionerProfileUseCaseRef ref) =>
    GetPractitionerProfileUseCase(
        practitionerRepository: ref.read(practitionerRepositoryProvider));

@riverpod
SignUpUserUseCase signUpUserUseCase(SignUpUserUseCaseRef ref) =>
    SignUpUserUseCase(
        authRepository: ref.read(authRepositoryProvider),
        mailUtil: MailUtil(),
        userRepository: ref.read(userRepositoryProvider));

@riverpod
SignInUserUseCase signInUserUseCase(SignInUserUseCaseRef ref) =>
    SignInUserUseCase(
        authRepository: ref.read(authRepositoryProvider),
        userRepository: ref.read(userRepositoryProvider));
