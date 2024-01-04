import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:docdiscovery/domain/entities/address.dart';
import 'package:docdiscovery/domain/entities/practitioner.dart';
import 'package:docdiscovery/domain/usecases/upload_practitioner_profile_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late UploadPractitionerProfileUseCase uploadPractitionerProfileUseCase;
  late MockSavePractitionerUseCase savePractitionerUseCase;
  final practitionerRepository = MockPractitionerRepository();
  const practitioner = PractitionerEntity(
      authId: "authId",
      address: AddressEntity(road: "B 55", city: "London", country: "UK"),
      familyName: "Smith",
      givenName: "John",
      tel: "555-555-5555",
      email: "U1TbJ@example.com");

  setUp(() {
    savePractitionerUseCase = MockSavePractitionerUseCase();
    uploadPractitionerProfileUseCase = UploadPractitionerProfileUseCase(
        practitionerRepository: practitionerRepository);
  });

  test('should use the repository to upload the practitioner', () async {
    // arrange
    when(practitionerRepository.uploadPractitionerProfile(any, any))
        .thenAnswer((_) => Future.value(const Right("")));
    when(savePractitionerUseCase.execute(practitioner))
        .thenAnswer((_) async => const Right(practitioner));

    // act
    await uploadPractitionerProfileUseCase.execute(
        "practitionerId", Uint8List(0));

    // assert
    verify(practitionerRepository.uploadPractitionerProfile(any, any));
  });
}
