import 'package:dartz/dartz.dart';
import 'package:docdiscovery/core/providers.dart';
import 'package:docdiscovery/domain/entities/address.dart';
import 'package:docdiscovery/domain/entities/practitioner.dart';
import 'package:docdiscovery/presentation/profile/practitioner_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockGetPractitionerInfoUseCase getPractitionerInfoUseCase;
  const practitioner = PractitionerEntity(
      familyName: "Smith",
      givenName: "John",
      onm: 'onm',
      tel: '555-555-5555',
      email: 'U1TbJ@example.com',
      address: AddressEntity(road: "B 55", city: "London", country: "UK"));

  setUp(() {
    getPractitionerInfoUseCase = MockGetPractitionerInfoUseCase();
  });

  testWidgets('shoud contain practitioner info', (tester) async {
    // arrange
    when(getPractitionerInfoUseCase.execute(any))
        .thenAnswer((_) => Future.value(const Right(practitioner)));
    await tester.pumpWidget(ProviderScope(
        overrides: [
          getPractitionerInfoUseCaseProvider
              .overrideWithValue(getPractitionerInfoUseCase)
        ],
        child: const MaterialApp(
            home: Material(
                child: Scaffold(
                    body: PractitionerProfile(practitionerId: "1"))))));

    // act
    await tester.pumpAndSettle();

    // assert
    verify(getPractitionerInfoUseCase.execute(any)).called(1);
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
