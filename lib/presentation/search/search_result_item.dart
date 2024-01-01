import 'package:docdiscovery/domain/entities/practitioner.dart';
import 'package:docdiscovery/presentation/profile/practitioner_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchResultItem extends ConsumerWidget {
  final PractitionerEntity practitionerEntity;

  const SearchResultItem({
    super.key,
    required this.practitionerEntity,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      key: const Key('content'),
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Hero(
          tag: 'profile-picture',
          child: practitionerEntity.profilePicture != null
              ? Image.network(practitionerEntity.profilePicture!)
              : Image.asset("assets/images/default-profile.jpg"),
        ),
      ),
      title: Text(
          "${practitionerEntity.givenName} ${practitionerEntity.familyName}"),
      subtitle: Text(
          "${practitionerEntity.address.city} - ${practitionerEntity.address.country}"),
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) =>
              PractitionerProfile(practitioner: practitionerEntity))),
    );
  }
}
