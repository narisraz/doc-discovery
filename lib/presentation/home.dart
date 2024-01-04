import 'package:docdiscovery/core/providers.dart';
import 'package:docdiscovery/presentation/search/search_practitioner.dart';
import 'package:docdiscovery/presentation/sign_in.dart';
import 'package:docdiscovery/presentation/signup/practitioner_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  @override
  Widget build(BuildContext context) {
    final auth = ref.read(getConnectedUserUseCaseProvider).execute();
    return Scaffold(
        body: const SearchPractitioner(),
        appBar: AppBar(
          title: const Text("DocDiscovery"),
          actions: [
            FutureBuilder(
              future: auth,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data!.isRight()) {
                    return FilledButton(
                      key: const Key("signup-practitioner-button"),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const PractitionerForm(),
                          ),
                        );
                      },
                      child: const Text("Passer PRO"),
                    );
                  }
                }
                return const SizedBox.shrink();
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: IconButton.outlined(
                key: const Key("signin-button"),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const SignInPage(),
                    ),
                  );
                },
                icon: const Icon(Icons.person),
              ),
            ),
          ],
        ));
  }
}
