import 'package:mercado_v2/features/auth/new_fb_authentication/domain/repositories/newiauth_repository.dart';

class AuthenticationUseCase {
  final NewIAuthRepository _authRepository;

  AuthenticationUseCase({required NewIAuthRepository authRepository})
    : _authRepository = authRepository;

    Stream<AuthUserStatus> execute() {
     return _authRepository.onStateChanges().map((authUser) {
      if (authUser != null) {
        if (authUser.isEmailVerified) {
          return AuthUserCompleted();
        } else {
          return AuthUserUnverified();
        }
      } else {
        return AuthUserUnlogged();
      }
    });
    }
}


sealed class AuthUserStatus {}
class AuthUserCompleted extends AuthUserStatus {}
class AuthUserUnverified extends AuthUserStatus {}
class AuthUserUnlogged extends AuthUserStatus {}