import 'package:mercado_v2/app/core/result/result.dart';
import 'package:mercado_v2/features/auth/email_fb_authentication/domain/repositories/i_auth_repository.dart';

class ConfirmEmailVerificationUseCase {
  final IAuthRepository _authRepository;

  ConfirmEmailVerificationUseCase({required IAuthRepository authRepository})
    : _authRepository = authRepository;

  Future<Result<bool>> call() async {
    return await _authRepository.tryIsEmailVerified();
  }
}
