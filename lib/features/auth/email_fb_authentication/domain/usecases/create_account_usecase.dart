import 'package:mercado_v2/app/core/result/result.dart';
import 'package:mercado_v2/features/auth/email_fb_authentication/domain/repositories/i_auth_repository.dart';
import 'package:mercado_v2/features/auth/email_fb_authentication/domain/value_objects/value_objects_export.dart';

class CreateAccountUsecase {
  final IAuthRepository _authRepository;

  CreateAccountUsecase({required IAuthRepository authRepository})
    : _authRepository = authRepository;

  Future<Result<void, CreateAccountFailure>> call({
    required String emailString,
    required String passwordString,
  }) async {
    late final Email email;
    late final Password pass;

    // --------------------------------------------------- validating params
    final emailResult = Email.create(emailString);
    switch (emailResult) {
      case Success(:final value):
        email = value;
        break;
      case FailureResult():
        return Result.failure(InvalidFormatEmailFailure());
    }

    final passwordResult = Password.create(passwordString);
    switch (passwordResult) {
      case Success(:final value):
        pass = value;
        break;
      case FailureResult():
        return Result.failure(WeakPasswordFailure());
    }

    // --------------------------------------------------------------- create account
    final createAccountResult = await _authRepository
        .tryCreateUserWithEmailAndPassword(email, pass);
    if (createAccountResult case FailureResult(failure: CreateAccountFailure failure)) {
      switch (failure) {
    
        case WeakPasswordFailure():
          return Result.failure(WeakPasswordFailure());
        case EmailAlreadyInUseFailure():
          return Result.failure(EmailAlreadyInUseFailure());
        case InvalidFormatEmailFailure():
          return Result.failure(InvalidFormatEmailFailure());
        case NetworkFailure():
          return Result.failure(NetworkFailure());
        case UnkownCreateAccountFailure():
          return Result.failure(UnkownCreateAccountFailure());
      }
    }
    await _authRepository.trySendEmailVerification();
    return Result.success(null);
  }
}
