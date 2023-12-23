import 'package:docdiscovery/core/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PractitionerProfile extends ConsumerWidget {
  final String practitionerId;

  const PractitionerProfile({super.key, required this.practitionerId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final futurPractioner =
        ref.read(getPractitionerInfoUseCaseProvider).execute(practitionerId);
    return FutureBuilder(
        future: futurPractioner,
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return snapshot.data!.fold(
                (_) => const Text("No data"),
                ((practitioner) => ListView(
                      children: [
                        Text(
                            "${practitioner.givenName} ${practitioner.familyName}"),
                        Text(practitioner.tel),
                        Text(practitioner.email ?? ""),
                        Text(practitioner.onm ?? ""),
                        Text(practitioner.address.road ?? ""),
                        Text(practitioner.address.city ?? ""),
                        Text(practitioner.address.country ?? ""),
                      ],
                    )));
          }
          return const CircularProgressIndicator();
        }));
  }
}
