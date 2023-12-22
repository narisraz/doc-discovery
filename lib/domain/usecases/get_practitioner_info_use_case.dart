import 'package:dartz/dartz.dart';
import 'package:docdiscovery/core/error/failure.dart';
import 'package:docdiscovery/domain/entities/practitioner.dart';
import 'package:docdiscovery/domain/repositories/practitioner_repository.dart';

class GetPractitionerInfoUseCase {
  final PractitionerRepository practitionerRepository;

  GetPractitionerInfoUseCase({required this.practitionerRepository});

  Future<Either<Failure, PractitionerEntity>> execute(String practitionerId) {
    return practitionerRepository.getById(practitionerId);
  }
}
