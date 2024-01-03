import 'package:docdiscovery/core/providers.dart';
import 'package:docdiscovery/domain/usecases/sign_up_user_use_case.dart';
import 'package:docdiscovery/presentation/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../helpers/test_helper.mocks.dart';

void main() {
  late MockSignUpUserUseCase signUpUserUseCase;

  setUp(() {
    signUpUserUseCase = MockSignUpUserUseCase();
  });

  testWidgets('should save credentials', (tester) async {
    await tester.pumpWidget(ProviderScope(
      overrides: [
        signUpUserUseCaseProvider.overrideWithValue(signUpUserUseCase)
      ],
      child: const MaterialApp(
        home: SignUp(),
      ),
    ));

    await tester.enterText(find.byKey(const Key("email")), "mail@mail.com");
    await tester.enterText(find.byKey(const Key("password")), "password");
    await tester.enterText(
        find.byKey(const Key("confirm-password")), "password");

    await tester.tap(find.byKey(const Key("signup")));
    await tester.pumpAndSettle();

    verify(signUpUserUseCase.execute(argThat(isA<SignUpUserRequest>())))
        .called(1);
  });
}
