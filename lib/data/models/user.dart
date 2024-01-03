import 'package:docdiscovery/domain/entities/user.dart';
import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String picture;
  final String givenName;
  final String familyName;
  final String email;
  final String? authId;

  const UserModel(
      {required this.picture,
      required this.givenName,
      required this.familyName,
      required this.email,
      required this.authId});

  @override
  List<Object?> get props => [givenName, familyName, email, authId];

  static UserModel fromJson(Map<String, dynamic> map) {
    return UserModel(
      picture: map['picture'],
      givenName: map['givenName'],
      familyName: map['familyName'],
      email: map['email'],
      authId: map['authId'],
    );
  }

  toJson() {
    return {
      'picture': picture,
      'givenName': givenName,
      'familyName': familyName,
      'email': email,
      'authId': authId,
    };
  }

  static UserModel fromUserEntity(UserEntity user) {
    return UserModel(
      givenName: user.givenName,
      familyName: user.familyName,
      email: user.email,
      authId: user.authId,
      picture: user.picture,
    );
  }

  UserEntity toUserEntity() {
    return UserEntity(
      givenName: givenName,
      familyName: familyName,
      email: email,
      authId: authId,
      picture: picture,
    );
  }
}
