import 'package:mercado_v2/app/core/result/result.dart';
import 'package:mercado_v2/app/core/result/result_extensions.dart';
import 'package:mercado_v2/features/auth/domain/entities/auth_user/auth_user.dart';
import 'package:mercado_v2/features/auth/domain/repositories/iauth_repository.dart';
import 'package:mercado_v2/features/auth/domain/repositories/iuser_repository.dart';
import 'package:mercado_v2/features/auth/domain/value_objects/user/email.dart';
import 'package:mercado_v2/features/auth/domain/value_objects/user/password.dart';

class LoginUsecase {
  final IAuthRepository _authRepository;

  LoginUsecase({
    required IAuthRepository authRepository,
    required IUserRepository iuserRepository,
  }) : _authRepository = authRepository;

  Future<Result<AuthUser>> call({
    required String email,
    required String password,
  }) async {
    // --------------------------------------------------------------- flatMapAsync -------------------
    return Email.create(email).flatMapAsync((emailVO) {
      return Password.create(password).flatMapAsync((passVO) {
        return _authRepository.trySignInWithEmailAndPassword(emailVO.value, passVO.value);
      });
    });
    
  }
}
