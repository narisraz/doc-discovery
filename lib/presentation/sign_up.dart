import 'package:docdiscovery/presentation/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUp extends ConsumerWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();

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
            ),
            TextFormField(
              key: const Key("password"),
              decoration: const InputDecoration(hintText: "Mot de passe"),
              obscureText: true,
            ),
            TextFormField(
              key: const Key("confirm-password"),
              decoration:
                  const InputDecoration(hintText: "Confirmer mot de passe"),
              obscureText: true,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FilledButton(
                    key: const Key("signup"),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => const Home()),
                      );
                    },
                    child: const Text("Créer compte"),
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
