
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

class AuthException extends Failure {
  const AuthException();
}

// -------------------------------------------------------- value object exceptions

class InvalidEmailFormat extends Failure {
  const InvalidEmailFormat();
}

class InvalidPasswordTooShort extends Failure {
  const InvalidPasswordTooShort();
}

class InvalidFirstNameTooShort extends Failure {
  const InvalidFirstNameTooShort();
}

class InvalidFirstNameInvalidChars extends Failure {
  const InvalidFirstNameInvalidChars();
}

class InvalidLastNameTooShort extends Failure {
  const InvalidLastNameTooShort();
}

class InvalidLastNameInvalidChars extends Failure {
  const InvalidLastNameInvalidChars();
}

class InvalidSecondLastNameTooShort extends Failure {
  const InvalidSecondLastNameTooShort();
}

class InvalidSecondLastNameInvalidChars extends Failure {
  const InvalidSecondLastNameInvalidChars();
}

class UnknownException extends Failure {
  const UnknownException();
}

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

// ------------------------------------------------------------------------ EmailVerify
class IsEmailVerifiedException extends AuthException {
  const IsEmailVerifiedException();
}

class SendEmailVerificationException extends AuthException {
  const SendEmailVerificationException();
}
