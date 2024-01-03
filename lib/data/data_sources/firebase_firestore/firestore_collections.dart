import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:docdiscovery/data/models/practitioner.dart';
import 'package:docdiscovery/data/models/user.dart';

class FirestoreCollections {
  static const String practitionerCollection = 'practitioners';
  static const String usersCollection = 'users';

  static CollectionReference<PractitionerModel> getPractitionerCollection(
          FirebaseFirestore firestore) =>
      firestore
          .collection(FirestoreCollections.practitionerCollection)
          .withConverter<PractitionerModel>(
              fromFirestore: (snapshot, _) =>
                  PractitionerModel.fromJson(snapshot.data()!),
              toFirestore: (value, _) => value.toJson());

  static CollectionReference<UserModel> getUserCollection(
          FirebaseFirestore firestore) =>
      firestore
          .collection(FirestoreCollections.usersCollection)
          .withConverter<UserModel>(
              fromFirestore: (snapshot, _) =>
                  UserModel.fromJson(snapshot.data()!),
              toFirestore: (value, _) => value.toJson());
}
