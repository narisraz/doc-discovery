import 'package:docdiscovery/presentation/search/search_practitioner.dart';
import 'package:docdiscovery/presentation/signup/practitioner_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        body: const SearchPractitioner(),
        appBar: AppBar(
          title: const Text("DocDiscovery"),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: FilledButton(
                key: const Key("signup-practitioner-button"),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const PractitionerForm(),
                    ),
                  );
                },
                child: const Text("Passer PRO"),
              ),
            )
          ],
        ));
  }
}
