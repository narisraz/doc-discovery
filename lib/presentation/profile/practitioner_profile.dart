import 'package:docdiscovery/core/providers.dart';
import 'package:docdiscovery/domain/entities/practitioner.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PractitionerProfile extends ConsumerStatefulWidget {
  final PractitionerEntity practitioner;
  final Function(String) onUpdateProfilePicture;

  const PractitionerProfile(
      {super.key,
      required this.practitioner,
      required this.onUpdateProfilePicture});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return PractitionerProfileState();
  }
}

class PractitionerProfileState extends ConsumerState<PractitionerProfile> {
  late String profilePicture = "";
  late bool isUploadingPictureProfile = false;

  @override
  void initState() {
    super.initState();
    profilePicture = widget.practitioner.profilePicture ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              toolbarHeight: 50,
              leading: IconButton.outlined(
                color: Theme.of(context).colorScheme.primary,
                icon: const Icon(Icons.arrow_back),
                onPressed: () => Navigator.of(context).pop(),
              ),
              actions: [
                IconButton.outlined(
                  color: Theme.of(context).colorScheme.primary,
                  onPressed: () async {
                    final result = await FilePicker.platform.pickFiles();
                    if (result != null) {
                      setState(() {
                        isUploadingPictureProfile = true;
                      });
                      final profile = result.files.first.bytes!;
                      ref
                          .read(uploadPractitionerProfileUseCaseProvider)
                          .execute(widget.practitioner.id!, profile)
                          .then((value) => setState(() {
                                profilePicture = value.getOrElse(() => "");
                                widget.onUpdateProfilePicture(profilePicture);
                              }))
                          .whenComplete(() => setState(() {
                                isUploadingPictureProfile = false;
                              }));
                    }
                  },
                  icon: const Icon(
                    Icons.photo_camera,
                  ),
                ),
              ],
              flexibleSpace: FlexibleSpaceBar(
                background: Hero(
                  tag: 'profile-picture-${widget.practitioner.id}',
                  child: isUploadingPictureProfile
                      ? const Center(child: CircularProgressIndicator())
                      : profilePicture.isNotEmpty
                          ? Image.network(
                              profilePicture,
                              fit: BoxFit.cover,
                            )
                          : Image.asset("assets/images/default-profile.jpg"),
                ),
                centerTitle: true,
                titlePadding: EdgeInsets.zero,
                title: Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color:
                        Theme.of(context).colorScheme.primary.withOpacity(0.5),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${widget.practitioner.givenName} ${widget.practitioner.familyName}",
                      )
                    ],
                  ),
                ),
              ),
              pinned: true,
              expandedHeight: 400,
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  ListTile(
                    leading: const Icon(Icons.phone),
                    title: const Text("Téléphone"),
                    subtitle: Text(widget.practitioner.tel),
                  ),
                  ListTile(
                    leading: const Icon(Icons.mail),
                    title: const Text("Adresse mail"),
                    subtitle: Text(widget.practitioner.email ?? ""),
                  ),
                  ListTile(
                    leading: const Icon(Icons.medical_information),
                    title: const Text("ONM"),
                    subtitle: Text(widget.practitioner.onm ?? ""),
                  ),
                  ListTile(
                    leading: const Icon(Icons.location_on),
                    title: const Text("Adresse"),
                    subtitle: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: widget.practitioner.address.road,
                          ),
                          const TextSpan(text: " - "),
                          TextSpan(
                            text: widget.practitioner.address.city,
                          ),
                          const TextSpan(text: " - "),
                          TextSpan(
                            text: widget.practitioner.address.city,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
