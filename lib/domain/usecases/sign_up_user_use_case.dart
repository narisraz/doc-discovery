import 'package:dartz/dartz.dart';
import 'package:docdiscovery/core/error/failure.dart';
import 'package:docdiscovery/core/utils.dart';
import 'package:docdiscovery/domain/repositories/auth_repository.dart';

class SignUpUserUseCase {
  final AuthRepository authRepository;
  final MailUtil mailUtil;

  SignUpUserUseCase({required this.authRepository, required this.mailUtil});

  Future<Either<Failure, bool>> execute(String email, String password) {
    if (!mailUtil.isValid(email)) {
      return Future.value(const Left(MailFormatFailure()));
    }
    return authRepository.signUp(email, password);
  }
}
