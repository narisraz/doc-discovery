import 'package:docdiscovery/domain/entities/practitioner.dart';
import 'package:docdiscovery/domain/repositories/practitioner_repository.dart';

class SearchPractitionerUseCase {
  final PractitionerRepository practitionerRepository;

  SearchPractitionerUseCase({required this.practitionerRepository});

  Future<List<PractitionerEntity>> execute(String query) {
    return practitionerRepository.search(query);
  }
}
