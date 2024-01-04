import 'package:algolia/algolia.dart';
import 'package:docdiscovery/core/utils.dart';
import 'package:docdiscovery/domain/repositories/auth_repository.dart';
import 'package:docdiscovery/domain/repositories/practitioner_repository.dart';
import 'package:docdiscovery/domain/repositories/user_repository.dart';
import 'package:docdiscovery/domain/usecases/get_auth_id_use_case.dart';
import 'package:docdiscovery/domain/usecases/get_connected_user_use_case.dart';
import 'package:docdiscovery/domain/usecases/get_practitioner_info_use_case.dart';
import 'package:docdiscovery/domain/usecases/get_practitioner_profile_use_case.dart';
import 'package:docdiscovery/domain/usecases/save_practitioner_use_case.dart';
import 'package:docdiscovery/domain/usecases/search_practitioner_use_case.dart';
import 'package:docdiscovery/domain/usecases/sign_in_use_case.dart';
import 'package:docdiscovery/domain/usecases/sign_up_user_use_case.dart';
import 'package:file_picker/file_picker.dart';
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
  MockSpec<GetPractitionerProfileUseCase>(),
  MockSpec<AuthRepository>(),
  MockSpec<MailUtil>(),
  MockSpec<SignUpUserUseCase>(),
  MockSpec<UserRepository>(),
  MockSpec<SignInUserUseCase>(),
  MockSpec<GetConnectedUserUseCase>(),
  MockSpec<GetAuthIdUseCase>(),
])
void main() {}
