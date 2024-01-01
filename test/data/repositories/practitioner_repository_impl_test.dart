import 'dart:typed_data';

import 'package:algolia/algolia.dart';
import 'package:dartz/dartz.dart';
import 'package:docdiscovery/core/error/failure.dart';
import 'package:docdiscovery/domain/entities/address.dart';
import 'package:docdiscovery/domain/entities/practitioner.dart';
import 'package:docdiscovery/domain/repositories/practitioner_repository.dart';
import 'package:docdiscovery/data/repositories/practitioner_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';

import '../../helpers/fake_firebase_storage.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late Algolia algolia;
  late FakeFirebaseFirestore firestore;
  late FakeFirebaseStorage storage;
  late PractitionerRepositoryImpl practitionerRepository;

  const practitioner = PractitionerEntity(
      address: AddressEntity(road: "B 55"),
      familyName: "Smith",
      givenName: "John",
      tel: "555-555-5555",
      email: "U1TbJ@example.com");

  setUp(() async {
    firestore = FakeFirebaseFirestore();
    algolia = MockAlgolia();
    storage = FakeFirebaseStorage();
    practitionerRepository =
        PractitionerRepositoryImpl(firestore, algolia, storage);
  });

  test('should implement PractitionerRepository', () {
    expect(PractitionerRepositoryImpl(firestore, algolia, storage),
        isA<PractitionerRepository>());
  });

  test('should save practitioner to firestore', () async {
    final result = await practitionerRepository.savePractitioner(practitioner);

    expect(result, isA<Right<Failure, PractitionerEntity>>());
    expect(true, result.isRight());
    final expectedPractitioner =
        (result as Right<Failure, PractitionerEntity>).value;
    expect(expectedPractitioner.id, isNotNull);
    expect(expectedPractitioner.address, practitioner.address);
    expect(expectedPractitioner.familyName, practitioner.familyName);
    expect(expectedPractitioner.givenName, practitioner.givenName);
    expect(expectedPractitioner.tel, practitioner.tel);
    expect(expectedPractitioner.email, practitioner.email);
    expect(expectedPractitioner.onm, practitioner.onm);
  });

  test('should get practitioner from firestore', () async {
    final saved = await practitionerRepository.savePractitioner(practitioner);
    final id = (saved as Right<Failure, PractitionerEntity>).value.id;
    final result = await practitionerRepository.getById(id!);

    expect(result.isRight(), true);
    final expectedPractitioner =
        (result as Right<Failure, PractitionerEntity>).value;
    expect(expectedPractitioner.id, id);
  });

  test(
      'should upload profile picture to firebase storage and save generated url to practitioner model',
      () async {
    final saved = await practitionerRepository.savePractitioner(practitioner);
    final id = (saved as Right<Failure, PractitionerEntity>).value.id;

    final result = await practitionerRepository.uploadPractitionerProfile(
        id!, Uint8List(1));

    expect(result.isRight(), true);
    expect(result, const Right("url"));
    final found = await practitionerRepository.getById(id);
    expect(found, Right(practitioner.copyWith(profilePicture: "url", id: id)));
  });
}
