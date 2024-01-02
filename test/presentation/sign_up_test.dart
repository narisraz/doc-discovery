import 'package:docdiscovery/presentation/home.dart';
import 'package:docdiscovery/presentation/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('should save credentials to firebase auth', (tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: SignUp(),
    ));

    await tester.enterText(find.byKey(const Key("email")), "mail@mail.com");
    await tester.enterText(find.byKey(const Key("password")), "password");
    await tester.enterText(
        find.byKey(const Key("confirm-password")), "password");

    await tester.tap(find.byKey(const Key("signup")));
    await tester.pumpAndSettle();

    expect(find.byType(Home), findsOneWidget);
  });
}
