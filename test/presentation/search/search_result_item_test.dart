import 'package:dartz/dartz.dart';
import 'package:docdiscovery/core/providers.dart';
import 'package:docdiscovery/domain/entities/address.dart';
import 'package:docdiscovery/domain/entities/practitioner.dart';
import 'package:docdiscovery/presentation/profile/practitioner_profile.dart';
import 'package:docdiscovery/presentation/search/search_result_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockGetPractitionerInfoUseCase getPractitionerInfoUseCase;
  late MockNavigatorObserver navigatorObserver;
  const practitioner = PractitionerEntity(
      authId: "authId",
      id: 'id',
      familyName: "Smith",
      givenName: "John",
      onm: 'onm',
      tel: '555-555-5555',
      email: 'U1TbJ@example.com',
      address: AddressEntity(road: "B 55", city: "London", country: "UK"));

  setUp(() {
    navigatorObserver = MockNavigatorObserver();
    getPractitionerInfoUseCase = MockGetPractitionerInfoUseCase();
  });

  testWidgets('should display search result item', (tester) async {
    // arrange
    await tester.pumpWidget(const ProviderScope(
        child: MaterialApp(
            home: Material(
                child: Scaffold(
                    body:
                        SearchResultItem(practitionerEntity: practitioner))))));

    // assert
    expect(find.text("John Smith"), findsOneWidget);
    expect(find.text("London - UK"), findsOneWidget);
  });

  testWidgets('should navigate to practitioner profile on tap', (tester) async {
    // arrange
    when(getPractitionerInfoUseCase.execute(any))
        .thenAnswer((_) => Future.value(const Right(practitioner)));
    await tester.pumpWidget(ProviderScope(
        overrides: [
          getPractitionerInfoUseCaseProvider
              .overrideWithValue(getPractitionerInfoUseCase)
        ],
        child: MaterialApp(
            navigatorObservers: [navigatorObserver],
            home: const Material(
                child: Scaffold(
                    body:
                        SearchResultItem(practitionerEntity: practitioner))))));

    // act
    await tester.tap(find.byKey(const Key("content")));
    await tester.pumpAndSettle();

    // assert
    verify(navigatorObserver.didPush(any, any));
    expect(find.byType(PractitionerProfile), findsOneWidget);
  });
}
