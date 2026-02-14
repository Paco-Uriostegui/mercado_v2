import 'package:mercado_v2/app/core/result/failure.dart';
import 'package:mercado_v2/app/core/result/result.dart';
import 'package:mercado_v2/features/auth/email_fb_authentication/domain/repositories/iauth_repository.dart';
import 'package:mercado_v2/features/auth/email_fb_authentication/domain/value_objects/user/value_objects_export.dart';

class CreateAccountUsecase {
  final IAuthRepository _authRepository;

  CreateAccountUsecase({required IAuthRepository authRepository})
    : _authRepository = authRepository;

  Future<Result<void>> call({
    required String emailString,
    required String passwordString,
    // required String firstNameString,
    // required String lastNameString,
    // required String secondLastNameString,
  }) async {
    late final Email email;
    late final Password pass;
    // late final FirstName firstName;
    // late final LastName lastName;
    // late final SecondLastName secondLastName;

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

    // final firstNameResult = FirstName.create(firstNameString);
    // switch (firstNameResult) {
    //   case Success(:final value):
    //     firstName = value;
    //     break;
    //   case FailureResult(:final failure):
    //     return Result.failure(failure);
    // }

    // final lastNameResult = LastName.create(lastNameString);
    // switch (lastNameResult) {
    //   case Success(:final value):
    //     lastName = value;
    //     break;
    //   case FailureResult(:final failure):
    //     return Result.failure(failure);
    // }

    // final secondLastNameResult = SecondLastName.create(secondLastNameString);
    // switch (secondLastNameResult) {
    //   case Success(:final value):
    //     secondLastName = value;
    //     break;
    //   case FailureResult(:final failure):
    //     return Result.failure(failure);
    // } 
    // ------------------------------------------------------------- Create account

    final Result<void> createAccountResult = await _authRepository
        .tryCreateUserWithEmailAndPassword(email, pass);
    if (createAccountResult case FailureResult(failure: Failure failure)) {
      return Result.failure(failure);
    }
    await _authRepository.trySendEmailVerification();
    return Result.success(null);
  }
}

// sealed class Registration {}

// class RegistrationSuccess extends Registration {}

// class RegistrationSuccessWithIncompleteProfile extends Registration {}

    // final Result<void> responseResult = await _authRepository
    //     .tryUpdateDisplayName(
    //       firstName.value,
    //       lastName.value,
    //       secondLastName.value,
    //     );