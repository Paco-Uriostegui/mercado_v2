import 'package:mercado_v2/features/auth/new_fb_authentication/domain/repositories/newiauth_repository.dart';

class ResendVerificationEmailUsecase {
  final NewIAuthRepository _authRepository;

  ResendVerificationEmailUsecase(this._authRepository);

  Future<void> call() async {
    await _authRepository.trySendEmailVerification();
  }
}
