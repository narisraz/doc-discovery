import 'package:dartz/dartz.dart';
import 'package:docdiscovery/core/error/failure.dart';
import 'package:docdiscovery/domain/entities/user.dart';
import 'package:docdiscovery/domain/usecases/sign_in_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockUserRepository userRepository;
  late MockAuthRepository authRepository;
  late SignInUserUseCase signInUserUseCase;

  setUp(() {
    userRepository = MockUserRepository();
    authRepository = MockAuthRepository();
    signInUserUseCase = SignInUserUseCase(
      authRepository: authRepository,
      userRepository: userRepository,
    );
  });

  test('should sign in user', () async {
    when(authRepository.signIn(any, any))
        .thenAnswer((_) => Future.value(const Right("id")));
    when(userRepository.getByAuthId(any))
        .thenAnswer((_) => Future.value(const Right(UserEntity(
              email: "mail@mail.com",
              authId: "id",
              givenName: "John",
              familyName: "Smith",
              picture: "svg",
            ))));
    final result = await signInUserUseCase.execute("mail@mail.com", "password");

    verify(authRepository.signIn(
            argThat(equals("mail@mail.com")), argThat(equals("password"))))
        .called(1);
    verify(userRepository.getByAuthId(argThat(equals("id")))).called(1);
    expect(result, isA<Right<Failure, UserEntity>>());
  });
}
