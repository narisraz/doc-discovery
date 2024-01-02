import 'package:mockito/mockito.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FakeUserCredential extends Fake implements UserCredential {}

class FakeFirebaseAuth extends Fake implements FirebaseAuth {
  @override
  Future<UserCredential> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    return Future.value(FakeUserCredential());
  }
}
