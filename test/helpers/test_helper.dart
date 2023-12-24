import 'package:algolia/algolia.dart';
import 'package:docdiscovery/domain/repositories/practitioner_repository.dart';
import 'package:docdiscovery/domain/usecases/get_practitioner_info_use_case.dart';
import 'package:docdiscovery/domain/usecases/get_practitioner_profile_use_case.dart';
import 'package:docdiscovery/domain/usecases/save_practitioner_use_case.dart';
import 'package:docdiscovery/domain/usecases/search_practitioner_use_case.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:mockito/annotations.dart';

@GenerateNiceMocks([
  MockSpec<PractitionerRepository>(),
  MockSpec<Algolia>(),
  MockSpec<SavePractitionerUseCase>(),
  MockSpec<GetPractitionerInfoUseCase>(),
  MockSpec<SearchPractitionerUseCase>(),
  MockSpec<NavigatorObserver>(),
  MockSpec<FilePicker>(),
  MockSpec<FirebaseStorage>(),
  MockSpec<GetPractitionerProfileUseCase>(),
])
void main() {}
