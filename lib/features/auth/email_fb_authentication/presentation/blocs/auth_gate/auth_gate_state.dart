import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_gate_state.freezed.dart';

@freezed
sealed class AuthGateState with _$AuthGateState {
  const factory AuthGateState.loading() = _Loading;
  const factory AuthGateState.goToLogin() = _GoToLogin;
  const factory AuthGateState.goToVerifyEmail() = _GoToVerifyEmail;
}
