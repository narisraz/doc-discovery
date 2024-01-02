import 'package:docdiscovery/presentation/home.dart';
import 'package:docdiscovery/presentation/sign_in.dart';
import 'package:docdiscovery/presentation/signup/practitioner_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('should go to signup page', (tester) async {
    // arrange
    await tester.pumpWidget(
      const MaterialApp(
        home: Material(
          child: Scaffold(body: Home()),
        ),
      ),
    );

    // act
    await tester.tap(find.byKey(const Key("signup-practitioner-button")));
    await tester.pumpAndSettle();

    // assert
    expect(find.byType(PractitionerForm), findsOneWidget);
  });

  testWidgets('should go to signin page', (tester) async {
    // arrange
    await tester.pumpWidget(
      const MaterialApp(
        home: Material(
          child: Scaffold(body: Home()),
        ),
      ),
    );

    // act
    await tester.tap(find.byKey(const Key("signin-button")));
    await tester.pumpAndSettle();

    // assert
    expect(find.byType(SignInPage), findsOneWidget);
  });
}
