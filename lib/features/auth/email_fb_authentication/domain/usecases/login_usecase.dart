import 'package:mercado_v2/app/core/result/result.dart';
import 'package:mercado_v2/features/auth/email_fb_authentication/domain/repositories/i_auth_repository.dart';
import 'package:mercado_v2/features/auth/email_fb_authentication/domain/value_objects/value_objects_export.dart';

class LoginUsecase {
  final IAuthRepository _authRepository;

  LoginUsecase({
    required IAuthRepository authRepository,
    //required IUserRepository iuserRepository,
  }) : _authRepository = authRepository;

  Future<Result<void, LoginFailure>> call({
    required String email,
    required String password,
  }) async {
    Email validEmailVO;
    Password validPassVO;

    // final emailResult = Email.create(email);
    // emailResult.when(
    //   success: (emailVO) {
    //     validEmailVO = emailVO;
    //   },
    //   failure: (failure) => Result.failure(InvalidEmailFailure()),
    // );

    // final passResult = Password.create(password);
    // passResult.when(
    //   success: (passVO) {
    //     validPassVO = passVO;
    //   },
    //   failure: (failure) => Result.failure(InvalidPasswordFormatLoginFailure()),
    // );

   

    // --------------------------------------------------------------- flatMapAsync -------------------
    // return Email.create(email).mapFailure((failure) {switch (failure) {
    //   case InvalidEmailVOFormatFaliure():
    //     return InvalidEmailFailure();
    // }}).flatMap((emailVO) {
    //   return Password.create(password).mapFailure((passfailure) { switch (passfailure) {
        
    //     case InvalidPasswordVOFormatFailure(): 
    //     return InvalidPasswordFormatLoginFailure();
    //   }});
    // })
    
    // ;






    //   return Email.create(email).flatMapAsync((emailVO) {
    //     return Password.create(password).flatMapAsync((passVO) {
    //       return _authRepository.trySignInWithEmailAndPassword(
    //         emailVO,
    //         passVO,
    //       );
    //     });
    //   });
  }
}
