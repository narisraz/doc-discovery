import 'package:dartz/dartz.dart';
import 'package:docdiscovery/domain/usecases/get_practitioner_profile_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  final practitionerRepository = MockPractitionerRepository();

  test('should return practitioner profile', () async {
    final getPractitionerInfoUseCase = GetPractitionerProfileUseCase(
        practitionerRepository: practitionerRepository);
    when(practitionerRepository.getProfile(any))
        .thenAnswer((_) => Future.value(const Right("")));

    final result = await getPractitionerInfoUseCase.execute("practitionerId");

    verify(practitionerRepository.getProfile(any)).called(1);
    expect(result.isRight(), true);
  });
}
