import 'package:dartz/dartz.dart';
import 'package:docdiscovery/data/repositories/auth_repository_impl.dart';
import 'package:docdiscovery/domain/repositories/auth_repository.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/fake_firebase_auth.dart';

void main() {
  late AuthRepository authRepository;
  late FakeFirebaseAuth fakeFirebaseAuth;

  setUp(() {
    fakeFirebaseAuth = FakeFirebaseAuth();
    authRepository = AuthRepositoryImpl(auth: fakeFirebaseAuth);
  });

  test('should create user with email and password', () async {
    final result = await authRepository.signUp("mail@mail.com", "password");

    expect(result, const Right("uid"));
  });

  test('should sign in to firebase auth', () async {
    final result = await authRepository.signIn("mail@mail.com", "password");

    expect(result, const Right("uid"));
  });
}
