import 'package:docdiscovery/data/models/address.dart';
import 'package:docdiscovery/data/models/practitioner.dart';
import 'package:docdiscovery/domain/entities/address.dart';
import 'package:docdiscovery/domain/entities/practitioner.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('should parse to json', () {
    const practitioner = PractitionerModel(
      authId: "authId",
      address: AddressModel(road: "B 55"),
      familyName: "Smith",
      givenName: "John",
      tel: "555-555-5555",
      email: "U1TbJ@example.com",
      onm: 'onm',
    );

    expect(practitioner.toJson(), {
      "authId": "authId",
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
      authId: "authId",
      address: AddressModel(road: "B 55"),
      familyName: "Smith",
      givenName: "John",
      tel: "555-555-5555",
      email: "U1TbJ@example.com",
    );

    expect(practitioner.toJson(), {
      "authId": "authId",
      "address": {"road": "B 55"},
      "familyName": "Smith",
      "givenName": "John",
      "tel": "555-555-5555",
      "email": "U1TbJ@example.com",
    });
  });

  test('from practitioner entity', () {
    const practitioner = PractitionerEntity(
      authId: "authId",
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
          authId: "authId",
          address: AddressModel(road: "B 55"),
          familyName: "Smith",
          givenName: "John",
          tel: "555-555-5555",
          email: "U1TbJ@example.com",
          onm: 'onm',
        ));
  });

  test('should copy values', () {
    const practitioner = PractitionerModel(
      authId: "authId",
      address: AddressModel(road: "B 55"),
      familyName: "Smith",
      givenName: "John",
      tel: "555-555-5555",
      email: "U1TbJ@example.com",
      onm: 'onm',
      id: 'id',
    );
    final now = DateTime.now();

    expect(
        practitioner.copyWith(
          createdAt: now,
          modifiedAt: now,
        ),
        PractitionerModel(
          authId: "authId",
          address: const AddressModel(road: "B 55"),
          familyName: "Smith",
          givenName: "John",
          tel: "555-555-5555",
          email: "U1TbJ@example.com",
          id: 'id',
          onm: 'onm',
          createdAt: now,
          modifiedAt: now,
        ));
  });
}
