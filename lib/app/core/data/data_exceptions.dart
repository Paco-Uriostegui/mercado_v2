sealed class AuthException implements Exception {}

class InvalidCredentialsException implements AuthException {}
class EmailAlreadyInUseException implements AuthException {}

sealed class NetworkException implements Exception {}

class NoInternetConnection implements NetworkException {}



