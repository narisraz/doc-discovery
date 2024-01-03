import 'package:dartz/dartz.dart';
import 'package:docdiscovery/core/error/failure.dart';
import 'package:docdiscovery/domain/entities/user.dart';
import 'package:docdiscovery/domain/repositories/auth_repository.dart';
import 'package:docdiscovery/domain/repositories/user_repository.dart';

class SignInUserUseCase {
  final AuthRepository authRepository;
  final UserRepository userRepository;

  SignInUserUseCase(
      {required this.authRepository, required this.userRepository});

  Future<Either<Failure, UserEntity>> execute(
      String email, String password) async {
    return authRepository
        .signIn(email, password)
        .then((value) => userRepository.getByAuthId(value.getOrElse(() => "")));
  }
}
