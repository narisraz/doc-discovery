import 'package:docdiscovery/domain/repositories/practitioner_repository.dart';
import 'package:docdiscovery/domain/usecases/get_practitioner_info_use_case.dart';
import 'package:docdiscovery/domain/usecases/save_practitioner_use_case.dart';
import 'package:mockito/annotations.dart';

@GenerateNiceMocks([
  MockSpec<PractitionerRepository>(),
  MockSpec<SavePractitionerUseCase>(),
  MockSpec<GetPractitionerInfoUseCase>(),
])
void main() {}
