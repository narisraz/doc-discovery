import 'package:docdiscovery/core/providers.dart';
import 'package:docdiscovery/domain/entities/practitioner.dart';
import 'package:docdiscovery/presentation/search/search_result_item.dart';
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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: "Trouver",
              style: const TextStyle(fontSize: 20),
              children: [
                TextSpan(
                  text: " un professionnel de sante",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                const TextSpan(
                  text: " en toute simplicité",
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: TextFormField(
                  controller: searchController,
                  onEditingComplete: search,
                  key: const Key('search-input'),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8)),
                    hintText: 'Rechercher un nom, lieu, tel,...',
                    suffixIcon: IconButton(
                      key: const Key('search-button'),
                      onPressed: search,
                      icon: const Icon(
                        Icons.search,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: FutureBuilder(
            future: results,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                final List<PractitionerEntity> practitioners = snapshot.data!;
                return SingleChildScrollView(
                  child: Column(
                    children: practitioners
                        .map((e) => SearchResultItem(practitionerEntity: e))
                        .toList(),
                  ),
                );
              }
              return const CircularProgressIndicator();
            },
          ),
        )
      ]),
    );
  }
}
