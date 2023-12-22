import 'package:docdiscovery/domain/entities/address.dart';
import 'package:docdiscovery/domain/entities/practitioner.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('should copy values', () {
    const practitioner = PractitionerEntity(
      address: AddressEntity(road: "B 55"),
      familyName: "Smith",
      givenName: "John",
      tel: "555-555-5555",
      email: "U1TbJ@example.com",
      onm: 'onm',
    );

    expect(
        practitioner.copyWith(
          id: 'id',
        ),
        const PractitionerEntity(
          address: AddressEntity(road: "B 55"),
          familyName: "Smith",
          givenName: "John",
          tel: "555-555-5555",
          email: "U1TbJ@example.com",
          id: 'id',
          onm: 'onm',
        ));
  });
}
