import 'package:dartz/dartz.dart';
import 'package:docdiscovery/core/error/failure.dart';
import 'package:docdiscovery/domain/entities/user.dart';

abstract class AuthRepository {
  Future<Either<Failure, String>> signUp(String email, String password);
  Future<Either<Failure, String>> signIn(String email, String password);
  Future<Either<Failure, UserEntity>> getConnectedUser();
}
