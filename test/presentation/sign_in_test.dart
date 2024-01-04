import 'package:dartz/dartz.dart';
import 'package:docdiscovery/core/providers.dart';
import 'package:docdiscovery/domain/entities/user.dart';
import 'package:docdiscovery/presentation/sign_in.dart';
import 'package:docdiscovery/presentation/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../helpers/test_helper.mocks.dart';

void main() {
  late MockSignInUserUseCase signInUserUseCase;

  setUp(() {
    signInUserUseCase = MockSignInUserUseCase();
  });

  testWidgets('should sign in', (tester) async {
    when(signInUserUseCase.execute("mail@mail.com", "password")).thenAnswer(
        (_) => Future.value(const Right(UserEntity(
            picture: "picture",
            givenName: "givenName",
            familyName: "familyName",
            email: "mail@mail.com"))));
    await tester.pumpWidget(ProviderScope(
      overrides: [
        signInUserUseCaseProvider.overrideWithValue(signInUserUseCase)
      ],
      child: const MaterialApp(
        home: SignInPage(),
      ),
    ));

    await tester.enterText(find.byKey(const Key("email")), "mail@mail.com");
    await tester.enterText(find.byKey(const Key("password")), "password");

    await tester.tap(find.byKey(const Key("signin-button")));

    await tester.pump();

    verify(signInUserUseCase.execute(
            argThat(equals("mail@mail.com")), argThat(equals("password"))))
        .called(1);
  });

  testWidgets('should go to signup page', (tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: SignInPage(),
    ));

    await tester.tap(find.byKey(const Key("signup")));
    await tester.pumpAndSettle();

    expect(find.byType(SignUp), findsOneWidget);
  });
}
