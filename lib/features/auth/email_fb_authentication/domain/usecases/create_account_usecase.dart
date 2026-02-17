import 'package:mercado_v2/app/core/result/result.dart';
import 'package:mercado_v2/features/auth/email_fb_authentication/domain/repositories/iauth_repository.dart';
import 'package:mercado_v2/features/auth/email_fb_authentication/domain/value_objects/value_objects_export.dart';

class CreateAccountUsecase {
  final IAuthRepository _authRepository;

  CreateAccountUsecase({required IAuthRepository authRepository})
    : _authRepository = authRepository;

  Future<Result<void>> call({
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
      case FailureResult(:final failure):
        return Result.failure(failure);
    }

    final passwordResult = Password.create(passwordString);
    switch (passwordResult) {
      case Success(:final value):
        pass = value;
        break;
      case FailureResult(:final failure):
        return Result.failure(failure);
    }

    // --------------------------------------------------------------- create account
    final Result<void> createAccountResult = await _authRepository
        .tryCreateUserWithEmailAndPassword(email, pass);
    if (createAccountResult case FailureResult(failure: Failure failure)) {
      return Result.failure(failure);
    }
    await _authRepository.trySendEmailVerification();
    return Result.success(null);
  }
}
