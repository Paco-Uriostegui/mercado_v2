import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_account_event.freezed.dart';

@freezed
sealed class CreateAccountEvent with _$CreateAccountEvent {
  const factory CreateAccountEvent.createAccountSubmitted({
    required String email,
    required String password,
  }) = CreateAccountSubmitted;
  const factory CreateAccountEvent.loginButtonPressed() = LoginButtonPressed;
  const factory CreateAccountEvent.restorePasswordButtonPressed() =
      RestorePasswordButtonPressed;
}
