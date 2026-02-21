import 'package:mercado_v2/app/core/result/result.dart';
import 'package:mercado_v2/features/auth/email_fb_authentication/domain/repositories/i_auth_repository.dart';
import 'package:mercado_v2/features/auth/email_fb_authentication/domain/value_objects/value_objects_export.dart';

class LoginUsecase {
  final IAuthRepository _authRepository;

  LoginUsecase({
    required IAuthRepository authRepository,
    //required IUserRepository iuserRepository,
  }) : _authRepository = authRepository;

  Future<Result<void>> call({
    required String email,
    required String password,
  }) async {
    // --------------------------------------------------------------- flatMapAsync -------------------
    return Email.create(email).flatMapAsync((emailVO) {
      return Password.create(password).flatMapAsync((passVO) {
        return _authRepository.trySignInWithEmailAndPassword(
          emailVO,
          passVO,
        );
      });
    });
  }
}
