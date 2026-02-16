abstract class NewIAuthGateStream {
  //Future<AuthenticationStatus?> authenticationGate();
  Stream<NewAuthenticationStatus> get authenticationGateStream;
  void initialize();
  void manualAuthenticationSuccessStreamSinkAdd();

  NewIAuthGateStream();
}

sealed class NewAuthenticationStatus {
  const NewAuthenticationStatus();
}

class AuthenticationSuccess extends NewAuthenticationStatus {
  const AuthenticationSuccess();
}

class AuthenticationError extends NewAuthenticationStatus {
  const AuthenticationError();
}
