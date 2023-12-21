import 'package:docdiscovery/data/models/address.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('should parse to json', () {
    final now = DateTime.now();
    final address = AddressModel(
        road: "B 55",
        city: "London",
        postcode: "W1 1AA",
        country: "UK",
        createdAt: now,
        modifiedAt: now);

    expect(address.toJson(), {
      "road": "B 55",
      "city": "London",
      "postcode": "W1 1AA",
      "country": "UK",
      "createdAt": now,
      "modifiedAt": now
    });
  });

  test('should remove null values', () {
    final now = DateTime.now();
    final address = AddressModel(road: "B 55", createdAt: now, modifiedAt: now);

    expect(address.toJson(),
        {"road": "B 55", "createdAt": now, "modifiedAt": now});
  });
}
