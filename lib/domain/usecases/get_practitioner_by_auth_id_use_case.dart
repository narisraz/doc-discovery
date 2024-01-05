import 'package:dartz/dartz.dart';
import 'package:docdiscovery/core/error/failure.dart';
import 'package:docdiscovery/domain/entities/practitioner.dart';
import 'package:docdiscovery/domain/repositories/practitioner_repository.dart';

class GetPractitionerByAuthIdUseCase {
  final PractitionerRepository practitionerRepository;

  GetPractitionerByAuthIdUseCase({required this.practitionerRepository});

  Future<Either<Failure, PractitionerEntity>> execute(String authId) {
    return practitionerRepository.getByAuthId(authId);
  }
}
