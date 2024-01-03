import 'package:dartz/dartz.dart';
import 'package:docdiscovery/core/error/failure.dart';
import 'package:docdiscovery/core/utils.dart';
import 'package:docdiscovery/domain/entities/user.dart';
import 'package:docdiscovery/domain/repositories/auth_repository.dart';
import 'package:docdiscovery/domain/repositories/user_repository.dart';

class SignUpUserRequest {
  final String givenName;
  final String familyName;
  final String email;
  final String password;
  final String picture;

  SignUpUserRequest(
      {required this.email,
      required this.password,
      required this.picture,
      required this.familyName,
      required this.givenName});
}

class SignUpUserUseCase {
  final AuthRepository authRepository;
  final UserRepository userRepository;
  final MailUtil mailUtil;

  SignUpUserUseCase(
      {required this.authRepository,
      required this.mailUtil,
      required this.userRepository});

  Future<Either<Failure, UserEntity>> execute(SignUpUserRequest request) {
    if (!mailUtil.isValid(request.email)) {
      return Future.value(const Left(MailFormatFailure()));
    }
    return authRepository.signUp(request.email, request.password).then(
          (value) => userRepository.saveUserInfo(UserEntity(
              picture: request.picture,
              givenName: request.givenName,
              familyName: request.familyName,
              email: request.email)),
        );
  }
}
