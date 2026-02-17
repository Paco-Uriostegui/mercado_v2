abstract class IAuthGateStream {
  //Future<AuthenticationStatus?> authenticationGate();
  Stream<AuthenticationStatus> get authenticationGateStream;
  void initialize();
  void manualAuthenticationSuccessStreamSinkAdd();

  IAuthGateStream();
}

sealed class AuthenticationStatus {
  const AuthenticationStatus();
}

class AuthenticationSuccess extends AuthenticationStatus {
  const AuthenticationSuccess();
}

class AuthenticationError extends AuthenticationStatus {
  const AuthenticationError();
}
