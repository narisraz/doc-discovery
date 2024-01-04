import 'package:docdiscovery/domain/repositories/auth_repository.dart';

class GetAuthIdUseCase {
  final AuthRepository authRepository;

  GetAuthIdUseCase({required this.authRepository});

  String? execute() {
    return authRepository.getAuthId();
  }
}
