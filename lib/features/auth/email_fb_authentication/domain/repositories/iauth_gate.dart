abstract class NewIAuthGate {
  //Future<AuthenticationStatus?> authenticationGate();
  final Stream<AuthenticationStatus> authenticationGateStream;

  NewIAuthGate({required this.authenticationGateStream});

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
