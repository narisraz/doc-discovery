import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String picture;
  final String givenName;
  final String familyName;
  final String email;
  final String? id;

  const UserEntity(
      {required this.picture,
      required this.givenName,
      required this.familyName,
      required this.email,
      this.id});

  @override
  List<Object?> get props => [givenName, familyName, email, picture];

  UserEntity copyWith({String? id}) {
    return UserEntity(
      picture: picture,
      givenName: givenName,
      familyName: familyName,
      email: email,
      id: this.id ?? id,
    );
  }
}
