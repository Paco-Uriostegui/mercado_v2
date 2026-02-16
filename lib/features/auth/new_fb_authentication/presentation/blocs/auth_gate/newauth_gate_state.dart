
import 'package:freezed_annotation/freezed_annotation.dart';

part 'newauth_gate_state.freezed.dart';

@freezed
sealed class NewAuthGateState with _$NewAuthGateState {
  const factory NewAuthGateState.loading() = _Loading;
  const factory NewAuthGateState.goToLogin() = _GoToLogin;
  const factory NewAuthGateState.goToVerifyEmail() = _GoToVerifyEmail;

}