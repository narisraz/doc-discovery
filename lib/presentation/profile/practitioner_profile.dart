import 'package:docdiscovery/core/providers.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PractitionerProfile extends ConsumerStatefulWidget {
  final String practitionerId;

  const PractitionerProfile({super.key, required this.practitionerId});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return PractitionerProfileState();
  }
}

class PractitionerProfileState extends ConsumerState<PractitionerProfile> {
  late String profilePicture = "";

  @override
  void initState() {
    super.initState();
    ref
        .read(getPractitionerProfileUseCaseProvider)
        .execute(widget.practitionerId)
        .then((result) {
      profilePicture = result.getOrElse(() => "");
    });
  }

  @override
  Widget build(BuildContext context) {
    final futurePractitioner = ref
        .read(getPractitionerInfoUseCaseProvider)
        .execute(widget.practitionerId);
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
            future: futurePractitioner,
            builder: ((context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return snapshot.data!.fold(
                    (_) => const Text("No data"),
                    ((practitioner) => SingleChildScrollView(
                          child: Stack(
                            children: [
                              Positioned(
                                  top: 0,
                                  child: SizedBox(
                                    height: 500,
                                    width: MediaQuery.of(context).size.width,
                                    child: profilePicture.isNotEmpty
                                        ? Image.network(profilePicture)
                                        : Image.asset(
                                            "assets/images/default-profile.jpg"),
                                  )),
                              Positioned(
                                key: const Key('upload-profile'),
                                top: 0,
                                right: 0,
                                child: IconButton(
                                  onPressed: () async {
                                    final result =
                                        await FilePicker.platform.pickFiles();
                                    if (result != null) {
                                      final profile = result.files.first.bytes!;
                                      ref
                                          .read(
                                              uploadPractitionerProfileUseCaseProvider)
                                          .execute(practitioner.id!, profile)
                                          .then((value) => setState(() {
                                                profilePicture =
                                                    value.getOrElse(() => "");
                                              }));
                                    }
                                  },
                                  icon: const Icon(Icons.photo_camera),
                                ),
                              ),
                              Positioned(
                                top: 0,
                                child: IconButton(
                                  onPressed: () => Navigator.pop(context),
                                  icon: const Icon(Icons.arrow_back),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 475),
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).colorScheme.surface,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.shade600,
                                        blurRadius: 10,
                                        spreadRadius: 1),
                                  ],
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(24),
                                      topRight: Radius.circular(24)),
                                ),
                                padding: const EdgeInsets.all(16),
                                child: Column(
                                  children: [
                                    Center(
                                      child: Text(
                                          "${practitioner.givenName} ${practitioner.familyName}",
                                          style: const TextStyle(
                                              fontSize: 28,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                    Column(
                                      children: [
                                        ListTile(
                                          leading: const Icon(Icons.phone),
                                          title: const Text("Téléphone"),
                                          subtitle: Text(practitioner.tel),
                                        ),
                                        ListTile(
                                          leading: const Icon(Icons.mail),
                                          title: const Text("Adresse mail"),
                                          subtitle:
                                              Text(practitioner.email ?? ""),
                                        ),
                                        ListTile(
                                          leading: const Icon(
                                              Icons.medical_information),
                                          title: const Text("ONM"),
                                          subtitle:
                                              Text(practitioner.onm ?? ""),
                                        ),
                                        ListTile(
                                          leading:
                                              const Icon(Icons.location_on),
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
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )));
              }
              return const Center(child: CircularProgressIndicator());
            })),
      ),
    );
  }
}
