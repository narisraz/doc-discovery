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

  test('should have family name', () {
    const practitioner = PractitionerEntity(
      familyName: '',
      givenName: 'John',
      tel: '555-555-5555',
      address: AddressEntity(road: "B 55"),
    );

    expect(practitioner.isValid(), false);
  });

  test('should have given name', () {
    const practitioner = PractitionerEntity(
      familyName: 'Smith',
      givenName: '',
      tel: '555-555-5555',
      address: AddressEntity(road: "B 55"),
    );

    expect(practitioner.isValid(), false);
  });

  test('should have tel', () {
    const practitioner = PractitionerEntity(
      familyName: 'Smith',
      givenName: 'John',
      tel: '',
      address: AddressEntity(road: "B 55"),
    );

    expect(practitioner.isValid(), false);
  });

  test('should have address', () {
    const practitioner = PractitionerEntity(
      familyName: 'Smith',
      givenName: 'John',
      tel: '555-555-5555',
      address: AddressEntity(road: "", city: "", country: ""),
    );

    expect(practitioner.isValid(), false);
  });
}
