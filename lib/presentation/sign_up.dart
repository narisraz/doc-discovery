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

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Création de compte"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: formKey,
            child: Column(children: [
              SvgPicture.string(picture),
              IconButton(
                onPressed: () {
                  setState(() {
                    picture =
                        RandomAvatarString(DateTime.now().toIso8601String());
                  });
                },
                icon: const Icon(Icons.refresh),
              ),
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
      ),
    );
  }
}
