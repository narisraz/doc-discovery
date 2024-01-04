import 'package:docdiscovery/core/providers.dart';
import 'package:docdiscovery/domain/entities/address.dart';
import 'package:docdiscovery/domain/entities/practitioner.dart';
import 'package:docdiscovery/presentation/search/search_practitioner.dart';
import 'package:docdiscovery/presentation/search/search_result_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockSearchPractitionerUseCase mockSearchPractitionerUseCase;
  const practitioner = PractitionerEntity(
      authId: "authId",
      familyName: "Smith",
      givenName: "John",
      onm: 'onm',
      tel: '555-555-5555',
      email: 'U1TbJ@example.com',
      address: AddressEntity(road: "B 55", city: "London", country: "UK"));

  setUp(() {
    mockSearchPractitionerUseCase = MockSearchPractitionerUseCase();
  });

  testWidgets('should display search results', (tester) async {
    // arrange
    when(mockSearchPractitionerUseCase.execute(any))
        .thenAnswer((_) => Future.value([practitioner]));
    await tester.pumpWidget(ProviderScope(
        overrides: [
          searchPractitionerUseCaseProvider
              .overrideWithValue(mockSearchPractitionerUseCase)
        ],
        child: const MaterialApp(
            home: Material(child: Scaffold(body: SearchPractitioner())))));

    // act
    await tester.enterText(find.byKey(const Key("search-input")), "John");
    await tester.tap(find.byKey(const Key("search-button")));
    await tester.pumpAndSettle();

    // assert
    verify(mockSearchPractitionerUseCase.execute(any)).called(1);
    expect(find.byType(SearchResultItem), findsOneWidget);
  });
}
