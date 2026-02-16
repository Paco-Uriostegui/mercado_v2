import 'package:mercado_v2/features/auth/new_fb_authentication/domain/repositories/newiauth_repository.dart';

class VerifyEmailUsecase {
  final NewIAuthRepository _authRepository;

  VerifyEmailUsecase({required NewIAuthRepository authRepository}) : _authRepository = authRepository;

  //Future<void> execute() {
  //   final result = _authRepository.tryGetCurrentUser();
  //   final verified = _authRepository.tryVerifyEmail();
  // }


}