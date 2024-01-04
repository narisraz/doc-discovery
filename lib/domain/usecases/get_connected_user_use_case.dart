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

  Stream<Either<Failure, UserEntity>> execute() {
    final auth = authRepository.getConnectedUser();
    return auth.asyncMap((event) async {
      if (event.isLeft()) {
        return const Left(NoUserConnectedFailure());
      }
      return await userRepository.getByAuthId(event.getOrElse(() => ""));
    });
  }
}
