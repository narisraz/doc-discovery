import 'package:dartz/dartz.dart';
import 'package:docdiscovery/core/error/failure.dart';
import 'package:docdiscovery/domain/entities/address.dart';
import 'package:docdiscovery/domain/entities/practitioner.dart';
import 'package:docdiscovery/domain/repositories/practitioner_repository.dart';
import 'package:docdiscovery/data/repositories/practitioner_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';

void main() {
  late FakeFirebaseFirestore firestore;

  const practitioner = PractitionerEntity(
      address: AddressEntity(road: "B 55"),
      familyName: "Smith",
      givenName: "John",
      tel: "555-555-5555",
      email: "U1TbJ@example.com");

  setUp(() async {
    firestore = FakeFirebaseFirestore();
  });

  test('should implement PractitionerRepository', () {
    expect(
        PractitionerRepositoryImpl(firestore), isA<PractitionerRepository>());
  });

  test('should save practitioner to firestore', () async {
    final practitionerRepository = PractitionerRepositoryImpl(firestore);

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
}
