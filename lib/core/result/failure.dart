sealed class DomainException {
  const DomainException();
}

class NetworkException extends DomainException {
  const NetworkException();
}

class InvalidCredentials extends DomainException {
  const InvalidCredentials();
}

class LocalException extends DomainException {
  const LocalException();
}

class AuthException extends DomainException {
  final String errorMessage;
  const AuthException(this.errorMessage);
}