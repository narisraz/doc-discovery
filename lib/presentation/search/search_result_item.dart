import 'package:docdiscovery/domain/entities/practitioner.dart';
import 'package:docdiscovery/presentation/profile/practitioner_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchResultItem extends ConsumerStatefulWidget {
  final PractitionerEntity practitionerEntity;

  const SearchResultItem({
    super.key,
    required this.practitionerEntity,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return SearchResultItemState();
  }
}

class SearchResultItemState extends ConsumerState<SearchResultItem> {
  late String profilePicture = "assets/images/default-profile.jpg";
  late PractitionerEntity newPractitionerEntity;

  @override
  void initState() {
    super.initState();
    newPractitionerEntity = widget.practitionerEntity;
    if (widget.practitionerEntity.profilePicture != null) {
      profilePicture = widget.practitionerEntity.profilePicture!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      key: const Key('content'),
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Hero(
          tag: 'profile-picture',
          child: profilePicture.startsWith("assets")
              ? Image.asset(profilePicture)
              : Image.network(profilePicture),
        ),
      ),
      title: Text(
          "${widget.practitionerEntity.givenName} ${widget.practitionerEntity.familyName}"),
      subtitle: Text(
          "${widget.practitionerEntity.address.city} - ${widget.practitionerEntity.address.country}"),
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => PractitionerProfile(
              practitioner: newPractitionerEntity,
              onUpdateProfilePicture: (picture) {
                setState(() {
                  profilePicture = picture;
                  newPractitionerEntity =
                      newPractitionerEntity.copyWith(profilePicture: picture);
                });
              }))),
    );
  }
}
