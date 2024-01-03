import 'package:docdiscovery/core/providers.dart';
import 'package:docdiscovery/presentation/home.dart';
import 'package:docdiscovery/presentation/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

class SignInPage extends ConsumerWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formKey,
          child: Column(children: [
            TextFormField(
              key: const Key("email"),
              decoration: const InputDecoration(hintText: "Email"),
              enableSuggestions: true,
              keyboardType: TextInputType.emailAddress,
              controller: emailController,
            ),
            TextFormField(
              key: const Key("password"),
              decoration: const InputDecoration(hintText: "Mot de passe"),
              obscureText: true,
              controller: passwordController,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton(
                    key: const Key("signup"),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => const SignUp()),
                      );
                    },
                    child: const Text("Créer compte"),
                  ),
                  const Gap(8),
                  FilledButton(
                    key: const Key("signin-button"),
                    onPressed: () {
                      ref
                          .read(signInUserUseCaseProvider)
                          .execute(
                              emailController.text, passwordController.text)
                          .then((value) => Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => const Home()),
                              ));
                    },
                    child: const Text("Se connecter"),
                  ),
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
