import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:docdiscovery/data/models/practitioner.dart';

class FirestoreCollections {
  static const String practitionerCollection = 'practitioners';

  static CollectionReference<PractitionerModel> getPractitionerCollection(
          FirebaseFirestore firestore) =>
      firestore
          .collection(FirestoreCollections.practitionerCollection)
          .withConverter<PractitionerModel>(
              fromFirestore: (snapshot, _) =>
                  PractitionerModel.fromJson(snapshot.data()!),
              toFirestore: (value, _) => value.toJson());
}
