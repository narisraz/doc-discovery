import 'package:docdiscovery/core/providers.dart';
import 'package:docdiscovery/domain/entities/practitioner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchPractitioner extends ConsumerStatefulWidget {
  const SearchPractitioner({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return SearchPractitionerState();
  }
}

class SearchPractitionerState extends ConsumerState<SearchPractitioner> {
  Future<List<PractitionerEntity>> results = Future.value([]);

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();

    search() {
      setState(() {
        results = ref
            .read(searchPractitionerUseCaseProvider)
            .execute(searchController.text);
      });
    }

    return SingleChildScrollView(
      child: Column(children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: TextFormField(
                  controller: searchController,
                  key: const Key('search-input'),
                  decoration: const InputDecoration(
                    hintText: 'Rechercher',
                  )),
            ),
            ElevatedButton(
              onPressed: search,
              key: const Key('search-button'),
              child: const Text('Rechercher'),
            )
          ],
        ),
        FutureBuilder(
          future: results,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              final List<PractitionerEntity> practitioners = snapshot.data!;
              return SingleChildScrollView(
                child: Column(
                  children: practitioners
                      .map((e) => Column(
                            children: [
                              Text("${e.givenName} ${e.familyName}"),
                              Text("${e.address.city} - ${e.address.country}"),
                            ],
                          ))
                      .toList(),
                ),
              );
            }
            return const CircularProgressIndicator();
          },
        )
      ]),
    );
  }
}
