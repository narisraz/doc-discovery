import 'package:dartz/dartz.dart';
import 'package:docdiscovery/core/error/failure.dart';
import 'package:docdiscovery/domain/entities/user.dart';
import 'package:docdiscovery/domain/repositories/auth_repository.dart';
import 'package:docdiscovery/domain/repositories/user_repository.dart';

class GetConnectedUserUseCase {
  final AuthRepository authRepository;
  final UserRepository userRepository;

  GetConnectedUserUseCase({
    required this.authRepository,
    required this.userRepository,
  });

  Future<Either<Failure, UserEntity>> execute() async {
    final Either<Failure, String> auth =
        await authRepository.getConnectedUser();
    if (auth.isLeft()) {
      return Future.value(const Left(NoUserConnectedFailure()));
    }
    return userRepository.getByAuthId(auth.getOrElse(() => ""));
  }
}
