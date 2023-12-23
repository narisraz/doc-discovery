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
    return InkWell(
      key: const Key('content'),
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) =>
              PractitionerProfile(practitionerId: practitionerEntity.id!))),
      child: Column(
        children: [
          Text(
              "${practitionerEntity.givenName} ${practitionerEntity.familyName}"),
          Text(
              "${practitionerEntity.address.city} - ${practitionerEntity.address.country}"),
        ],
      ),
    );
  }
}
