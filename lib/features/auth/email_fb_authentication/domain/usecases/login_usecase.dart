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

    final emailResult = Email.create(email);
    if (emailResult.isFailure) {
      return Result.failure(InvalidEmailFailure());
    }
    final resultVO = emailResult.getSuccess;
    if (resultVO != null) {
      validEmailVO = resultVO;
    } else {
      return Result.failure(InvalidEmailFailure());
    }

    final passResult = Password.create(password);
    if (passResult.isFailure) {
      return Result.failure(InvalidPasswordFormatLoginFailure());
    }
    final passResultVo = passResult.getSuccess;
    if (passResultVo != null) {
      validPassVO = passResultVo;
    } else {
      return Result.failure(InvalidPasswordFormatLoginFailure());
    }

    final loginResult = await _authRepository.trySignInWithEmailAndPassword(
      validEmailVO,
      validPassVO,
    );
    return loginResult.when(
      success: (_) => Result.success(null),
      failure: (failure) {
        switch (failure) {
          case IsEmailVerifiedFailure():
            // TODO: Handle this case.
            throw UnimplementedError();
          case SendEmailVerificationFailure():
            // TODO: Handle this case.
            throw UnimplementedError();
          case SignInException():
            // TODO: Handle this case.
            throw UnimplementedError();
        }
        // hacer switch o equivalente para accionar dependiendo del tipo de failure que traiga el failure
      },
    );

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
