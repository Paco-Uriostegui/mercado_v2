sealed class Failure {
  const Failure();
}

class NetworkException extends Failure {
  const NetworkException();
}

class InvalidCredentials extends Failure {
  const InvalidCredentials();
}

class LocalException extends Failure {
  const LocalException();
}

// -------------------------------------------------------- value object failures

class ValueObjectsFailure extends Failure {}

class InvalidEmailFormatFailure extends ValueObjectsFailure {}

class PasswordTooShortFailure extends ValueObjectsFailure {}

class FirstNameTooShortFailure extends ValueObjectsFailure {}

class FirstNameInvalidCharsFailure extends ValueObjectsFailure {}

class LastNameTooShortFailure extends ValueObjectsFailure {}

class LastNameInvalidCharsFailure extends ValueObjectsFailure {}

class SecondLastNameTooShortFailure extends ValueObjectsFailure {}

class SecondLastNameInvalidCharsFailure extends ValueObjectsFailure {}


class LocalUserException extends Failure {
  final String errorMessage;
  const LocalUserException(this.errorMessage);

  factory LocalUserException.errorWhileSavingUser() {
    return LocalUserException('Error while saving user locally');
  }

  factory LocalUserException.errorGettingUser() {
    return LocalUserException('Error getting user locally');
  }
  factory LocalUserException.errorRemovingUser() {
    return LocalUserException('Error removing user locally');
  }

  // ----------------------------------------------------------------
}

class RemoteAuthException extends Failure {
  const RemoteAuthException();
}

class GetCurrentUserException extends RemoteAuthException {
  const GetCurrentUserException();
}

class UpdateDisplayNameException extends RemoteAuthException {
  const UpdateDisplayNameException();
}

// ------------------------------------------------------------------------ AuthFailure

class AuthFailure extends Failure {
  const AuthFailure();
}

class IsEmailVerifiedFailure extends AuthFailure {}

class SendEmailVerificationFailure extends AuthFailure {}

class SignInException extends AuthFailure {}

// ------------------------------------------------------------------------ CreateAccount Failures
sealed class CreateAccountFailure extends Failure {}

class WeakPasswordFailure extends CreateAccountFailure {}
class EmailAlreadyInUseFailure extends CreateAccountFailure {}
class InvalidFormatEmailFailure extends CreateAccountFailure {}
class NetworkFailure extends CreateAccountFailure {}
class UnkownCreateAccountFailure extends CreateAccountFailure {}





class UnknownException extends Failure {}

