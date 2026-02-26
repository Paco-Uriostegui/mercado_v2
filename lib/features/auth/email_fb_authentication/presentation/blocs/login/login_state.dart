import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.freezed.dart';

@freezed
sealed class LoginState with _$LoginState {
  const factory LoginState.initial() = _Initial;
  const factory LoginState.loading() = _Loading;
  const factory LoginState.success() = _Success;
  const factory LoginState.invalidEmailFormat() = _InvalidEmailFormat;
  const factory LoginState.invalidPasswordFormat() = _InvalidPasswordFormat;
  const factory LoginState.wrongPassword() = _WrongPassword;
  const factory LoginState.networkError() = _NetworkError;
  const factory LoginState.tooManyAttempts() = _TooManyAttempts;
  const factory LoginState.operationNotAllowed() = _OperationNotAllowed;
  const factory LoginState.userDisabled() = _UserDisabled;
    const factory LoginState.userNotFound() = _UserNotFound;
    const factory LoginState.unknown() = _Unknown;
    const factory LoginState.invalidLoginCredentials() = _InvalidLoginCredentials;

}
