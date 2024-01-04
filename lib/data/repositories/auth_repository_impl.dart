import 'package:dartz/dartz.dart';
import 'package:docdiscovery/core/error/failure.dart';
import 'package:docdiscovery/domain/repositories/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuth auth;

  AuthRepositoryImpl({required this.auth});

  @override
  Future<Either<Failure, String>> signUp(String email, String password) {
    return auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) => Right(value.user!.uid));
  }

  @override
  Future<Either<Failure, String>> signIn(String email, String password) {
    return auth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) => Right(value.user!.uid));
  }

  @override
  Future<Either<Failure, String>> getConnectedUser() {
    if (auth.currentUser == null) {
      return Future.value(const Left(NoUserConnectedFailure()));
    }
    return Future.value(Right(auth.currentUser!.uid));
  }
}
