import 'package:mercado_v2/app/core/result/result.dart';
import 'package:mercado_v2/features/auth/email_fb_authentication/domain/repositories/i_auth_repository.dart';
import 'package:mercado_v2/features/auth/email_fb_authentication/domain/value_objects/value_objects_export.dart';

class LoginUsecase {
  final IAuthRepository _authRepository;

  LoginUsecase({
    required IAuthRepository authRepository,
    //required IUserRepository iuserRepository,
  }) : _authRepository = authRepository;

  Future<Result<void, AuthFailure>> call({
    required String email,
    required String password,
  }) async {
    late final Email emailVO;
    late final Password passwordVO;

    // ------------------------------------------------------------------ Early return
    switch (Email.create(email)) {
      case Success(:final value):
        emailVO = value;
      case FailureResult():
        return Result.failure(InvalidEmailFailure());
    }

    switch (Password.create(password)) {
      case Success(:final value):
        passwordVO = value;
      case FailureResult():
        return Result.failure(InvalidPasswordFormatFailure());
    }

    switch (await _authRepository.trySignInWithEmailAndPassword(
      emailVO,
      passwordVO,
    )) {
        case Success():
          return Result.success(null);
        case FailureResult(:final failure):
          return switch (failure) {


          }
        }
        
    }

    // --------------------------------------------------------------- flatMapAsync + mapFailure -------------------
    // final result = await Email.create(email).newFlatMapAsync(
    //   (emailVO) => Password.create(password).newFlatMapAsync(
    //     (passwordVO) =>
    //         _authRepository.trySignInWithEmailAndPassword(emailVO, passwordVO),
    //     (_) => InvalidPasswordFormatLoginFailure(),
    //   ),
    //   (_) => InvalidEmailFailure(),
    // );

    // result.when(success: (_) => Result.success(null), failure: (failure) {});

    // --------------------------------------------------------------- old if version -------------------
    // final emailResult = Email.create(email);
    // if (emailResult.isFailure) {
    //   return Result.failure(InvalidEmailFailure());
    // }
    // final resultVO = emailResult.getSuccess;
    // if (resultVO != null) {
    //   validEmailVO = resultVO;
    // } else {
    //   return Result.failure(InvalidEmailFailure());
    // }

    // final passResult = Password.create(password);
    // if (passResult.isFailure) {
    //   return Result.failure(InvalidPasswordFormatLoginFailure());
    // }
    // final passResultVo = passResult.getSuccess;
    // if (passResultVo != null) {
    //   validPassVO = passResultVo;
    // } else {
    //   return Result.failure(InvalidPasswordFormatLoginFailure());
    // }

    // final loginResult = await _authRepository.trySignInWithEmailAndPassword(
    //   validEmailVO,
    //   validPassVO,
    // );
    // return loginResult.when(
    //   success: (_) => Result.success(null),
    //   failure: (failure) {
    //     switch (failure) {
    //       case IsEmailVerifiedFailure():

    //       case SendEmailVerificationFailure():

    //       case SignInException():

    //     }
    //   },
    // );
  }
}
