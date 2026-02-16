import 'package:mercado_v2/app/core/result/result.dart';
import 'package:mercado_v2/features/auth/new_fb_authentication/domain/entities/auth_user/new_auth_user.dart';
import 'package:mercado_v2/features/auth/new_fb_authentication/domain/repositories/newiauth_repository.dart';
import 'package:mercado_v2/features/auth/new_fb_authentication/domain/value_objects/newvalue_objects_export.dart';

class NewLoginUsecase {
  final NewIAuthRepository _authRepository;

  NewLoginUsecase({
    required NewIAuthRepository authRepository,
    //required IUserRepository iuserRepository,
  }) : _authRepository = authRepository;

  Future<Result<NewAuthUser>> call({
    required String email,
    required String password,
  }) async {
    // --------------------------------------------------------------- flatMapAsync -------------------
    return NewEmail.create(email).flatMapAsync((emailVO) {
      return NewPassword.create(password).flatMapAsync((passVO) {
        return _authRepository.trySignInWithEmailAndPassword(emailVO.value, passVO.value);
      });
    });
    
  }
}