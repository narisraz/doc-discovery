import 'package:dartz/dartz.dart';
import 'package:docdiscovery/core/error/failure.dart';
import 'package:docdiscovery/data/repositories/user_repository_impl.dart';
import 'package:docdiscovery/domain/entities/user.dart';
import 'package:docdiscovery/domain/repositories/user_repository.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late FakeFirebaseFirestore firestore;
  late UserRepository userRepository;

  setUp(() {
    firestore = FakeFirebaseFirestore();
    populateUserCollection(firestore);
    userRepository = UserRepositoryImpl(firestore: firestore);
  });

  test('should get user by authId', () async {
    final result = await userRepository.getByAuthId("authId");

    expect(result, isA<Right<Failure, UserEntity>>());
    expect(
        result,
        const Right(UserEntity(
          email: "mail@mail.com",
          authId: "authId",
          givenName: "John",
          familyName: "Smith",
          picture: "svg",
        )));
  });
}

void populateUserCollection(FakeFirebaseFirestore firestore) {
  firestore.collection("users").doc("authId").set({
    "authId": "authId",
    "email": "mail@mail.com",
    "givenName": "John",
    "familyName": "Smith",
    "picture": "svg",
  });
}
