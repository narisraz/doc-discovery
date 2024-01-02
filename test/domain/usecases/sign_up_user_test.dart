import 'package:dartz/dartz.dart';
import 'package:docdiscovery/core/error/failure.dart';
import 'package:docdiscovery/domain/usecases/sign_up_user_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockAuthRepository authRepository;
  late MockMailUtil mailUtil;
  late SignUpUserUseCase signUpUserUseCase;

  setUp(() {
    mailUtil = MockMailUtil();
    authRepository = MockAuthRepository();
    signUpUserUseCase = SignUpUserUseCase(
      authRepository: authRepository,
      mailUtil: mailUtil,
    );
  });

  test('should signup user', () async {
    // when
    when(authRepository.signUp(any, any))
        .thenAnswer((_) => Future.value(const Right(true)));
    final result =
        await signUpUserUseCase.execute("email@mail.com", "password");

    // then
    verify(authRepository.signUp(
            argThat(equals("email@mail.com")), argThat(equals("password"))))
        .called(1);
    expect(result.isRight(), true);
  });

  test('should fail signup given bad email format', () async {
    // when
    when(mailUtil.isValid(any)).thenAnswer((_) => false);
    final result = await signUpUserUseCase.execute("email", "password");

    // then
    verifyNever(authRepository.signUp(any, any));
    expect(result, const Left(MailFormatFailure()));
  });
}
