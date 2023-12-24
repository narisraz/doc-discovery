import 'package:dartz/dartz.dart';
import 'package:docdiscovery/core/error/failure.dart';
import 'package:docdiscovery/domain/repositories/practitioner_repository.dart';

class GetPractitionerProfileUseCase {
  final PractitionerRepository practitionerRepository;

  GetPractitionerProfileUseCase({required this.practitionerRepository});

  Future<Either<Failure, String>> execute(String practitionerId) {
    return practitionerRepository.getProfile(practitionerId);
  }
}
