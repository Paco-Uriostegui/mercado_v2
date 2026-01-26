sealed class DomainException {
  const DomainException();
}

class NetworkException implements DomainException {
  const NetworkException();
}

class InvalidCredentials implements DomainException {
  const InvalidCredentials();
}

class LocalException implements DomainException {
  const LocalException();
}