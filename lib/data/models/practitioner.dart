import 'package:docdiscovery/data/models/address.dart';
import 'package:docdiscovery/domain/entities/practitioner.dart';
import 'package:equatable/equatable.dart';

class PractitionerModel extends Equatable {
  final AddressModel address;
  final String familyName;
  final String givenName;
  final String tel;
  final String? id;
  final String? email;
  final String? onm;
  final String? profilePicture;

  final DateTime? createdAt;
  final DateTime? modifiedAt;

  const PractitionerModel({
    required this.address,
    required this.familyName,
    required this.givenName,
    required this.tel,
    this.id,
    this.email,
    this.onm,
    this.profilePicture,
    this.createdAt,
    this.modifiedAt,
  });

  Map<String, dynamic> toJson() {
    final map = {
      'address': address.toJson(),
      'familyName': familyName,
      'givenName': givenName,
      'tel': tel,
      'email': email,
      'onm': onm,
      'id': id,
      'profilePicture': profilePicture,
      'createdAt': createdAt,
      'modifiedAt': modifiedAt,
    };
    map.removeWhere((key, value) => value == null);

    return map;
  }

  static PractitionerModel fromJson(Map<String, dynamic> value) {
    return PractitionerModel(
      address: AddressModel.fromJson(value['address']),
      familyName: value['familyName'],
      givenName: value['givenName'],
      tel: value['tel'],
      email: value['email'],
      onm: value['onm'],
      id: value['id'],
      profilePicture: value['profilePicture'],
    );
  }

  @override
  List<Object?> get props =>
      [address, familyName, givenName, tel, email, onm, id, profilePicture];

  static PractitionerModel fromPractitionerEntity(
      PractitionerEntity practitioner) {
    return PractitionerModel(
      address: AddressModel.fromAddressEntity(practitioner.address),
      familyName: practitioner.familyName,
      givenName: practitioner.givenName,
      tel: practitioner.tel,
      email: practitioner.email,
      onm: practitioner.onm,
      id: practitioner.id,
      profilePicture: practitioner.profilePicture,
    );
  }

  PractitionerEntity toPractitionerEntity() {
    return PractitionerEntity(
      address: address.toAddressEntity(),
      familyName: familyName,
      givenName: givenName,
      tel: tel,
      email: email,
      onm: onm,
      id: id,
      profilePicture: profilePicture,
    );
  }

  PractitionerModel copyWith({
    DateTime? createdAt,
    DateTime? modifiedAt,
  }) {
    return PractitionerModel(
      address: address,
      familyName: familyName,
      givenName: givenName,
      tel: tel,
      id: id,
      email: email,
      onm: onm,
      createdAt: createdAt ?? this.createdAt,
      modifiedAt: modifiedAt ?? this.modifiedAt,
      profilePicture: profilePicture,
    );
  }
}
