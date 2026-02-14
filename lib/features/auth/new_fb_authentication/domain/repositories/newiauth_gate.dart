abstract class NewIAuthGate {
  //Future<AuthenticationStatus?> authenticationGate();
  final Stream<NewAuthenticationStatus> authenticationGateStream;

  NewIAuthGate({required this.authenticationGateStream});

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