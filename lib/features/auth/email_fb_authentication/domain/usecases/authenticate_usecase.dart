import 'package:mercado_v2/features/auth/email_fb_authentication/domain/repositories/i_auth_repository.dart';

class AuthenticationUseCase {
  final IAuthRepository _authRepository;

  AuthenticationUseCase({required IAuthRepository authRepository})
    : _authRepository = authRepository;

  Stream<AuthUserStatus> execute() {
    return _authRepository.onStateChanges().map(( authUser) {
      if (authUser != null) {
        if (authUser.isEmailVerified) {
          return AuthUserComplete();
        } else {
          return AuthUserNotVerified();
        }
      } else {
        return AuthUserNotAuthenticated();
      }
    });
  }
}

sealed class AuthUserStatus {}

class AuthUserComplete extends AuthUserStatus {}

class AuthUserNotVerified extends AuthUserStatus {}

class AuthUserNotAuthenticated extends AuthUserStatus {}
