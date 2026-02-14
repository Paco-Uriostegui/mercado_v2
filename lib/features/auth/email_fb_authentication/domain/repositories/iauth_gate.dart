abstract class IAuthGate {
  //Future<AuthenticationStatus?> authenticationGate();
  final Stream<AuthenticationStatus> authenticationGateStream;

  IAuthGate({required this.authenticationGateStream});

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
