import 'package:dartz/dartz.dart';
import 'package:docdiscovery/core/error/failure.dart';
import 'package:docdiscovery/domain/entities/user.dart';
import 'package:docdiscovery/domain/usecases/get_connected_user_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockAuthRepository authRepository;
  late MockUserRepository userRepository;

  setUp(() {
    authRepository = MockAuthRepository();
    userRepository = MockUserRepository();
  });

  test('should get connected user', () async {
    when(authRepository.getConnectedUser())
        .thenAnswer((_) => Future.value(const Right("uid")));
    when(userRepository.getByAuthId(any))
        .thenAnswer((_) => Future.value(const Right(UserEntity(
              email: "mail@mail.com",
              authId: "uid",
              givenName: "John",
              familyName: "Smith",
              picture: "svg",
            ))));
    final getConnectedUserUseCase = GetConnectedUserUseCase(
      authRepository: authRepository,
      userRepository: userRepository,
    );

    final result = await getConnectedUserUseCase.execute();

    verify(authRepository.getConnectedUser()).called(1);
    verify(userRepository.getByAuthId(argThat(equals("uid")))).called(1);
    expect(result, isA<Either<Failure, UserEntity>>());
  });
}
