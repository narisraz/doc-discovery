import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;

  const Failure(this.message);

  @override
  List<Object> get props => [message];
}

class NotImplementedFailure extends Failure {
  const NotImplementedFailure() : super("Not implemented");
}

class ObjectNotValidFailure extends Failure {
  const ObjectNotValidFailure() : super("Object not valid");
}

class UploadFailedFailure extends Failure {
  const UploadFailedFailure() : super("Upload failed");
}
