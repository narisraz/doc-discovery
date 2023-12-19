import 'package:docdiscovery/domain/entities/address.dart';
import 'package:equatable/equatable.dart';

class PractitionerEntity extends Equatable {
  final Address address;
  final String familyName;
  final String givenName;
  final String tel;
  final String email;
  final String onm;

  const PractitionerEntity(
      {required this.address,
      required this.familyName,
      required this.givenName,
      required this.tel,
      this.email = '',
      this.onm = ''});

  @override
  List<Object?> get props => [address, familyName, givenName, tel, email, onm];
}
