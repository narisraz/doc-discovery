import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:docdiscovery/core/error/failure.dart';
import 'package:docdiscovery/domain/repositories/practitioner_repository.dart';

class UploadPractitionerProfileUseCase {
  final PractitionerRepository practitionerRepository;

  UploadPractitionerProfileUseCase({required this.practitionerRepository});

  Future<Either<Failure, Uint8List>> execute(
      String practitionerId, Uint8List profile) {
    return practitionerRepository.uploadPractitionerProfile(
        practitionerId, profile);
  }
}
