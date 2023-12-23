import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:docdiscovery/core/error/failure.dart';
import 'package:docdiscovery/data/data_sources/firebase_firestore/firestore_collections.dart';
import 'package:docdiscovery/data/models/practitioner.dart';
import 'package:docdiscovery/domain/entities/practitioner.dart';
import 'package:docdiscovery/domain/repositories/practitioner_repository.dart';

class PractitionerRepositoryImpl implements PractitionerRepository {
  late FirebaseFirestore firestore;

  PractitionerRepositoryImpl(this.firestore);

  @override
  Future<Either<Failure, PractitionerEntity>> savePractitioner(
      PractitionerEntity practitioner) {
    final practitionerModel =
        PractitionerModel.fromPractitionerEntity(practitioner)
            .copyWith(createdAt: DateTime.now());

    return FirestoreCollections.getPractitionerCollection(firestore)
        .add(practitionerModel)
        .then((value) => value.get())
        .then((value) =>
            Right(value.data()!.toPractitionerEntity().copyWith(id: value.id)));
  }

  @override
  Future<Either<Failure, PractitionerEntity>> getById(String practitionerId) {
    return FirestoreCollections.getPractitionerCollection(firestore)
        .doc(practitionerId)
        .get()
        .then((value) =>
            Right(value.data()!.toPractitionerEntity().copyWith(id: value.id)));
  }

  @override
  Future<List<PractitionerEntity>> search(String query) {
    // TODO: implement search
    throw UnimplementedError();
  }
}
