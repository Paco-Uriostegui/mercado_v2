import 'package:mercado_v2/app/core/error/data_exceptions.dart';
import 'package:mercado_v2/app/core/error/failure.dart';

class DataExceptionMapper {
  AuthFailure fromAuthException(AuthException authException) {
    switch (authException) {
      case EmailAlreadyInUseException():
        return EmailAlreadyInUseFailure();
      case InvalidEmailException():
        return InvalidEmailFailure();
      case WeakPasswordException():
        return WeakPasswordFailure();
      case OperationNotAllowedException():
        return OperationNotAllowedFailure();
      case TooManyRequestsException():
        return TooManyRequestsFailure();
      case UserTokenExpiredException():
        return UserTokenExpiredFailure();
      case BackendUserIsNullException():
        return BackendUserIsNullFailure();
      case NetworkRequestFailedException():
        return NetworkRequestFailedFailure();
      case UserDisabledException():
        return UserDisabledFailure();
      case UserNotFoundException():
        return UserNotFoundFailure();
      case WrongPasswordException():
        return WrongPasswordFailure();
      case InvalidLoginCredentialsException():
        return InvalidLoginCredentialsFailure();
      case UnknownAuthException():
        return UnknownAuthFailure();
    }
  }
}
