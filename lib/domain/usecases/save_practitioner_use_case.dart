import 'package:dartz/dartz.dart';
import 'package:docdiscovery/core/error/failure.dart';
import 'package:docdiscovery/domain/entities/practitioner.dart';
import 'package:docdiscovery/domain/repositories/practitioner_repository.dart';

class SavePractitionerUseCase {
  final PractitionerRepository practitionerRepository;

  SavePractitionerUseCase({
    required this.practitionerRepository,
  });

  Future<Either<Failure, PractitionerEntity>> execute(
      PractitionerEntity practitioner) {
    return practitionerRepository.savePractitioner(practitioner);
  }
}
