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
  final String errorMessage;
  const AuthException(this.errorMessage);
}

class UnknownException extends Failure {
  const UnknownException();
}
