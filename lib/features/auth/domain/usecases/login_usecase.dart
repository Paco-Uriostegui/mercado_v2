import 'package:mercado_v2/core/result/failure.dart';
import 'package:mercado_v2/core/result/result.dart';
import 'package:mercado_v2/features/auth/domain/entities/user.dart';
import 'package:mercado_v2/features/auth/domain/repositories/iauth_repository.dart';

class LoginUsecase {
  final IAuthRepository _authRepository;

  LoginUsecase({required IAuthRepository authRepository})
    : _authRepository = authRepository;

  Future<Result<User>> execute({
    required String email,
    required String password,
  }) async {
    if (_areEmailAndPassValids(email: email, password: password)) {
      return Failure(
        AuthException(
          'El correo o la contraseña son inválidos. Por favor verifica y vuelve a intentarlo.',
        ),
      );
    }

    return _authRepository
        .trySignInWithEmailAndPassword(email, password);
  }

  bool _areEmailAndPassValids({
    required String email,
    required String password,
  }) {
    final e = email.trim();
    final p = password.trim();
    final hasValidFormat =
        e.isNotEmpty &&
        e.contains('@') &&
        e.indexOf('@') > 0 &&
        e.indexOf('@') < e.length - 1 &&
        p.length >= 8 &&
        e.contains('.');
    return hasValidFormat;
  }
}
