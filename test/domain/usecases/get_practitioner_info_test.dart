import 'package:dartz/dartz.dart';
import 'package:docdiscovery/domain/entities/address.dart';
import 'package:docdiscovery/domain/entities/practitioner.dart';
import 'package:docdiscovery/domain/usecases/get_practitioner_info_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  final practitionerRepository = MockPractitionerRepository();
  const practitioner = PractitionerEntity(
      address: AddressEntity(road: "B 55", city: "London", country: "UK"),
      familyName: "Smith",
      givenName: "John",
      tel: "555-555-5555",
      email: "U1TbJ@example.com");

  test('should return practitioner info', () async {
    final getPractitionerInfoUseCase = GetPractitionerInfoUseCase(
        practitionerRepository: practitionerRepository);
    when(practitionerRepository.getById(any))
        .thenAnswer((_) => Future.value(const Right(practitioner)));

    final result = await getPractitionerInfoUseCase.execute("practitionerId");

    verify(practitionerRepository.getById(any)).called(1);
    expect(result, const Right(practitioner));
  });
}
