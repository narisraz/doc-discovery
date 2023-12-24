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
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.network(
          "https://img.freepik.com/free-photo/woman-doctor-wearing-lab-coat-with-stethoscope-isolated_1303-29791.jpg",
          fit: BoxFit.fitHeight,
        ),
      ),
      title: Text(
          "${practitionerEntity.givenName} ${practitionerEntity.familyName}"),
      subtitle: Text(
          "${practitionerEntity.address.city} - ${practitionerEntity.address.country}"),
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) =>
              PractitionerProfile(practitionerId: practitionerEntity.id!))),
    );
  }
}
