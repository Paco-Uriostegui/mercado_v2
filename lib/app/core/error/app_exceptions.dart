sealed class AuthException implements Exception {}

//class InvalidCredentialsException implements AuthException {}
class EmailAlreadyInUseException implements AuthException {}

class InvalidEmailException implements AuthException {}

class WeakPasswordException implements AuthException {}
class OperationNotAllowedException implements AuthException {}
class TooManyRequestsException implements AuthException {}
class UserTokenExpiredException implements AuthException {}
class BackendUserIsNullException implements AuthException {}
class NetworkRequestFailedException implements AuthException {}
class UserDisabledException implements AuthException {}
class UserNotFoundException implements AuthException {}
class WrongPasswordException implements AuthException {}
class InvalidLoginCredentialsException implements AuthException {}

class UnknownAuthException implements AuthException {
  final String message;
  UnknownAuthException(this.message);
}



sealed class NetworkException implements Exception {}

class NoInternetConnection implements NetworkException {}
