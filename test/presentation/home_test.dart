import 'package:dartz/dartz.dart';
import 'package:docdiscovery/core/error/failure.dart';
import 'package:docdiscovery/core/providers.dart';
import 'package:docdiscovery/domain/entities/user.dart';
import 'package:docdiscovery/presentation/home.dart';
import 'package:docdiscovery/presentation/sign_in.dart';
import 'package:docdiscovery/presentation/signup/practitioner_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../helpers/test_helper.mocks.dart';

void main() {
  late MockGetConnectedUserUseCase getConnectedUseCase;

  setUp(() {
    getConnectedUseCase = MockGetConnectedUserUseCase();
  });

  testWidgets('should go to pro signup page', (tester) async {
    // arrange
    when(getConnectedUseCase.execute()).thenAnswer((_) => Stream.value(
          const Right(UserEntity(
            email: "mail@mail.com",
            authId: "uid",
            givenName: "John",
            familyName: "Smith",
            picture: "svg",
          )),
        ));
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          getConnectedUserUseCaseProvider.overrideWithValue(getConnectedUseCase)
        ],
        child: const MaterialApp(
          home: Material(
            child: Scaffold(body: Home()),
          ),
        ),
      ),
    );

    // act
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key("signup-practitioner-button")));
    await tester.pumpAndSettle();

    // assert
    expect(find.byType(PractitionerForm), findsOneWidget);
  });

  testWidgets('should go to signin page', (tester) async {
    // arrange
    when(getConnectedUseCase.execute()).thenAnswer((_) => Stream.value(
          const Left(NoUserConnectedFailure()),
        ));
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          getConnectedUserUseCaseProvider.overrideWithValue(getConnectedUseCase)
        ],
        child: const MaterialApp(
          home: Material(
            child: Scaffold(body: Home()),
          ),
        ),
      ),
    );

    // act
    await tester.tap(find.byKey(const Key("signin-button")));
    await tester.pumpAndSettle();

    // assert
    expect(find.byType(SignInPage), findsOneWidget);
  });

  testWidgets('should display pro button only if connected', (tester) async {
    // arrange
    when(getConnectedUseCase.execute()).thenAnswer((_) => Stream.value(
          const Left(NoUserConnectedFailure()),
        ));
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          getConnectedUserUseCaseProvider.overrideWithValue(getConnectedUseCase)
        ],
        child: const MaterialApp(
          home: Material(
            child: Scaffold(body: Home()),
          ),
        ),
      ),
    );

    // assert
    expect(find.byKey(const Key("signup-practitioner-button")), findsNothing);
  });
}
