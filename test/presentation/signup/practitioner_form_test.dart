import 'package:dartz/dartz.dart';
import 'package:docdiscovery/core/providers.dart';
import 'package:docdiscovery/domain/entities/address.dart';
import 'package:docdiscovery/domain/entities/practitioner.dart';
import 'package:docdiscovery/presentation/signup/practitioner_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  const practitioner = PractitionerEntity(
      familyName: "Smith",
      givenName: "John",
      onm: 'onm',
      tel: '555-555-5555',
      email: 'U1TbJ@example.com',
      address: AddressEntity(road: "B 55", city: "London", country: "UK"));
  final practitionerRepository = MockPractitionerRepository();

  testWidgets('should render practitioner form', (tester) async {
    // arrange
    await tester.pumpWidget(ProviderScope(
        overrides: [
          practitionerRepositoryProvider
              .overrideWithValue(practitionerRepository)
        ],
        child: const MaterialApp(
            home: Material(child: Scaffold(body: PractitionerForm())))));
    // act
    await tester.pump();
    // assert
    expect(find.byType(PractitionerForm), findsOneWidget);
  });

  testWidgets('should save practitioner', (tester) async {
    // arrange
    await tester.pumpWidget(ProviderScope(
        overrides: [
          practitionerRepositoryProvider
              .overrideWithValue(practitionerRepository)
        ],
        child: const MaterialApp(
            home: Material(child: Scaffold(body: PractitionerForm())))));
    when(practitionerRepository.savePractitioner(any))
        .thenAnswer((_) => Future.value(const Right(practitioner)));

    // act
    await tester.enterText(
        find.byKey(const Key('given_name')), practitioner.givenName);
    await tester.enterText(
        find.byKey(const Key('family_name')), practitioner.familyName);
    await tester.enterText(find.byKey(const Key('onm')), practitioner.onm!);
    await tester.enterText(find.byKey(const Key('tel')), practitioner.tel);
    await tester.enterText(find.byKey(const Key('email')), practitioner.email!);
    await tester.enterText(
        find.byKey(const Key('road')), practitioner.address.road!);
    await tester.enterText(
        find.byKey(const Key('city')), practitioner.address.city!);
    await tester.enterText(
        find.byKey(const Key('country')), practitioner.address.country!);
    await tester.tap(find.byKey(const Key('submit_button')));

    // assert
    await tester.pumpAndSettle();
    verify(practitionerRepository.savePractitioner(any)).called(1);
    expect(find.byType(SnackBar), findsOneWidget);
  });
}
