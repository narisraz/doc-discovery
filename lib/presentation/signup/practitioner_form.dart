import 'package:docdiscovery/core/providers.dart';
import 'package:docdiscovery/domain/entities/address.dart';
import 'package:docdiscovery/domain/entities/practitioner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PractitionerForm extends ConsumerWidget {
  const PractitionerForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final familyNameController = TextEditingController();
    final givenNameController = TextEditingController();
    final onmController = TextEditingController();
    final telController = TextEditingController();
    final emailController = TextEditingController();
    final roadController = TextEditingController();
    final cityController = TextEditingController();
    final countryController = TextEditingController();

    final globalKey = GlobalKey<FormState>();

    onSave() {
      if (globalKey.currentState!.validate()) {
        ref
            .read(savePractitionerUseCaseProvider)
            .execute(PractitionerEntity(
                familyName: familyNameController.value.text,
                givenName: givenNameController.value.text,
                onm: onmController.value.text,
                tel: telController.value.text,
                email: emailController.value.text,
                address: AddressEntity(
                  road: roadController.value.text,
                  city: cityController.value.text,
                  country: countryController.value.text,
                )))
            .then((value) {
          if (value.isRight()) {
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text("Saved")));
          } else {
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text("Invalide")));
          }
        });
      }
    }

    return Form(
      key: globalKey,
      child: Column(
        children: [
          TextFormField(
            controller: familyNameController,
            key: const Key('family_name'),
            decoration: const InputDecoration(hintText: 'Nom'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Champ obligatoire';
              }
              return null;
            },
          ),
          TextFormField(
            key: const Key('given_name'),
            controller: givenNameController,
            decoration: const InputDecoration(hintText: 'Prénom'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Champ obligatoire';
              }
              return null;
            },
          ),
          TextFormField(
            key: const Key('onm'),
            controller: onmController,
            decoration: const InputDecoration(hintText: 'ONM'),
          ),
          TextFormField(
            key: const Key('tel'),
            controller: telController,
            decoration: const InputDecoration(hintText: 'Téléphone'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Champ obligatoire';
              }
              return null;
            },
          ),
          TextFormField(
            key: const Key('email'),
            controller: emailController,
            decoration: const InputDecoration(hintText: 'Adresse mail'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Champ obligatoire';
              }
              return null;
            },
          ),
          TextFormField(
            key: const Key('road'),
            controller: roadController,
            decoration: const InputDecoration(hintText: 'Adresse'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Champ obligatoire';
              }
              return null;
            },
          ),
          TextFormField(
            key: const Key('city'),
            controller: cityController,
            decoration: const InputDecoration(hintText: 'District'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Champ obligatoire';
              }
              return null;
            },
          ),
          TextFormField(
            key: const Key('country'),
            controller: countryController,
            decoration: const InputDecoration(hintText: 'Région'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Champ obligatoire';
              }
              return null;
            },
          ),
          ElevatedButton(
            onPressed: () {
              onSave();
            },
            key: const Key('submit_button'),
            child: const Text('Enregistrer'),
          )
        ],
      ),
    );
  }
}
