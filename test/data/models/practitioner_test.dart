import 'package:docdiscovery/data/models/address.dart';
import 'package:docdiscovery/data/models/practitioner.dart';
import 'package:docdiscovery/domain/entities/address.dart';
import 'package:docdiscovery/domain/entities/practitioner.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('should parse to json', () {
    const practitioner = PractitionerModel(
      address: AddressModel(road: "B 55"),
      familyName: "Smith",
      givenName: "John",
      tel: "555-555-5555",
      email: "U1TbJ@example.com",
      onm: 'onm',
    );

    expect(practitioner.toJson(), {
      "address": {"road": "B 55"},
      "familyName": "Smith",
      "givenName": "John",
      "tel": "555-555-5555",
      "email": "U1TbJ@example.com",
      "onm": 'onm'
    });
  });

  test('should remove null values', () {
    const practitioner = PractitionerModel(
      address: AddressModel(road: "B 55"),
      familyName: "Smith",
      givenName: "John",
      tel: "555-555-5555",
      email: "U1TbJ@example.com",
    );

    expect(practitioner.toJson(), {
      "address": {"road": "B 55"},
      "familyName": "Smith",
      "givenName": "John",
      "tel": "555-555-5555",
      "email": "U1TbJ@example.com",
    });
  });

  test('from practitioner entity', () {
    const practitioner = PractitionerEntity(
      address: AddressEntity(road: "B 55"),
      familyName: "Smith",
      givenName: "John",
      tel: "555-555-5555",
      email: "U1TbJ@example.com",
      onm: 'onm',
    );

    expect(
        PractitionerModel.fromPractitionerEntity(practitioner),
        const PractitionerModel(
          address: AddressModel(road: "B 55"),
          familyName: "Smith",
          givenName: "John",
          tel: "555-555-5555",
          email: "U1TbJ@example.com",
          onm: 'onm',
        ));
  });
}
