import 'package:dartz/dartz.dart';
import 'package:docdiscovery/core/error/failure.dart';
import 'package:docdiscovery/domain/entities/user.dart';

abstract class UserRepository {
  Future<Either<Failure, UserEntity>> saveUserInfo(UserEntity user);
  Future<Either<Failure, UserEntity>> getByAuthId(String authId);
}
