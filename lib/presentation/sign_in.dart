import 'package:docdiscovery/core/utils.dart';
import 'package:docdiscovery/presentation/components/signin/sign_in_button.dart';
import 'package:docdiscovery/presentation/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignInPage extends ConsumerWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          centerTitle: true,
          title: Text(
            "Connexion",
            style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
          ),
        ),
        body: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
          ),
          height: double.infinity,
          child: Center(
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Wrap(
                  children: [
                    const Center(child: Icon(Icons.lock_outline, size: 90)),
                    Form(
                      key: formKey,
                      child: Column(children: [
                        TextFormField(
                          key: const Key("email"),
                          decoration: const InputDecoration(hintText: "Email"),
                          enableSuggestions: true,
                          keyboardType: TextInputType.emailAddress,
                          controller: emailController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Champ obligatoire';
                            }
                            if (!MailUtil().isValid(value)) {
                              return 'Email invalide';
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          key: const Key("password"),
                          decoration:
                              const InputDecoration(hintText: "Mot de passe"),
                          obscureText: true,
                          controller: passwordController,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: SizedBox(
                            width: double.infinity,
                            child: SignInButton(
                              emailController: emailController,
                              passwordController: passwordController,
                              formKey: formKey,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Pas encore de compte ?"),
                            TextButton(
                              key: const Key('signup'),
                              onPressed: (() =>
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => const SignUp(),
                                  ))),
                              child: const Text("Créer un compte"),
                            )
                          ],
                        )
                      ]),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
