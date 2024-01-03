import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:docdiscovery/core/error/failure.dart';
import 'package:docdiscovery/data/data_sources/firebase_firestore/firestore_collections.dart';
import 'package:docdiscovery/data/models/user.dart';
import 'package:docdiscovery/domain/entities/user.dart';
import 'package:docdiscovery/domain/repositories/user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  final FirebaseFirestore firestore;

  UserRepositoryImpl({required this.firestore});

  @override
  Future<Either<Failure, UserEntity>> saveUserInfo(UserEntity user) {
    final userModel = UserModel.fromUserEntity(user);

    return FirestoreCollections.getUserCollection(firestore)
        .add(userModel)
        .then((value) => value.get())
        .then((value) =>
            Right(value.data()!.toUserEntity().copyWith(id: value.id)));
  }
}
