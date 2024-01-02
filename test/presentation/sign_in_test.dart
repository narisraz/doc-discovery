import 'package:docdiscovery/presentation/home.dart';
import 'package:docdiscovery/presentation/sign_in.dart';
import 'package:docdiscovery/presentation/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('should redirect to home', (tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: SignInPage(),
    ));

    await tester.enterText(find.byKey(const Key("email")), "mail@mail.com");
    await tester.enterText(find.byKey(const Key("password")), "password");

    await tester.tap(find.byKey(const Key("signin-button")));
    await tester.pumpAndSettle();

    expect(find.byType(Home), findsOneWidget);
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
