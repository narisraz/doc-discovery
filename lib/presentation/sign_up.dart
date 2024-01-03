import 'package:docdiscovery/core/providers.dart';
import 'package:docdiscovery/domain/usecases/sign_up_user_use_case.dart';
import 'package:docdiscovery/presentation/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:random_avatar/random_avatar.dart';

class SignUp extends ConsumerStatefulWidget {
  const SignUp({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return SignUpState();
  }
}

class SignUpState extends ConsumerState<SignUp> {
  String picture = RandomAvatarString(DateTime.now().toIso8601String());
  final familyNameController = TextEditingController();
  final givenNameController = TextEditingController();
  final emaiController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
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
            "Création de compte",
            style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
          ),
          backgroundColor: Theme.of(context).colorScheme.primary,
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
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Wrap(
                    children: [
                      Form(
                        key: formKey,
                        child: Column(children: [
                          SvgPicture.string(picture),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                picture = RandomAvatarString(
                                    DateTime.now().toIso8601String());
                              });
                            },
                            icon: const Icon(Icons.refresh),
                          ),
                          TextFormField(
                            key: const Key("family-name"),
                            decoration: const InputDecoration(hintText: "Nom"),
                            enableSuggestions: true,
                            keyboardType: TextInputType.emailAddress,
                            controller: familyNameController,
                          ),
                          TextFormField(
                            key: const Key("given-name"),
                            decoration:
                                const InputDecoration(hintText: "Prénom"),
                            enableSuggestions: true,
                            keyboardType: TextInputType.emailAddress,
                            controller: givenNameController,
                          ),
                          TextFormField(
                            key: const Key("email"),
                            decoration:
                                const InputDecoration(hintText: "Email"),
                            enableSuggestions: true,
                            keyboardType: TextInputType.emailAddress,
                            controller: emaiController,
                          ),
                          TextFormField(
                            key: const Key("password"),
                            decoration:
                                const InputDecoration(hintText: "Mot de passe"),
                            obscureText: true,
                            controller: passwordController,
                          ),
                          TextFormField(
                            key: const Key("confirm-password"),
                            decoration: const InputDecoration(
                                hintText: "Confirmer mot de passe"),
                            obscureText: true,
                            controller: confirmPasswordController,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FilledButton(
                                  key: const Key("signup"),
                                  onPressed: () {
                                    ref
                                        .read(signUpUserUseCaseProvider)
                                        .execute(
                                          SignUpUserRequest(
                                              email: emaiController.text,
                                              password: passwordController.text,
                                              familyName:
                                                  familyNameController.text,
                                              givenName:
                                                  givenNameController.text,
                                              picture: picture),
                                        )
                                        .then((value) =>
                                            Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const Home()),
                                            ));
                                  },
                                  child: const Text("Créer compte"),
                                ),
                              ],
                            ),
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
      ),
    );
  }
}
