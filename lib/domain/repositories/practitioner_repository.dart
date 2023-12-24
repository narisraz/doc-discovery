import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:docdiscovery/core/error/failure.dart';
import 'package:docdiscovery/domain/entities/practitioner.dart';

abstract class PractitionerRepository {
  Future<Either<Failure, PractitionerEntity>> savePractitioner(
      PractitionerEntity practitioner);

  Future<Either<Failure, PractitionerEntity>> getById(String practitionerId);

  Future<List<PractitionerEntity>> search(String query);

  Future<Either<Failure, Uint8List>> uploadPractitionerProfile(
      String practitionerId, Uint8List profile);

  Future<Either<Failure, Uint8List>> getProfile(String practitionerId);
}
