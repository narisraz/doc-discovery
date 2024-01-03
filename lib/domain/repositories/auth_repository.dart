import 'package:dartz/dartz.dart';
import 'package:docdiscovery/core/error/failure.dart';

abstract class AuthRepository {
  Future<Either<Failure, String>> signUp(String email, String password);
}
