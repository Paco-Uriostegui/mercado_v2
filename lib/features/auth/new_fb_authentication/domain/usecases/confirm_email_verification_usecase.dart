import 'package:mercado_v2/app/core/result/result.dart';
import 'package:mercado_v2/features/auth/new_fb_authentication/domain/repositories/newiauth_repository.dart';

class ConfirmEmailVerificationUseCase {
  final NewIAuthRepository _authRepository;

  ConfirmEmailVerificationUseCase({required NewIAuthRepository authRepository})
    : _authRepository = authRepository;

  Future<Result<bool>> call() async {
    return await _authRepository.tryIsEmailVerified();

  }
}
