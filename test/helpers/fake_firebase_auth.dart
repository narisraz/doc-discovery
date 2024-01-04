import 'package:mockito/mockito.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FakeUser extends Fake implements User {
  @override
  String get uid => 'uid';
}

class FakeUserCredential extends Fake implements UserCredential {
  @override
  User? get user => FakeUser();
}

class FakeFirebaseAuth extends Fake implements FirebaseAuth {
  @override
  User? get currentUser {
    return FakeUser();
  }

  @override
  Future<UserCredential> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    return Future.value(FakeUserCredential());
  }

  @override
  Future<UserCredential> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    return Future.value(FakeUserCredential());
  }
}
