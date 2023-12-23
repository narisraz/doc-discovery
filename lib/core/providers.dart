import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:docdiscovery/data/repositories/practitioner_repository_impl.dart';
import 'package:docdiscovery/domain/repositories/practitioner_repository.dart';
import 'package:docdiscovery/domain/usecases/get_practitioner_info_use_case.dart';
import 'package:docdiscovery/domain/usecases/save_practitioner_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers.g.dart';

@riverpod
FirebaseFirestore firestore(FirestoreRef ref) => FirebaseFirestore.instance;

@riverpod
PractitionerRepository practitionerRepository(PractitionerRepositoryRef ref) =>
    PractitionerRepositoryImpl(ref.read(firestoreProvider));

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
