import 'package:docdiscovery/domain/entities/address.dart';
import 'package:equatable/equatable.dart';

class PractitionerEntity extends Equatable {
  final AddressEntity address;
  final String familyName;
  final String givenName;
  final String tel;
  final String? id;
  final String? email;
  final String? onm;

  const PractitionerEntity(
      {required this.address,
      required this.familyName,
      required this.givenName,
      required this.tel,
      this.id,
      this.email,
      this.onm});

  PractitionerEntity copyWith({
    String? id,
    AddressEntity? address,
    String? familyName,
    String? givenName,
    String? tel,
    String? email,
    String? onm,
  }) {
    return PractitionerEntity(
      address: address ?? this.address,
      familyName: familyName ?? this.familyName,
      givenName: givenName ?? this.givenName,
      tel: tel ?? this.tel,
      id: id ?? this.id,
      email: email ?? this.email,
      onm: onm ?? this.onm,
    );
  }

  @override
  List<Object?> get props =>
      [address, familyName, givenName, tel, email, onm, id];
}
