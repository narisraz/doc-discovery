import 'package:dartz/dartz.dart';
import 'package:docdiscovery/core/error/failure.dart';
import 'package:docdiscovery/domain/entities/user.dart';
import 'package:docdiscovery/domain/usecases/sign_up_user_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockUserRepository userRepository;
  late MockAuthRepository authRepository;
  late MockMailUtil mailUtil;
  late SignUpUserUseCase signUpUserUseCase;

  setUp(() {
    mailUtil = MockMailUtil();
    authRepository = MockAuthRepository();
    userRepository = MockUserRepository();
    signUpUserUseCase = SignUpUserUseCase(
      authRepository: authRepository,
      userRepository: userRepository,
      mailUtil: mailUtil,
    );
  });

  test('should signup user and save other user info', () async {
    // Given
    final request = SignUpUserRequest(
        email: "email@mail.com",
        password: "password",
        picture: "svg",
        givenName: "John",
        familyName: "Smith");

    // when
    when(mailUtil.isValid(any)).thenAnswer((_) => true);
    when(authRepository.signUp(any, any))
        .thenAnswer((_) => Future.value(const Right("id")));
    when(userRepository.saveUserInfo(any))
        .thenAnswer((_) => Future.value(Right(UserEntity(
              email: request.email,
              id: "id",
              givenName: request.givenName,
              familyName: request.familyName,
              picture: request.picture,
            ))));
    final result = await signUpUserUseCase.execute(request);

    // then
    verify(authRepository.signUp(
            argThat(equals("email@mail.com")), argThat(equals("password"))))
        .called(1);
    verify(userRepository.saveUserInfo(argThat(isA<UserEntity>()))).called(1);
    expect(result.isRight(), true);
  });

  test('should fail signup given bad email format', () async {
    // Given
    final request = SignUpUserRequest(
        email: "email@mail.com",
        password: "password",
        picture: "svg",
        givenName: "John",
        familyName: "Smith");

    // when
    when(mailUtil.isValid(any)).thenAnswer((_) => false);
    final result = await signUpUserUseCase.execute(request);

    // then
    verifyNever(authRepository.signUp(any, any));
    expect(result, const Left(MailFormatFailure()));
  });
}
