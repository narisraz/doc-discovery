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
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
            future: futurPractioner,
            builder: ((context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return snapshot.data!.fold(
                    (_) => const Text("No data"),
                    ((practitioner) => Stack(
                          fit: StackFit.loose,
                          children: [
                            Positioned(
                              top: 0,
                              child: SizedBox(
                                height: 500,
                                width: MediaQuery.of(context).size.width,
                                child: Image.network(
                                  "https://img.freepik.com/free-photo/woman-doctor-wearing-lab-coat-with-stethoscope-isolated_1303-29791.jpg",
                                  fit: BoxFit.fitHeight,
                                ),
                              ),
                            ),
                            Positioned(
                              top: 0,
                              child: IconButton(
                                onPressed: () => Navigator.pop(context),
                                icon: const Icon(Icons.arrow_back),
                              ),
                            ),
                            Positioned(
                              top: 475,
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).colorScheme.surface,
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(24),
                                      topRight: Radius.circular(24)),
                                ),
                                padding: const EdgeInsets.all(16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Center(
                                      child: Text(
                                          "${practitioner.givenName} ${practitioner.familyName}",
                                          style: const TextStyle(
                                              fontSize: 28,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                    ListTile(
                                      leading: const Icon(Icons.phone),
                                      title: const Text("Téléphone"),
                                      subtitle: Text(practitioner.tel),
                                    ),
                                    ListTile(
                                      leading: const Icon(Icons.mail),
                                      title: const Text("Adresse mail"),
                                      subtitle: Text(practitioner.email ?? ""),
                                    ),
                                    ListTile(
                                      leading:
                                          const Icon(Icons.medical_information),
                                      title: const Text("ONM"),
                                      subtitle: Text(practitioner.onm ?? ""),
                                    ),
                                    ListTile(
                                      leading: const Icon(Icons.location_on),
                                      title: RichText(
                                          text: TextSpan(children: [
                                        TextSpan(
                                          text: practitioner.address.road,
                                        ),
                                        const TextSpan(text: " - "),
                                        TextSpan(
                                          text: practitioner.address.city,
                                        ),
                                        const TextSpan(text: " - "),
                                        TextSpan(
                                          text: practitioner.address.city,
                                        )
                                      ])),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )));
              }
              return const Center(child: CircularProgressIndicator());
            })),
      ),
    );
  }
}
