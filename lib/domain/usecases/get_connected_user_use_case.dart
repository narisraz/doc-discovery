import 'package:dartz/dartz.dart';
import 'package:docdiscovery/core/error/failure.dart';
import 'package:docdiscovery/domain/entities/user.dart';
import 'package:docdiscovery/domain/repositories/auth_repository.dart';

class GetConnectedUserUseCase {
  final AuthRepository authRepository;

  GetConnectedUserUseCase({required this.authRepository});

  Future<Either<Failure, UserEntity>> execute() {
    return authRepository.getConnectedUser();
  }
}
