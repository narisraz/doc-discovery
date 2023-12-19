import 'package:dartz/dartz.dart';
import 'package:docdiscovery/core/error/failure.dart';
import 'package:docdiscovery/domain/entities/practitioner.dart';

abstract class PractitionerRepository {
  Future<Either<Failure, PractitionerEntity>> savePractitioner(
      PractitionerEntity practitioner);
}
