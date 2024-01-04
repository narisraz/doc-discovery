import 'package:docdiscovery/domain/entities/address.dart';
import 'package:docdiscovery/domain/entities/practitioner.dart';
import 'package:docdiscovery/domain/usecases/search_practitioner_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late SearchPractitionerUseCase searchPractitionerUseCase;
  final practitionerRepository = MockPractitionerRepository();
  const mockPractitioner = PractitionerEntity(
      authId: "authId",
      address: AddressEntity(road: "B 55", city: "London", country: "UK"),
      familyName: "Smith",
      givenName: "John",
      tel: "555-555-5555",
      email: "U1TbJ@example.com");

  setUp(() {
    searchPractitionerUseCase = SearchPractitionerUseCase(
        practitionerRepository: practitionerRepository);
  });

  test('should search practitioner', () async {
    when(practitionerRepository.search(any))
        .thenAnswer((_) => Future.value([mockPractitioner]));
    final results = await searchPractitionerUseCase.execute('John');

    verify(practitionerRepository.search(any)).called(1);
    expect(results, [mockPractitioner]);
  });
}
