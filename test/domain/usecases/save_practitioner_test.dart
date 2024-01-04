import 'package:dartz/dartz.dart';
import 'package:docdiscovery/domain/entities/address.dart';
import 'package:docdiscovery/domain/entities/practitioner.dart';
import 'package:docdiscovery/domain/usecases/save_practitioner_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockPractitionerRepository mockPractitionerRepository;
  late SavePractitionerUseCase savePractitionerUseCase;

  setUp(() {
    mockPractitionerRepository = MockPractitionerRepository();
    savePractitionerUseCase = SavePractitionerUseCase(
        practitionerRepository: mockPractitionerRepository);
  });

  const practitioner = PractitionerEntity(
      authId: "authId",
      address: AddressEntity(road: "B 55", city: "London", country: "UK"),
      familyName: "Smith",
      givenName: "John",
      tel: "555-555-5555",
      email: "U1TbJ@example.com");

  const invalidPractitioner = PractitionerEntity(
      authId: "authId",
      address: AddressEntity(road: "B 55"),
      familyName: "",
      givenName: "John",
      tel: "555-555-5555",
      email: "U1TbJ@example.com");

  test('should use the repository to save the practitioner', () async {
    // arrange
    when(mockPractitionerRepository.savePractitioner(practitioner))
        .thenAnswer((_) async => const Right(practitioner));

    // act
    final result = await savePractitionerUseCase.execute(practitioner);

    // assert
    expect(result.isRight(), true);
    expect(result, const Right(practitioner));
  });

  test('should not save if practitioner is invalid', () async {
    // act
    final result = await savePractitionerUseCase.execute(invalidPractitioner);

    // assert
    expect(result.isLeft(), true);
  });
}
