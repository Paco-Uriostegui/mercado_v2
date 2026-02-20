import 'package:mercado_v2/app/core/result/result.dart';
import 'package:mercado_v2/features/auth/email_fb_authentication/domain/repositories/iauth_repository.dart';
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
        return Result.failure(InvalidEmailFailure());
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
    if (createAccountResult case FailureResult(failure: Failure failure)) {
      switch (failure) {

      }

      return Result.failure();
    }
    await _authRepository.trySendEmailVerification();
    return Result.success(null);
  }
}
