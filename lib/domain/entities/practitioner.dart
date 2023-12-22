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
  }) {
    return PractitionerEntity(
      address: address,
      familyName: familyName,
      givenName: givenName,
      tel: tel,
      id: id ?? this.id,
      email: email,
      onm: onm,
    );
  }

  isValid() {
    return familyName.isNotEmpty &&
        givenName.isNotEmpty &&
        tel.isNotEmpty &&
        address.road != null &&
        address.road!.isNotEmpty &&
        address.city!.isNotEmpty &&
        address.country!.isNotEmpty;
  }

  @override
  List<Object?> get props =>
      [address, familyName, givenName, tel, email, onm, id];
}
