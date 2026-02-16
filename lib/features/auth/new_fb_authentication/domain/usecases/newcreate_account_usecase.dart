import 'package:mercado_v2/app/core/result/result.dart';
import 'package:mercado_v2/features/auth/new_fb_authentication/domain/repositories/newiauth_repository.dart';
import 'package:mercado_v2/features/auth/new_fb_authentication/domain/value_objects/newvalue_objects_export.dart';

class NewCreateAccountUsecase {
  final NewIAuthRepository _authRepository;

  NewCreateAccountUsecase({required NewIAuthRepository authRepository})
    : _authRepository = authRepository;

  Future<Result<void>> call({
    required String emailString,
    required String passwordString,
  }) async {
    late final NewEmail email;
    late final NewPassword pass;
    final emailResult = NewEmail.create(emailString);
    switch (emailResult) {
      case Success(:final value):
        email = value;
        break;
      case FailureResult(:final failure):
        return Result.failure(failure);
    }

    final passwordResult = NewPassword.create(passwordString);
    switch (passwordResult) {
      case Success(:final value):
        pass = value;
        break;
      case FailureResult(:final failure):
        return Result.failure(failure);
    }
        final Result<void> createAccountResult = await _authRepository
        .tryCreateUserWithEmailAndPassword(email, pass);
    if (createAccountResult case FailureResult(failure: Failure failure)) {
      return Result.failure(failure);
    }
    await _authRepository.trySendEmailVerification();
    return Result.success(null);
  }
}