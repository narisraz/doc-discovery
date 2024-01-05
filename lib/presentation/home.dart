import 'package:docdiscovery/core/providers.dart';
import 'package:docdiscovery/presentation/search/search_practitioner.dart';
import 'package:docdiscovery/presentation/sign_in.dart';
import 'package:docdiscovery/presentation/signup/practitioner_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.read(getConnectedUserUseCaseProvider).execute();
    return Scaffold(
        body: const SearchPractitioner(),
        appBar: AppBar(
          title: const Text("DocDiscovery"),
          actions: [
            StreamBuilder(
              stream: auth,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return snapshot.data!.fold(
                    (_) => const SizedBox.shrink(),
                    (userEntity) => Authenticated(authId: userEntity.authId!),
                  );
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

class Authenticated extends ConsumerWidget {
  final String authId;

  const Authenticated({super.key, required this.authId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final practitionerFuture =
        ref.read(getPractitionerByAuthIdUseCaseProvider).execute(authId);
    return FutureBuilder(
        future: practitionerFuture,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return snapshot.data!.fold(
              (_) => buidlProButton(context),
              (_) => const SizedBox.shrink(),
            );
          }
          return const SizedBox.shrink();
        });
  }

  Widget buidlProButton(BuildContext context) {
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
