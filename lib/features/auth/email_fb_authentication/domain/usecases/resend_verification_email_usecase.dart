import 'package:mercado_v2/features/auth/email_fb_authentication/domain/repositories/iauth_repository.dart';

class ResendVerificationEmailUsecase {
  final IAuthRepository _authRepository;

  ResendVerificationEmailUsecase(this._authRepository);

  Future<void> call() async {
    await _authRepository.trySendEmailVerification();
  }
}
