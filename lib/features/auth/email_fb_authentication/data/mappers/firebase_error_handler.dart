import 'package:firebase_auth/firebase_auth.dart';
import 'package:logger/logger.dart';
import 'package:mercado_v2/app/core/error/data_exceptions.dart';

class FirebaseAuthErrorHandler {
  final Logger _logger;

  FirebaseAuthErrorHandler({required Logger logger}) : _logger = logger;

  Exception handle(dynamic e, StackTrace st, String operation) {
    if (e is FirebaseAuthException) {
      final appException = _mapToAppException(e);
      _logBasedOnSeverity(e, st, appException, operation);
      return appException;
    }

    _logger.e("UnexpectedAuthError: $operation", error: e, stackTrace: st);
    return UnknownAuthException(e.toString());
  }

  AuthException _mapToAppException(FirebaseAuthException exception) {
    final normalizedCode = exception.code.toLowerCase().replaceAll("_", "-");
    switch (normalizedCode) {
      case 'invalid-email':
        return InvalidEmailException();
      case 'email-already-in-use':
        return EmailAlreadyInUseException();
      case 'weak-password':
        return WeakPasswordException();
      case 'operation-not-allowed':
        return OperationNotAllowedException();
      case 'too-many-requests':
        return TooManyRequestsException();
      case 'user-token-expired':
        return UserTokenExpiredException();
      case 'network-request-failed':
        return NetworkRequestFailedException();
      case 'user-disabled':
        return UserDisabledException();
      case 'user-not-found':
        return UserNotFoundException();
      case 'wrong-password':
        return WrongPasswordException();
      case 'invalid-credential':
      case 'invalid-login-credentials':
        return InvalidLoginCredentialsException();
      default:
        return UnknownAuthException(normalizedCode);
    }
  }

  void _logBasedOnSeverity(
    FirebaseAuthException e,
    StackTrace st,
    Exception appException,
    String context,
  ) {
    // REPORT TO CRASHLYTICS
    if (appException is OperationNotAllowedException) {
      _logger.e(
        "CritAuthError [$context]: ${e.code}",
        error: e,
        stackTrace: st,
      );
      return;
    }

    // LOG WARNING
    if (appException is NetworkRequestFailedException ||
        appException is TooManyRequestsException) {
      _logger.w("Warn [$context]: ${e.code}", error: e, stackTrace: st);
      return;
    }

    // USER-DRIVEN FAILURES
    _logger.i("UserDrivenError [$context]: ${e.code}");
  }
}

/*

email-already-in-use:
  Thrown if there already exists an account with the given email address.
invalid-email:
  Thrown if the email address is not valid.
operation-not-allowed:
  Thrown if email/password accounts are not enabled. Enable email/password accounts in the Firebase Console, under the Auth tab.
weak-password:
  Thrown if the password is not strong enough.
user-token-expired:
  Thrown if the user is no longer authenticated since his refresh token has been expired
user-disabled:
  Thrown if the user corresponding to the given email has been disabled.
user-not-found:
  Thrown if there is no user corresponding to the given email.
wrong-password:
  Thrown if the password is invalid for the given email, or the account corresponding to the email does not have a password set.
too-many-requests:
  Thrown if the user sent too many requests at the same time, for security the api will not allow too many attempts at the same time, user will have to wait for some time
user-token-expired:
  Thrown if the user is no longer authenticated since his refresh token has been expired
network-request-failed:
  Thrown if there was a network request error, for example the user doesn't have internet connection
INVALID_LOGIN_CREDENTIALS or invalid-credential:
  Thrown if the password is invalid for the given email, or the account corresponding to the email does not have a password set. Depending on if you are using firebase emulator or not the code is different

*/
