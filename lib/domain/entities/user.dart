import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String picture;
  final String givenName;
  final String familyName;
  final String email;
  final String? authId;

  const UserEntity(
      {required this.picture,
      required this.givenName,
      required this.familyName,
      required this.email,
      this.authId});

  @override
  List<Object?> get props => [givenName, familyName, email, picture];

  UserEntity copyWith({String? id}) {
    return UserEntity(
      picture: picture,
      givenName: givenName,
      familyName: familyName,
      email: email,
      authId: id ?? authId,
    );
  }
}
