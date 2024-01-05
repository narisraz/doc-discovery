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

class FileNotFoundFailure extends Failure {
  const FileNotFoundFailure() : super("File not found");
}

class MailFormatFailure extends Failure {
  const MailFormatFailure() : super("Mail format not valid");
}

class NoUserConnectedFailure extends Failure {
  const NoUserConnectedFailure() : super("No user connected");
}

class NoPractitionerFoundFailure extends Failure {
  const NoPractitionerFoundFailure() : super("No practitioner found");
}

class SignInFailure extends Failure {
  const SignInFailure() : super("Sign in failed");
}
