import 'package:docdiscovery/domain/entities/address.dart';
import 'package:docdiscovery/domain/entities/practitioner.dart';
import 'package:docdiscovery/presentation/profile/practitioner_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const practitioner = PractitionerEntity(
      authId: "authId",
      familyName: "Smith",
      givenName: "John",
      onm: 'onm',
      tel: '555-555-5555',
      email: 'U1TbJ@example.com',
      address: AddressEntity(road: "B 55", city: "London", country: "UK"));

  testWidgets('shoud contain practitioner info', (tester) async {
    // arrange
    await tester.pumpWidget(MaterialApp(
        home: Material(
            child: Scaffold(
                body: PractitionerProfile(
      practitioner: practitioner,
      onUpdateProfilePicture: (_) {},
    )))));

    // act
    await tester.pumpAndSettle();

    // assert
    expect(find.text("${practitioner.givenName} ${practitioner.familyName}"),
        findsOneWidget);
    expect(find.text(practitioner.tel), findsOneWidget);
    expect(find.text(practitioner.email!), findsOneWidget);
    expect(find.text(practitioner.onm!), findsOneWidget);
    // expect(
    //     find.text(
    //       "${practitioner.address.road!} - ${practitioner.address.city!} - ${practitioner.address.country!}",
    //     ),
    //     findsOneWidget);
  });
}
