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

// ------------------------------------------------------------------ value object failures

class ValueObjectsFailure extends Failure {}

// ------------------------------------------------------------------ emailVO failures
sealed class EmailValueObjectFailure extends Failure {}

class InvalidEmailVOFormatFaliure extends EmailValueObjectFailure {}

// ------------------------------------------------------------------ passwordVO failures
sealed class PasswordValueObjectFailure extends Failure {}

class InvalidPasswordVOFormatFailure extends PasswordValueObjectFailure {}

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

sealed class AuthFailure extends Failure {
  const AuthFailure();
}

class EmailAlreadyInUseFailure implements AuthFailure {}
class InvalidEmailFormatFailure implements AuthFailure {} 
class InvalidEmailFailure implements AuthFailure {} 
class UserNotFoundFailure implements AuthFailure {}


class OperationNotAllowedFailure implements AuthFailure {}
class TooManyRequestsFailure implements AuthFailure {}
class UserTokenExpiredFailure implements AuthFailure {}
class BackendUserIsNullFailure implements AuthFailure {}
class NetworkRequestFailedFailure implements AuthFailure {}
class UserDisabledFailure implements AuthFailure {}
class InvalidLoginCredentialsFailure implements AuthFailure {}

class InvalidPasswordFormatFailure implements AuthFailure {}
class WrongPasswordFailure implements AuthFailure {}
class WeakPasswordFailure implements AuthFailure {}



class UnknownAuthFailure implements AuthFailure {
}

// ------------------------------------------------------------------------ CreateAccount Failures
// sealed class CreateAccountFailure extends Failure {}

// class WeakPasswordFailure extends CreateAccountFailure {}

// class EmailAlreadyInUseFailure extends CreateAccountFailure {}

// class InvalidFormatEmailFailure extends CreateAccountFailure {}

// class NetworkFailure extends CreateAccountFailure {}

// class UnkownCreateAccountFailure extends CreateAccountFailure {}

// // ------------------------------------------------------------------------ Login Failures
// sealed class LoginFailure extends Failure {}

// class InvalidEmailLoginFailure extends LoginFailure {}

// class UserDisabledFailure extends LoginFailure {}

// class UserNotFoundFailure extends LoginFailure {}

// class WrongPasswordFailure extends LoginFailure {}

// class InvalidPasswordFormatLoginFailure extends LoginFailure {}

// class TooManyRequestsFailure extends LoginFailure {}

// class UserTokenExpiredFailure extends LoginFailure {}

// class NetworkRequestLoginFailure extends LoginFailure {}

// class InvalidLoginCredentialsFailure extends LoginFailure {}

// class OperationNotAllowedLoginFailure extends LoginFailure {}

class UnknownException extends Failure {}
